`timescale 1ns / 1ps

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

    // Horizontal and Vertical timing parameters
    parameter H_DISPLAY = 640; 
    parameter H_FRONT_PORCH = 16;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_TOTAL = H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH;

    parameter V_DISPLAY = 480; 
    parameter V_FRONT_PORCH = 10;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 33;
    parameter V_TOTAL = V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH;

    reg hsync_reg, vsync_reg;
    assign hsync = hsync_reg;
    assign vsync = vsync_reg;

    assign inDisplay = (xCount < H_DISPLAY) && (yCount < V_DISPLAY);

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

    always @(*) begin
        hsync_reg = (xCount >= (H_DISPLAY + H_FRONT_PORCH)) && 
                    (xCount < (H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE));
        vsync_reg = (yCount >= (V_DISPLAY + V_FRONT_PORCH)) && 
                    (yCount < (V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE));
    end

endmodule
