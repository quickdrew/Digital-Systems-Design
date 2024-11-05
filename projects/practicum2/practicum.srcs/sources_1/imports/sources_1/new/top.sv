`timescale 1ns/10ps
module practicum
  #(
   parameter NUM_SEGMENTS = 8,
   parameter CLK_PER      = 10,
   parameter REFR_RATE    = 1000
  )
  (
   input wire                      clk,
   input wire                      BTNC,
   input wire                      CPU_RESETN,
   output wire                     LED,
   output logic [NUM_SEGMENTS-1:0] anode,
   output logic [7:0]              cathode
   );

  logic [NUM_SEGMENTS-1:0][7:0] encoded;
  logic [NUM_SEGMENTS-1:0]      digit_point;
  logic                         reset;

  assign reset = !CPU_RESETN;  // Tie reset to CPU_RESETN
  assign LED = clk_1Hz;   
   
  wire clk_1Hz;  
  clock_divider_1Hz u_clock_divider (
    .clk(clk),
    .clk_1Hz(clk_1Hz)
  );
  
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
  
  logic [3:0] current_state;
  logic [4:0] display_index; // Index for the 8 segments
  logic sequence_active, sequence_finished;     // Flag to keep the sequence running

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
  
  // Update current state and encoded values based on button press
  always_ff @(posedge clk_1Hz or posedge reset) begin
    if (reset || (sequence_finished && BTNC)) begin
      current_state <= 0;
      display_index <= 0;
      sequence_active <= 1'b0;
      sequence_finished <= 1'b0;
      encoded <= '0;
    end else if (sequence_finished) begin
    // Show entire sequence
        integer i, j;
        for (i = 0; i < SEQUENCE_LENGTH; i = i + 1) begin
            if (i == 0) begin
                j = SEQUENCE_LENGTH - 1;
            end else begin
                j = j - 1;
            end 
            
            encoded[i] <= state_sequence[j];  // Assign each element to its index value            
        end        
    end else if (BTNC && !sequence_active) begin
      // Start the sequence when button is pressed, if not already active
      sequence_active <= 1'b1;
      display_index <= 0;
      current_state <= state_sequence[0];
    end else if (sequence_active) begin
      // Show the next state in the sequence
      current_state <= state_sequence[display_index];
                
      // Expand current state into the 4-bit segments
      encoded[0] <= current_state[0];
      encoded[1] <= current_state[1];
      encoded[2] <= current_state[2];
      encoded[3] <= current_state[3];
      encoded[4] <= current_state; // Hex

      // Advance index, wrap around if necessary, and stop at the end
      if (display_index >= SEQUENCE_LENGTH) begin
        sequence_active <= 1'b0;  // Sequence complete, stop the sequence
        sequence_finished <= 1'b1; // Show the entire sequence
      end else begin
        display_index <= display_index + 1;
      end
    end
  end

  // Instantiate seven_segment module
  seven_segment #(
    .NUM_SEGMENTS(NUM_SEGMENTS),
    .CLK_PER(CLK_PER),
    .REFR_RATE(REFR_RATE)
  ) u_7seg (
    .clk(clk),
    .reset(reset),
    .encoded(encoded),
    .digit_point(digit_point),
    .anode(anode),
    .cathode(cathode)
  );
endmodule


// Clock Divider for 100 MHz to 1 Hz
module clock_divider_1Hz (
    input wire clk,         // 100 MHz input clock from Nexys 4
    output reg clk_1Hz      // 1 Hz output clock
);

    // Parameter to divide 100 MHz down to 1 Hz
    parameter COUNTER_MAX = 50_000_000 - 1;  // 50 million clock cycles for a half-period

    reg [25:0] counter;  // 26-bit counter to handle division to 1 Hz

    always @(posedge clk) begin
        if (counter == COUNTER_MAX) begin
            // When the counter reaches the max value, toggle the output clock and reset the counter
            counter <= 0;
            clk_1Hz <= ~clk_1Hz;
        end else begin
            // Increment the counter
            counter <= counter + 1;
        end
    end

endmodule

