`timescale 1ns/10ps
module counting_state_machine
  #
  (
   parameter NUM_SEGMENTS = 8,
   parameter CLK_PER      = 10,   // Clock period in ns
   parameter REFR_RATE    = 1000, // Refresh rate in Hz
   parameter ASYNC_BUTTON = "SAFE" // "CLOCK", "NOCLOCK", "SAFE", "DEBOUNCE"
   )
  (
   input wire                      clk,
   input wire                      BTNC,    // Change state
   input wire                      CPU_RESETN,
   input wire [15:0]               SW,      // Switch inputs: SW[15:11] for address, SW[7:0] for data
   output logic [NUM_SEGMENTS-1:0] anode,
   output logic [7:0]              cathode,
   output reg [NUM_SEGMENTS-1:0][3:0] encoded  // State machine output to seven-segment display
   );
   
  logic [NUM_SEGMENTS-1:0][3:0]       encoded;
  logic [NUM_SEGMENTS-1:0]            digit_point;
  logic                               reset;

  seven_segment
    #
    (
     .NUM_SEGMENTS (NUM_SEGMENTS),
     .CLK_PER      (CLK_PER),   // Clock period in ns
     .REFR_RATE    (REFR_RATE)  // Refresh rate in Hz
     )
  u_7seg
    (
     .clk          (clk),
     .reset        (reset),
     .encoded      (encoded),
     .digit_point  (digit_point),
     .anode        (anode),
     .cathode      (cathode)
     );
     
     
  // Capture the rising edge of button press
  logic                               last_button;
  logic                               button;
  (* mark_debug = "true" *) logic     button_down;
  
  initial begin
    last_button = 1'b0;        // Initialize single-bit signals
    button      = 1'b0;        
    button_down = 1'b0;        
  end
  
  generate
    if (ASYNC_BUTTON == "SAFE") begin : g_CLOCK
      (* ASYNC_REG = "TRUE", mark_debug = "true" *) logic [2:0] button_sync;

      always @(posedge clk) begin
        // BTNC handling (Move to the next state)
        button_down <= 1'b0;  // Reset button_down
        button_sync <= {button_sync[1:0], BTNC};  // Shift in BTNC state
        if (button_sync[2:1] == 2'b01) 
          button_down <= 1'b1;  // Button pressed
        else 
          button_down <= 1'b0;  // No button press detected
      end

    end else begin : g_NOCLOCK
      always @(posedge clk) begin
        last_button <= button;
        button      <= BTNC;
        if (BTNC & ~last_button) 
          button_down <= 1'b1;  // Button pressed (detect rising edge)
        else 
          button_down <= 1'b0;
      end
    end
  endgenerate
   
  // Define states
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

  // State variables
  reg [1:0] state, next_state;
  logic [2:0] Z;  // Output from state machine to encoded

  // Use SW[2:0] as input for state transitions
  wire [2:0] sw_input = SW[2:0];  // Use the lowest 3 bits of SW for state transitions

  // Button handling logic
  (* ASYNC_REG = "TRUE" *) logic [2:0] button_sync;

  // State machine next state logic
  always @(posedge clk or negedge CPU_RESETN) begin
    if (!CPU_RESETN) begin
      state <= S0;  // Start in state S0 on reset
    end else if (button_down) begin
      state <= next_state;
    end
  end

  initial begin
    encoded     = '0;
    digit_point = '1;
  end
  
  // State transition logic
  always @(*) begin
    case (state)
      S0: begin
        case (sw_input)
          3'b000: begin
            next_state = S1;
            Z = 3'b010; 
          end
          3'b001: begin
            next_state = S1;
            Z = 3'b010; 
          end
          3'b010: begin
            next_state = S2;
            Z = 3'b101; 
          end
          3'b011: begin
            next_state = S1;
            Z = 3'b001;  
          end
          3'b100: begin
            next_state = S1;
            Z = 3'b010;  
          end
          3'b101: begin
            next_state = S1;
            Z = 3'b010;  
          end
          3'b110: begin
            next_state = S2;
            Z = 3'b000;  // Set Z based on transition for S0
          end
          3'b111: begin
            next_state = S2;
            Z = 3'b101;  
          end
          default: begin
            next_state = S0;
          end
        endcase
      end
      S1: begin
        Z = 3'b001;
        case (sw_input)
          3'b000: next_state = S1;
          3'b001: next_state = S1;
          3'b010: next_state = S2;
          3'b011: next_state = S2;
          3'b100: next_state = S1;
          3'b101: next_state = S1;
          3'b110: next_state = S2;
          3'b111: next_state = S2;
          default: next_state = S1;
        endcase
      end
      S2: begin
        Z = 3'b001;
        case (sw_input)
          3'b000: next_state = S1;
          3'b001: next_state = S0;
          3'b010: next_state = S1;
          3'b011: next_state = S0;
          3'b100: next_state = S1;
          3'b101: next_state = S0;
          3'b110: next_state = S1;
          3'b111: next_state = S0;
          default: next_state = S2;
        endcase
      end
      default: next_state = S0;
    endcase
  end

  // Seven-segment display encoding
  always @(posedge clk) begin
    if (button_down) begin
      encoded <= Z; 
    end
    if (!CPU_RESETN) begin
      encoded <= 4'b0000;  // Reset encoded display
    end
  end

endmodule
