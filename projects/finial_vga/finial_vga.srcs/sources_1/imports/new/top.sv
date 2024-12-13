`timescale 1ns / 1ps

module vgatop (clk, VGA_VS, VGA_HS, VGA_R, VGA_G, VGA_B);

    input clk;
    output VGA_VS, VGA_HS;
    output [3:0] VGA_R, VGA_G, VGA_B;

    wire inDisplay;
    wire [9:0] xpos, ypos;

    // Instantiate vgasync
    vgasync v1 (
        .clk(clk),
        .hsync(VGA_HS),
        .vsync(VGA_VS),
        .xCount(xpos),
        .yCount(ypos),
        .inDisplay(inDisplay)
    );

    // Font ROM instance
    reg [7:0] char_code;
    reg [2:0] row;
    wire [7:0] pixels;

    font_rom font (
        .char_code(char_code),
        .row(row),
        .pixels(pixels)
    );

    // Define the text to display ("Center: 1234")
    reg [7:0] text[11:0]; // 12 characters: "Center: 1234"
    initial begin
        text[0]  = 8'h43; // 'C'
        text[1]  = 8'h45; // 'E'
        text[2]  = 8'h4E; // 'N'
        text[3]  = 8'h54; // 'T'
        text[4]  = 8'h45; // 'E'
        text[5]  = 8'h52; // 'R'
        text[6]  = 8'h3A; // ':'
        text[7]  = 8'h20; // ' '
        text[8]  = 8'h30; // '0'
        text[9]  = 8'h31; // '1'
        text[10] = 8'h33; // '3'
        text[11] = 8'h32; // '2'
    end

    // Centering calculations
    localparam TEXT_WIDTH = 12; // Number of characters in the string
    localparam CHAR_CELL_WIDTH = 8; // Each character is 8 pixels wide
    localparam SCREEN_WIDTH = 640; // VGA screen width in pixels
    localparam START_X = (SCREEN_WIDTH - (TEXT_WIDTH * CHAR_CELL_WIDTH)) / 2; // Starting xpos for centering

    localparam TEXT_HEIGHT = 8; // Character height in pixels
    localparam SCREEN_HEIGHT = 480; // VGA screen height in pixels
    localparam START_Y = (SCREEN_HEIGHT - TEXT_HEIGHT) / 2; // Starting ypos for vertical centering

    // Determine the current character cell
    reg [3:0] char_index; // Index into the text array (0 to 11)
    always @(*) begin
        if (xpos >= START_X && xpos < START_X + (TEXT_WIDTH * CHAR_CELL_WIDTH) &&
            ypos >= START_Y && ypos < START_Y + TEXT_HEIGHT) begin
            char_index = (xpos - START_X) / CHAR_CELL_WIDTH; // Map xpos to character index
            char_code = text[char_index];                   // Select character from text array
            row = (ypos - START_Y) % TEXT_HEIGHT;           // Map ypos to row in font
        end else begin
            char_index = 0;
            char_code = 8'h20; // Space (blank character)
            row = 0;
        end
    end


    // Generate pixel output
    assign VGA_R = (inDisplay && xpos >= START_X && xpos < START_X + (TEXT_WIDTH * CHAR_CELL_WIDTH) &&
                    ypos >= START_Y && ypos < START_Y + TEXT_HEIGHT &&
                    pixels[7 - (xpos % 8)]) ? 4'hF : 4'h0;
    assign VGA_G = VGA_R; // White color
    assign VGA_B = VGA_R;

endmodule
