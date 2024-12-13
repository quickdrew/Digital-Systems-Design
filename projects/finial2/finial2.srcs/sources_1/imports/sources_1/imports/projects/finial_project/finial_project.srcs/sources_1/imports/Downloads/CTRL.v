module CTRL(CLK, seg_tmr, DIST, center_distance, pulse_width, BTNL, BTNR);
input CLK;
input seg_tmr;
input BTNL, BTNR;
input [15:0] DIST;

output [12:0] pulse_width;
output reg [15:0] center_distance; // Output for dynamic center distance

reg [12:0] controlled_pulse_width = 1100;

assign pulse_width = controlled_pulse_width;

// Calculate the difference between DIST and center_distance
wire signed [15:0] distance_diff;
assign distance_diff = DIST - center_distance;

// Initialize center_distance
initial begin
    center_distance = 16'h5DC; // Example: 1500 in hexadecimal
end

// Button edge-detection logic
reg BTNL_prev, BTNR_prev;
wire BTNL_edge, BTNR_edge;

always @(posedge CLK) begin
    BTNL_prev <= BTNL;
    BTNR_prev <= BTNR;
end

assign BTNL_edge = BTNL & ~BTNL_prev; // Rising edge detection for BTNL
assign BTNR_edge = BTNR & ~BTNR_prev; // Rising edge detection for BTNR

// Update center_distance on button presses
always @(posedge CLK) begin
    if (BTNL_edge && center_distance > 16'h000A) begin
        center_distance <= center_distance - 16'h000A; // Decrease by 10
    end
    if (BTNR_edge && center_distance < 16'hFFFE) begin
        center_distance <= center_distance + 16'h000A; // Increase by 10
    end
end

// Controlled pulse width logic
always @(posedge seg_tmr) begin
    if (distance_diff < -200) begin
        controlled_pulse_width <= 1595; // Far negative
    end else if (distance_diff >= -200 && distance_diff < -100) begin
        controlled_pulse_width <= 1575; // Closer negative
    end else if (distance_diff >= -100 && distance_diff < -50) begin
        controlled_pulse_width <= 1560; // Near negative
    end else if (distance_diff >= -50 && distance_diff < 50) begin
        controlled_pulse_width <= 1500; // Center zone
    end else if (distance_diff >= 50 && distance_diff < 100) begin
        controlled_pulse_width <= 1480; // Near positive
    end else if (distance_diff >= 100 && distance_diff < 200) begin
        controlled_pulse_width <= 1465; // Closer positive
    end else begin
        controlled_pulse_width <= 1450; // Far positive
    end
end

endmodule
