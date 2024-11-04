`timescale 1ns/10ps
module practicum
  #
  (
   parameter NUM_SEGMENTS = 8,
   parameter CLK_PER      = 10,   // Clock period in ns
   parameter REFR_RATE    = 1000, // Refresh rate in Hz
   parameter ASYNC_BUTTON = "SAFE" // Only "SAFE" mode remains
   )
  (
   input wire                      clk,
   input wire                      BTNC,
   input wire                      CPU_RESETN,  // External reset signal
   output logic [NUM_SEGMENTS-1:0] anode,
   output logic [7:0]              cathode,
   output [1:0]                    LED
   );

  // Internal signals
  logic [NUM_SEGMENTS-1:0][3:0]    encoded;
  logic [NUM_SEGMENTS-1:0]         digit_point;
  logic                            reset;  // Internal reset signal
  (* ASYNC_REG = "TRUE" *) logic [1:0] reset_sync = '1;

  // State-related variables
  typedef enum logic [3:0] {
    F = 4'hF,
    SEVEN = 4'h7,
    FOUR = 4'h4,
    A = 4'hA,
    D = 4'hD,
    FIVE = 4'h5,
    C = 4'hC,
    ONE = 4'h1
  } state_t;

  reg [NUM_SEGMENTS-1:0][3:0] current_state;
  logic button_pressed;
  logic enable_state_change;
  logic show_full_sequence;  // Flag to indicate when to display full sequence
  logic [2:0] display_index; // Index for the 8 segments

  // Constants
  localparam CLK_FREQ = 100_000_000;  // Assuming a 100 MHz clock
  localparam SEQUENCE_LENGTH = 8;     // 8 states in the sequence

  // Sequence of states to display
  state_t state_sequence [SEQUENCE_LENGTH-1:0];
  initial begin
    state_sequence[0] = F;
    state_sequence[1] = SEVEN;
    state_sequence[2] = FOUR;
    state_sequence[3] = A;
    state_sequence[4] = D;
    state_sequence[5] = FIVE;
    state_sequence[6] = C;
    state_sequence[7] = ONE;
    encoded     = '0;
    digit_point = '1;
  end

  // Button-driven reset logic
  always_ff @(posedge clk) begin
    reset_sync <= {reset_sync[0], ~CPU_RESETN};  // Synchronize CPU_RESETN signal
    reset <= reset_sync[1];  // The final reset signal
  end

  assign LED[0] = button_pressed; //For debug
  
  assign button_pressed = BTNC;
  
  wire clk_1Hz;
  assign LED[1] = clk_1Hz;
  
  clock_divider_1Hz u_clock_divider (
    .clk(clk),
    .rst_n(reset),
    .clk_1Hz(clk_1Hz)
  );
  
  // Update current state and encoded values in a single always block
  always_ff @(posedge clk_1Hz or posedge reset) begin
    if (reset) begin
      current_state <= F;
      display_index <= 0;
      show_full_sequence <= 1'b0;
      enable_state_change <= 1'b1;
      encoded <= '0;
    end else if (enable_state_change) begin
      if (display_index == SEQUENCE_LENGTH-1) begin
        show_full_sequence <= 1'b1;
        display_index <= 0;
        enable_state_change <= 0;
      end else begin
        current_state <= state_sequence[display_index];
        display_index <= display_index + 1;
        // Update encoded for current state
        encoded[0] <= state_sequence[display_index];  // Binary LSB
        encoded[3] <= state_sequence[display_index];  // Binary MSB
      end
    end else if (show_full_sequence && button_pressed) begin
      // Restart the sequence when the full sequence is displayed, and BTNC is pressed
      show_full_sequence <= 1'b0;
      display_index <= 0;
      current_state <= state_sequence[0]; // Reset to the first state
      enable_state_change <= 1'b1;
    end
  end
endmodule

// Clock Divider
module clock_divider_1Hz (
    input wire clk,         // 50 MHz input clock
    input wire rst_n,       // Asynchronous active-low reset
    output reg clk_1Hz      // 1Hz output clock
);

    // Parameter to divide 50 MHz down to 1 Hz
    parameter COUNTER_MAX = 500_000 / 2 - 1;  // 25 million clock cycles for a half-period

    reg [25:0] counter;  // 26-bit counter to handle division to 1Hz

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset the counter and the output clock
            counter <= 0;
            clk_1Hz <= 0;
        end else if (counter == COUNTER_MAX) begin
            // When the counter reaches the max value, toggle the output clock and reset the counter
            counter <= 0;
            clk_1Hz <= ~clk_1Hz;
        end else begin
            // Increment the counter
            counter <= counter + 1;
        end
    end

endmodule
