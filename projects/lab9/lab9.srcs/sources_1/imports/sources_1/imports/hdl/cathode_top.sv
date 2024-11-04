// cathode_top.sv
// ------------------------------------
// Drive the cathodes of 7 segment display
// ------------------------------------
//
// input the encoded value from 0-F and generate the cathode signals
`timescale 1ns/10ps
module cathode_top
  (
   input wire         clk,
   input wire [7:0]   encoded,
   input wire         digit_point,
   output logic [7:0] cathode
   );

    always_ff @(posedge clk) begin
  cathode[7] <= digit_point;
  case (encoded)
    8'h00: cathode[6:0] <= 7'b1000000; // '0'
    8'h01: cathode[6:0] <= 7'b1111001; // '1'
    8'h02: cathode[6:0] <= 7'b0100100; // '2'
    8'h03: cathode[6:0] <= 7'b0110000; // '3'
    8'h04: cathode[6:0] <= 7'b0011001; // '4'
    8'h05: cathode[6:0] <= 7'b0010010; // '5'
    8'h06: cathode[6:0] <= 7'b0000010; // '6'
    8'h07: cathode[6:0] <= 7'b1111000; // '7'
    8'h08: cathode[6:0] <= 7'b0000000; // '8'
    8'h09: cathode[6:0] <= 7'b0010000; // '9'
    8'h0A: cathode[6:0] <= 7'b0001000; // 'A'
    8'h0B: cathode[6:0] <= 7'b0000011; // 'b'
    8'h0C: cathode[6:0] <= 7'b1000110; // 'C'
    8'h0D: cathode[6:0] <= 7'b0100001; // 'd'
    8'h0E: cathode[6:0] <= 7'b0000110; // 'E'
    8'h0F: cathode[6:0] <= 7'b0001110; // 'F'
    8'h10: cathode[6:0] <= 7'b1000010; // 'G'
    8'h11: cathode[6:0] <= 7'b1000111; // 'L'
    8'h12: cathode[6:0] <= 7'b0000110; // 'E'
    8'h13: cathode[6:0] <= 7'b1001000; // 'H'
    8'h14: cathode[6:0] <= 7'b0001100; // 'P'
    8'h15: cathode[6:0] <= 7'b1110111; // 'r'
    8'h16: cathode[6:0] <= 7'b0000111; // 'T'
    default: cathode[6:0] <= 7'b1111111; // Blank
  endcase
end



endmodule
