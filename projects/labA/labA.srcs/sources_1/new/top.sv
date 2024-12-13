`timescale 1ns / 1ps

module vgatop (clk, VGA_VS, VGA_HS, VGA_R, VGA_G, VGA_B);

    input clk;
    output VGA_VS, VGA_HS;
    output [3:0] VGA_R, VGA_G, VGA_B; // 4 bits for each RGB color channel

    wire inDisplay;
    wire [9:0] xpos; // x position, up to 800 pixels
    wire [9:0] ypos; // y position, up to 525 lines

    // Instantiate the vgasync module
    vgasync v1 (
        .clk(clk),               // input clock
        .hsync(VGA_HS),          // output horizontal sync
        .vsync(VGA_VS),          // output vertical sync
        .xCount(xpos),           // x position
        .yCount(ypos),           // y position
        .inDisplay(inDisplay)    // inDisplay flag
    );

    // Define a counter for 1-second intervals
    reg [25:0] color_counter = 0;
    reg [1:0] color_state = 0; // State to control which color is displayed

    // Slow down the counter to approximately 1 Hz (1 second intervals)
    always @(posedge clk) begin
        if (color_counter >= 50_000_000 - 1) begin // Assuming 50 MHz pixel clock
            color_counter <= 0;
            color_state <= color_state + 1; // Change color every second
        end else begin
            color_counter <= color_counter + 1;
        end
    end

    // Set the color based on the color_state
    assign VGA_R = (inDisplay && color_state == 2'b00) ? 4'hF : 4'h0; // Red screen
    assign VGA_G = (inDisplay && color_state == 2'b01) ? 4'hF : 4'h0; // Green screen
    assign VGA_B = (inDisplay && color_state == 2'b10) ? 4'hF : 4'h0; // Blue screen

endmodule


module vgasync (clk, hsync, vsync, xCount, yCount, inDisplay);

    input clk;
    output hsync, vsync, inDisplay;
    output reg [9:0] xCount; // adjust bit width as necessary
    output reg [9:0] yCount; // adjust bit width as necessary

    // Instantiate the clock wizard IP here
    wire pixel_clk;
    clk_wiz_0 clk_inst (
        .clk_out1(pixel_clk), // Replace with the actual output port name of clk_wiz_0 for pixel clock
        .reset(1'b0),         // Assuming 1'b0 is connected to the reset port
        .locked(),            // This is left unconnected
        .clk_in1(clk)         // Input clock connected to `clk`
    );

    // Horizontal and Vertical timing parameters (from the tables)
    parameter H_DISPLAY = 640; // Display area width
    parameter H_FRONT_PORCH = 16;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_TOTAL = H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH;

    parameter V_DISPLAY = 480; // Display area height
    parameter V_FRONT_PORCH = 10;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 33;
    parameter V_TOTAL = V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH;

    // Signal outputs
    reg hsync_reg, vsync_reg;
    assign hsync = hsync_reg;
    assign vsync = vsync_reg;

    // inDisplay signal indicates whether we are in the visible area
    assign inDisplay = (xCount < H_DISPLAY) && (yCount < V_DISPLAY);

    // Horizontal and vertical counters
    always @(posedge pixel_clk) begin
        if (xCount == H_TOTAL - 1) begin
            xCount <= 0;
            if (yCount == V_TOTAL - 1)
                yCount <= 0;
            else
                yCount <= yCount + 1;
        end else begin
            xCount <= xCount + 1;
        end
    end

    // Generate horizontal and vertical sync signals based on timing
    always @(*) begin
        // Horizontal sync pulse during sync time
        hsync_reg = (xCount >= (H_DISPLAY + H_FRONT_PORCH)) && 
                    (xCount < (H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE));
        // Vertical sync pulse during sync time
        vsync_reg = (yCount >= (V_DISPLAY + V_FRONT_PORCH)) && 
                    (yCount < (V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE));
    end

endmodule
