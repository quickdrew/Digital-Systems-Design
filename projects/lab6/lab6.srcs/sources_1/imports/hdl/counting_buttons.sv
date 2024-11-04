// counting_buttons.sv

`timescale 1ns/10ps
module counting_buttons
  #
  (
   parameter MODE         = "HEX", // or "DEC"
   parameter NUM_SEGMENTS = 8,
   parameter CLK_PER      = 10,   // Clock period in ns
   parameter REFR_RATE    = 1000, // Refresh rate in Hz
   parameter ASYNC_BUTTON = "SAFE" // "CLOCK", "NOCLOCK", "SAFE", "DEBOUNCE"
   )
  (
   input wire                      clk,
   input wire                      BTNC, // Add one
   input wire                      BTNU, // Load SW
 //  input wire                      BTNR, // Multiply by SW
//   input wire                      BTND, // Divide by SW
   input wire                      CPU_RESETN,
   input wire [15:0]               SW,     // Switch inputs: SW[15:11] for address, SW[7:0] for data
   output logic [NUM_SEGMENTS-1:0] anode,
   output logic [7:0]              cathode
   );

  logic [NUM_SEGMENTS-1:0][3:0]       encoded;
  logic [NUM_SEGMENTS-1:0]            digit_point;
  (* ASYNC_REG = "TRUE" *) logic [1:0]reset_sync = '1;
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
  logic                               button_down_SW;
  //logic                               button_down_R;
//  logic                               button_down_D;

initial begin
    last_button = 1'b0;        // Use 1'b0 for a single-bit signal
    button      = 1'b0;        // Correct initialization for single-bit signal
    button_down = 1'b0;        // Correct initialization
    button_down_SW = 1'b0;     // Correct initialization for BTNU debounce signal
//    button_down_R = 1'b0;
//    button_down_D = 1'b0;
end

  generate
    if (ASYNC_BUTTON == "SAFE") begin : g_CLOCK
      (* ASYNC_REG = "TRUE", mark_debug = "true" *) logic [2:0] button_sync;
      logic [2:0] button_sync_SW;  // New shift register for BTNU
//      logic [2:0] button_sync_R;  // New shift register for BTNR
//      logic [2:0] button_sync_D;  // New shift register for BTND

      always @(posedge clk) begin
        // BTNC handling
        button_down <= '0;
        button_sync <= button_sync << 1 | BTNC;
        if (button_sync[2:1] == 2'b01) button_down <= '1;
        else button_down <= '0;

        // BTNU handling
        button_down_SW <= '0;
        button_sync_SW <= button_sync_SW << 1 | BTNU;
        if (button_sync_SW[2:1] == 2'b01) button_down_SW <= '1;
        else button_down_SW <= '0;
        
        // BTNR handling
//        button_down_R <= '0;
//        button_sync_R <= button_sync_R << 1 | BTNR;
//        if (button_sync_R[2:1] == 2'b01) button_down_R <= '1;
//        else button_down_R <= '0;
        
//        // BTND handling
//        button_down_D <= '0;
//        button_sync_D <= button_sync_D << 1 | BTND;
//        if (button_sync_D[2:1] == 2'b01) button_down_D <= '1;
//        else button_down_D <= '0;
      end

    end else if (ASYNC_BUTTON == "DEBOUNCE") begin : g_CLOCK
      (* ASYNC_REG = "TRUE", mark_debug = "true" *) logic [2:0] button_sync;
      (* mark_debug = "true" *) logic       counter_en;
      (* mark_debug = "true" *) logic [7:0] counter;

      always @(posedge clk) begin
        button_down <= '0;
        button_sync <= button_sync << 1 | BTNC;
        if (button_sync[2:1] == 2'b01) counter_en <= '1;
        else if (~button_sync[1]) begin
          counter_en <= '0;
          counter    <= '0;
        end
        if (counter_en) begin
          counter <= counter + 1'b1;
          if (&counter) begin
            counter_en <= '0;
            counter    <= '0;
            button_down <= '1;
          end
        end
        if (reset) begin
          counter_en  <= '0;
          counter     <= '0;
          button_down <= '0;
        end
      end
    end else begin : g_NOCLOCK
      always @(posedge clk) begin
        last_button                             <= button;
        button                                  <= BTNC;
        if (BTNC & ~button) button_down <= '1;
        else button_down <= '0;
      end
    end
  endgenerate

  initial begin
    encoded     = '0;
    digit_point = '1;
  end

  // Reset Synchronizer
  always_ff @(posedge clk) reset_sync <= {reset_sync[0], ~CPU_RESETN};
  assign reset = reset_sync[1];
  logic signed [15:0] twos_complement;
  assign twos_complement = ~SW; 
  
    always @(posedge clk) begin
        if (button_down) encoded <= (MODE == "HEX") ? encoded + 1'b1 : dec_inc(encoded);
        if (button_down_SW) encoded <= {twos_complement, SW}; // Concatenate SW (upper 4 bits) and twos_complement (lower 4 bits)

//        if (button_down_SW) encoded <= SW; // Load value from switches
//        if (button_down_R) encoded <= twos_complement; 
//        if (button_down_D && SW != 0) encoded <= (encoded / SW); // Divide, only if SW is not zero
        if (reset) begin
          encoded     <= '0;
          digit_point <= '1;
        end
    end


  // Decimal increment function
  function [NUM_SEGMENTS-1:0][3:0] dec_inc;
    input [NUM_SEGMENTS-1:0][3:0] din;
    bit [3:0]                     next_val;
    bit                           carry_in;
    carry_in = '1;
    for (int i = 0; i < NUM_SEGMENTS; i++) begin
      next_val = din[i] + carry_in;
      if (next_val > 9) begin
        dec_inc[i] = '0;
        carry_in   = '1;
      end else begin
        dec_inc[i] = next_val;
        carry_in   = '0;
      end
    end // for (int i = 0; i < NUM_SEGMENTS; i++)
  endfunction // dec_inc

endmodule // counting_buttons
