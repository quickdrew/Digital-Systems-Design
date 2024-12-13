module vgatop (CLK, VGA_VS, VGA_HS, VGA_R, VGA_G, VGA_B, DIST, centerDIST);

    input CLK;
    output VGA_VS, VGA_HS;
    output [3:0] VGA_R, VGA_G, VGA_B;
    input [15:0] DIST, centerDIST;

    wire inDisplay;
    wire [9:0] xpos, ypos;

    // Registers for input values
    reg [15:0] Distance;
    reg [15:0] centerDistance;

    always @(posedge CLK) begin
        Distance <= DIST;
        centerDistance <= centerDIST;
    end

    // Instantiate VGA synchronization module
    vgasync v1 (
        .clk(CLK),
        .hsync(VGA_HS),
        .vsync(VGA_VS),
        .xCount(xpos),
        .yCount(ypos),
        .inDisplay(inDisplay)
    );

    // Font ROM
    reg [7:0] char_code;
    reg [2:0] row;
    wire [7:0] pixels;

    font_rom font (
        .char_code(char_code),
        .row(row),
        .pixels(pixels)
    );

    // Text buffer
    reg [7:0] text[35:0];
        // Text buffer initialization
    initial begin
        // "DSD GROUP 8"
        text[0]  = 8'h44; // 'D'
        text[1]  = 8'h53; // 'S'
        text[2]  = 8'h44; // 'D'
        text[3]  = 8'h20; // ' '
        text[4]  = 8'h47; // 'G'
        text[5]  = 8'h52; // 'R'
        text[6]  = 8'h4F; // 'O'
        text[7]  = 8'h55; // 'U'
        text[8]  = 8'h50; // 'P'
        text[9]  = 8'h20; // ' '
        text[10] = 8'h38; // '8'
        // "CENTER: "
        text[11] = 8'h43; // 'C'
        text[12] = 8'h45; // 'E'
        text[13] = 8'h4E; // 'N'
        text[14] = 8'h54; // 'T'
        text[15] = 8'h45; // 'E'
        text[16] = 8'h52; // 'R'
        text[17] = 8'h3A; // ':'
        text[18] = 8'h20; // ' '
        // Placeholder for CENTER DYNAMIC VALUE
        text[19] = 8'h30; // Thousands place (dynamic)
        text[20] = 8'h30; // Hundreds place (dynamic)
        text[21] = 8'h30; // Tens place (dynamic)
        text[22] = 8'h30; // Units place (dynamic)
        // "CURRENT: "
        text[23] = 8'h43; // 'C'
        text[24] = 8'h55; // 'U'
        text[25] = 8'h52; // 'R'
        text[26] = 8'h52; // 'R'
        text[27] = 8'h45; // 'E'
        text[28] = 8'h4E; // 'N'
        text[29] = 8'h54; // 'T'
        text[30] = 8'h3A; // ':'
        text[31] = 8'h20; // ' '
        // Placeholder for CURRENT DYNAMIC VALUE
        text[32] = 8'h30; // Thousands place (dynamic)
        text[33] = 8'h30; // Hundreds place (dynamic)
        text[34] = 8'h30; // Tens place (dynamic)
        text[35] = 8'h30; // Units place (dynamic)
    end


    // Convert numbers to ASCII dynamically
    always @(posedge CLK) begin
        // Convert `centerDistance` to ASCII
        text[19] <= 8'h30 + (centerDistance / 1000) % 10; // Thousands place
        text[20] <= 8'h30 + (centerDistance / 100) % 10;  // Hundreds place
        text[21] <= 8'h30 + (centerDistance / 10) % 10;   // Tens place
        text[22] <= 8'h30 + (centerDistance % 10);        // Units place

        // Convert `Distance` to ASCII
        text[32] <= 8'h30 + (Distance / 1000) % 10;       // Thousands place
        text[33] <= 8'h30 + (Distance / 100) % 10;        // Hundreds place
        text[34] <= 8'h30 + (Distance / 10) % 10;         // Tens place
        text[35] <= 8'h30 + (Distance % 10);              // Units place
    end


    // VGA display logic
    localparam CHAR_WIDTH = 8;
    localparam CHAR_HEIGHT = 8;
    localparam LINE_SPACING = 10;
    localparam SCREEN_WIDTH = 640;
    localparam SCREEN_HEIGHT = 480;

    localparam START_X = (SCREEN_WIDTH - (12 * CHAR_WIDTH)) / 2;
    localparam START_Y = 100;

    reg [5:0] char_index;
    reg [9:0] line_start_y;

    always @(*) begin
        char_code = 8'h20; // Default to space
        row = 0;

        if (xpos >= START_X && xpos < START_X + (36 * CHAR_WIDTH)) begin
            if (ypos >= START_Y && ypos < START_Y + CHAR_HEIGHT) begin
                // Row 1: "DSD GROUP 8"
                line_start_y = START_Y;
                char_index = (xpos - START_X) / CHAR_WIDTH;
                if (char_index < 11) char_code = text[char_index];
            end else if (ypos >= START_Y + CHAR_HEIGHT + LINE_SPACING &&
                         ypos < START_Y + 2 * CHAR_HEIGHT + LINE_SPACING) begin
                // Row 2: "CENTER: {CENTER DYNAMIC VALUE}"
                line_start_y = START_Y + CHAR_HEIGHT + LINE_SPACING;
                char_index = (xpos - START_X) / CHAR_WIDTH + 11;
                if (char_index < 23) char_code = text[char_index];
            end else if (ypos >= START_Y + 2 * (CHAR_HEIGHT + LINE_SPACING) &&
                         ypos < START_Y + 3 * CHAR_HEIGHT + 2 * LINE_SPACING) begin
                // Row 3: "CURRENT: {CURRENT DYNAMIC VALUE}"
                line_start_y = START_Y + 2 * (CHAR_HEIGHT + LINE_SPACING);
                char_index = (xpos - START_X) / CHAR_WIDTH + 23;
                if (char_index < 36) char_code = text[char_index];
            end
            row = ypos - line_start_y; // Vertical offset within character cell
        end
    end


    assign VGA_R = (inDisplay && pixels[7 - (xpos % CHAR_WIDTH)]) ? 4'hF : 4'h0;
    assign VGA_G = VGA_R;
    assign VGA_B = VGA_R;

endmodule
