`timescale 1ns / 1ps

module font_rom (
    input [7:0] char_code,  // ASCII code
    input [3:0] row,        // Row index (0 to 15 for 16x8 font)
    output reg [7:0] pixels // Pixel data for the row
);

    // Map 16-row range to 8-row font data using modulo operation
    wire [2:0] row_index = row % 8;

    always @(*) begin
        case (char_code)
            8'h3A: pixels = (row_index == 3'h0) ? 8'b00000000 :  // ':'
                (row_index == 3'h1) ? 8'b00011000 :
                (row_index == 3'h2) ? 8'b00011000 :
                (row_index == 3'h3) ? 8'b00000000 :
                (row_index == 3'h4) ? 8'b00000000 :
                (row_index == 3'h5) ? 8'b00011000 :
                (row_index == 3'h6) ? 8'b00011000 :
                (row_index == 3'h7) ? 8'b00000000 : 8'b00000000;
            8'h30: pixels = (row_index == 3'h0) ? 8'b00111100 :  // '0' h30
                           (row_index == 3'h1) ? 8'b01100110 :
                           (row_index == 3'h2) ? 8'b01100110 :
                           (row_index == 3'h3) ? 8'b01101110 :
                           (row_index == 3'h4) ? 8'b01110110 :
                           (row_index == 3'h5) ? 8'b01110010 :
                           (row_index == 3'h6) ? 8'b01100110 :
                           (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h31: pixels = (row_index == 3'h0) ? 8'b00011000 :  // '1' h31
                           (row_index == 3'h1) ? 8'b00111000 :
                           (row_index == 3'h2) ? 8'b00011000 :
                           (row_index == 3'h3) ? 8'b00011000 :
                           (row_index == 3'h4) ? 8'b00011000 :
                           (row_index == 3'h5) ? 8'b00011000 :
                           (row_index == 3'h6) ? 8'b00011000 :
                           (row_index == 3'h7) ? 8'b01111110 : 8'b00000000;
            8'h32: pixels = (row_index == 3'h0) ? 8'b00111100 :  // '2'
                           (row_index == 3'h1) ? 8'b01100110 :
                           (row_index == 3'h2) ? 8'b00000110 :
                           (row_index == 3'h3) ? 8'b00001100 :
                           (row_index == 3'h4) ? 8'b00110000 :
                           (row_index == 3'h5) ? 8'b01100000 :
                           (row_index == 3'h6) ? 8'b01111110 :
                           (row_index == 3'h7) ? 8'b00000000 : 8'b00000000;
            8'h33: pixels = (row_index == 3'h0) ? 8'b00111100 :  // '3'
                           (row_index == 3'h1) ? 8'b01100110 :
                           (row_index == 3'h2) ? 8'b00000110 :
                           (row_index == 3'h3) ? 8'b00011100 :
                           (row_index == 3'h4) ? 8'b00000110 :
                           (row_index == 3'h5) ? 8'b00000110 :
                           (row_index == 3'h6) ? 8'b01100110 :
                           (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h34: pixels = (row_index == 3'h0) ? 8'b00001100 :  // '4'
                           (row_index == 3'h1) ? 8'b00011100 :
                           (row_index == 3'h2) ? 8'b00111100 :
                           (row_index == 3'h3) ? 8'b01101100 :
                           (row_index == 3'h4) ? 8'b01111110 :
                           (row_index == 3'h5) ? 8'b00001100 :
                           (row_index == 3'h6) ? 8'b00001100 :
                           (row_index == 3'h7) ? 8'b00001100 : 8'b00000000;
            8'h35: pixels = (row_index == 3'h0) ? 8'b01111110 :  // '5'
                           (row_index == 3'h1) ? 8'b01100000 :
                           (row_index == 3'h2) ? 8'b01111100 :
                           (row_index == 3'h3) ? 8'b00000110 :
                           (row_index == 3'h4) ? 8'b00000110 :
                           (row_index == 3'h5) ? 8'b00000110 :
                           (row_index == 3'h6) ? 8'b01100110 :
                           (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h36: pixels = (row_index == 3'h0) ? 8'b00111100 :  // '6'
                           (row_index == 3'h1) ? 8'b01100110 :
                           (row_index == 3'h2) ? 8'b01100000 :
                           (row_index == 3'h3) ? 8'b01111100 :
                           (row_index == 3'h4) ? 8'b01100110 :
                           (row_index == 3'h5) ? 8'b01100110 :
                           (row_index == 3'h6) ? 8'b01100110 :
                           (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h37: pixels = (row_index == 3'h0) ? 8'b01111110 :  // '7'
                           (row_index == 3'h1) ? 8'b01100110 :
                           (row_index == 3'h2) ? 8'b00000110 :
                           (row_index == 3'h3) ? 8'b00001100 :
                           (row_index == 3'h4) ? 8'b00011000 :
                           (row_index == 3'h5) ? 8'b00011000 :
                           (row_index == 3'h6) ? 8'b00011000 :
                           (row_index == 3'h7) ? 8'b00011000 : 8'b00000000;
            8'h38: pixels = (row_index == 3'h0) ? 8'b00111100 :  // '8'
                           (row_index == 3'h1) ? 8'b01100110 :
                           (row_index == 3'h2) ? 8'b01100110 :
                           (row_index == 3'h3) ? 8'b01100110 :
                           (row_index == 3'h4) ? 8'b00111100 :
                           (row_index == 3'h5) ? 8'b01100110 :
                           (row_index == 3'h6) ? 8'b01100110 :
                           (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h39: pixels = (row_index == 3'h0) ? 8'b00111100 :  // '9'
                           (row_index == 3'h1) ? 8'b01100110 :
                           (row_index == 3'h2) ? 8'b01100110 :
                           (row_index == 3'h3) ? 8'b01100110 :
                           (row_index == 3'h4) ? 8'b00111110 :
                           (row_index == 3'h5) ? 8'b00000110 :
                           (row_index == 3'h6) ? 8'b01100110 :
                           (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h41: pixels = (row_index == 3'h0) ? 8'b00011000 :  // 'A'
                               (row_index == 3'h1) ? 8'b00111100 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01100110 :
                               (row_index == 3'h4) ? 8'b01111110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b01100110 : 8'b00000000;
            8'h42: pixels = (row_index == 3'h0) ? 8'b01111100 :  // 'B'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01111100 :
                               (row_index == 3'h4) ? 8'b01100110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b01111100 : 8'b00000000;
            8'h43: pixels = (row_index == 3'h0) ? 8'b00111100 :  // 'C'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100000 :
                               (row_index == 3'h3) ? 8'b01100000 :
                               (row_index == 3'h4) ? 8'b01100000 :
                               (row_index == 3'h5) ? 8'b01100000 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h44: pixels = (row_index == 3'h0) ? 8'b01111100 :  // 'D'
                               (row_index == 3'h1) ? 8'b01101100 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01100110 :
                               (row_index == 3'h4) ? 8'b01100110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b01101100 :
                               (row_index == 3'h7) ? 8'b01111100 : 8'b00000000;
            8'h45: pixels = (row_index == 3'h0) ? 8'b01111110 :  // 'E'
                               (row_index == 3'h1) ? 8'b01100000 :
                               (row_index == 3'h2) ? 8'b01100000 :
                               (row_index == 3'h3) ? 8'b01111100 :
                               (row_index == 3'h4) ? 8'b01100000 :
                               (row_index == 3'h5) ? 8'b01100000 :
                               (row_index == 3'h6) ? 8'b01100000 :
                               (row_index == 3'h7) ? 8'b01111110 : 8'b00000000;
            8'h46: pixels = (row_index == 3'h0) ? 8'b01111110 :  // 'F'
                               (row_index == 3'h1) ? 8'b01100000 :
                               (row_index == 3'h2) ? 8'b01100000 :
                               (row_index == 3'h3) ? 8'b01111100 :
                               (row_index == 3'h4) ? 8'b01100000 :
                               (row_index == 3'h5) ? 8'b01100000 :
                               (row_index == 3'h6) ? 8'b01100000 :
                               (row_index == 3'h7) ? 8'b01100000 : 8'b00000000;
            8'h47: pixels = (row_index == 3'h0) ? 8'b00111100 :  // 'G'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100000 :
                               (row_index == 3'h3) ? 8'b01100000 :
                               (row_index == 3'h4) ? 8'b01101110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b00111110 : 8'b00000000;
            8'h48: pixels = (row_index == 3'h0) ? 8'b01100110 :  // 'H'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01111110 :
                               (row_index == 3'h4) ? 8'b01100110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b01100110 : 8'b00000000;
            8'h49: pixels = (row_index == 3'h0) ? 8'b00111110 :  // 'I'
                               (row_index == 3'h1) ? 8'b00011000 :
                               (row_index == 3'h2) ? 8'b00011000 :
                               (row_index == 3'h3) ? 8'b00011000 :
                               (row_index == 3'h4) ? 8'b00011000 :
                               (row_index == 3'h5) ? 8'b00011000 :
                               (row_index == 3'h6) ? 8'b00011000 :
                               (row_index == 3'h7) ? 8'b00111110 : 8'b00000000;
            8'h4A: pixels = (row_index == 3'h0) ? 8'b00001110 :  // 'J'
                               (row_index == 3'h1) ? 8'b00000110 :
                               (row_index == 3'h2) ? 8'b00000110 :
                               (row_index == 3'h3) ? 8'b00000110 :
                               (row_index == 3'h4) ? 8'b00000110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h4B: pixels = (row_index == 3'h0) ? 8'b01100110 :  // 'K'
                       (row_index == 3'h1) ? 8'b01101100 :
                       (row_index == 3'h2) ? 8'b01111000 :
                       (row_index == 3'h3) ? 8'b01110000 :
                       (row_index == 3'h4) ? 8'b01111000 :
                       (row_index == 3'h5) ? 8'b01101100 :
                       (row_index == 3'h6) ? 8'b01100110 :
                       (row_index == 3'h7) ? 8'b01100110 : 8'b00000000;
            8'h4C: pixels = (row_index == 3'h0) ? 8'b01100000 :  // 'L'
                               (row_index == 3'h1) ? 8'b01100000 :
                               (row_index == 3'h2) ? 8'b01100000 :
                               (row_index == 3'h3) ? 8'b01100000 :
                               (row_index == 3'h4) ? 8'b01100000 :
                               (row_index == 3'h5) ? 8'b01100000 :
                               (row_index == 3'h6) ? 8'b01100000 :
                               (row_index == 3'h7) ? 8'b01111110 : 8'b00000000;
            8'h4D: pixels = (row_index == 3'h0) ? 8'b01100011 :  // 'M'
                               (row_index == 3'h1) ? 8'b01110111 :
                               (row_index == 3'h2) ? 8'b01111111 :
                               (row_index == 3'h3) ? 8'b01101011 :
                               (row_index == 3'h4) ? 8'b01100011 :
                               (row_index == 3'h5) ? 8'b01100011 :
                               (row_index == 3'h6) ? 8'b01100011 :
                               (row_index == 3'h7) ? 8'b01100011 : 8'b00000000;
            8'h4E: pixels = (row_index == 3'h0) ? 8'b01100011 :  // 'N'
                               (row_index == 3'h1) ? 8'b01110011 :
                               (row_index == 3'h2) ? 8'b01111011 :
                               (row_index == 3'h3) ? 8'b01101111 :
                               (row_index == 3'h4) ? 8'b01100111 :
                               (row_index == 3'h5) ? 8'b01100011 :
                               (row_index == 3'h6) ? 8'b01100011 :
                               (row_index == 3'h7) ? 8'b01100011 : 8'b00000000;
            8'h4F: pixels = (row_index == 3'h0) ? 8'b00111100 :  // 'O'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01100110 :
                               (row_index == 3'h4) ? 8'b01100110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h50: pixels = (row_index == 3'h0) ? 8'b01111100 :  // 'P'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01111100 :
                               (row_index == 3'h4) ? 8'b01100000 :
                               (row_index == 3'h5) ? 8'b01100000 :
                               (row_index == 3'h6) ? 8'b01100000 :
                               (row_index == 3'h7) ? 8'b01100000 : 8'b00000000;
            8'h51: pixels = (row_index == 3'h0) ? 8'b00111100 :  // 'Q'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01100110 :
                               (row_index == 3'h4) ? 8'b01100110 :
                               (row_index == 3'h5) ? 8'b01101110 :
                               (row_index == 3'h6) ? 8'b00111100 :
                               (row_index == 3'h7) ? 8'b00000110 : 8'b00000000;
            8'h52: pixels = (row_index == 3'h0) ? 8'b01111100 :  // 'R'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01111100 :
                               (row_index == 3'h4) ? 8'b01111000 :
                               (row_index == 3'h5) ? 8'b01101100 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b01100110 : 8'b00000000;
            8'h53: pixels = (row_index == 3'h0) ? 8'b00111110 :  // 'S'
                               (row_index == 3'h1) ? 8'b01100000 :
                               (row_index == 3'h2) ? 8'b01100000 :
                               (row_index == 3'h3) ? 8'b00111100 :
                               (row_index == 3'h4) ? 8'b00000110 :
                               (row_index == 3'h5) ? 8'b00000110 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h54: pixels = (row_index == 3'h0) ? 8'b01111110 :  // 'T'
                               (row_index == 3'h1) ? 8'b00011000 :
                               (row_index == 3'h2) ? 8'b00011000 :
                               (row_index == 3'h3) ? 8'b00011000 :
                               (row_index == 3'h4) ? 8'b00011000 :
                               (row_index == 3'h5) ? 8'b00011000 :
                               (row_index == 3'h6) ? 8'b00011000 :
                               (row_index == 3'h7) ? 8'b00011000 : 8'b00000000;
            8'h55: pixels = (row_index == 3'h0) ? 8'b01100110 :  // 'U'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01100110 :
                               (row_index == 3'h4) ? 8'b01100110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b00111100 : 8'b00000000;
            8'h56: pixels = (row_index == 3'h0) ? 8'b01100110 :  // 'V'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b01100110 :
                               (row_index == 3'h4) ? 8'b01100110 :
                               (row_index == 3'h5) ? 8'b01100110 :
                               (row_index == 3'h6) ? 8'b00111100 :
                               (row_index == 3'h7) ? 8'b00011000 : 8'b00000000;
            8'h57: pixels = (row_index == 3'h0) ? 8'b01100011 :  // 'W'
                               (row_index == 3'h1) ? 8'b01100011 :
                               (row_index == 3'h2) ? 8'b01100011 :
                               (row_index == 3'h3) ? 8'b01100011 :
                               (row_index == 3'h4) ? 8'b01101011 :
                               (row_index == 3'h5) ? 8'b01111111 :
                               (row_index == 3'h6) ? 8'b01110111 :
                               (row_index == 3'h7) ? 8'b01100011 : 8'b00000000;
            8'h58: pixels = (row_index == 3'h0) ? 8'b01100110 :  // 'X'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b00111100 :
                               (row_index == 3'h3) ? 8'b00011000 :
                               (row_index == 3'h4) ? 8'b00011000 :
                               (row_index == 3'h5) ? 8'b00111100 :
                               (row_index == 3'h6) ? 8'b01100110 :
                               (row_index == 3'h7) ? 8'b01100110 : 8'b00000000;
            8'h59: pixels = (row_index == 3'h0) ? 8'b01100110 :  // 'Y'
                               (row_index == 3'h1) ? 8'b01100110 :
                               (row_index == 3'h2) ? 8'b01100110 :
                               (row_index == 3'h3) ? 8'b00111100 :
                               (row_index == 3'h4) ? 8'b00011000 :
                               (row_index == 3'h5) ? 8'b00011000 :
                               (row_index == 3'h6) ? 8'b00011000 :
                               (row_index == 3'h7) ? 8'b00011000 : 8'b00000000;
            8'h5A: pixels = (row_index == 3'h0) ? 8'b01111110 :  // 'Z'
                               (row_index == 3'h1) ? 8'b00000110 :
                               (row_index == 3'h2) ? 8'b00001100 :
                               (row_index == 3'h3) ? 8'b00011000 :
                               (row_index == 3'h4) ? 8'b00110000 :
                               (row_index == 3'h5) ? 8'b01100000 :
                               (row_index == 3'h6) ? 8'b01111110 :
                               (row_index == 3'h7) ? 8'b01111110 : 8'b00000000;        
                
            default: pixels = 8'b00000000; // Blank for undefined characters
        endcase
    end
endmodule
