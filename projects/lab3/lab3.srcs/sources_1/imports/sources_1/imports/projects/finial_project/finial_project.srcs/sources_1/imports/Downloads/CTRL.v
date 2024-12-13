module CTRL(CLK, seg_tmr, DIST, center_distance, pulse_width, weight, BTNL, BTNR, BTNU, BTND);
input CLK;
input seg_tmr;
input BTNL, BTNR, BTNU, BTND;
input [15:0] DIST;

output [12:0] pulse_width;
output reg [15:0] center_distance; // Output for dynamic center distance
output reg [3:0] weight;           // Output for weight, accessible to other modules

reg [12:0] controlled_pulse_width = 1100;

assign pulse_width = controlled_pulse_width;

// Calculate the difference between DIST and center_distance
wire signed [15:0] distance_diff;
assign distance_diff = DIST - center_distance;

// Initialize center_distance and weight
initial begin
    center_distance = 16'h5DC; // Example: 1500 in hexadecimal
    weight = 4'b0001;          // Default weight
end

// Button edge-detection logic
reg BTNL_prev, BTNR_prev, BTNU_prev, BTND_prev;
wire BTNL_edge, BTNR_edge, BTNU_edge, BTND_edge;

always @(posedge CLK) begin
    BTNL_prev <= BTNL;
    BTNR_prev <= BTNR;
    BTNU_prev <= BTNU;
    BTND_prev <= BTND;
end

assign BTNL_edge = BTNL & ~BTNL_prev; // Rising edge detection for BTNL
assign BTNR_edge = BTNR & ~BTNR_prev; // Rising edge detection for BTNR
assign BTNU_edge = BTNU & ~BTNU_prev; // Rising edge detection for BTNU
assign BTND_edge = BTND & ~BTND_prev; // Rising edge detection for BTND

// Update center_distance on button presses
always @(posedge CLK) begin
    if (BTNL_edge && center_distance > 16'h000A) begin
        center_distance <= center_distance - 16'h000A; // Decrease by 10
    end
    if (BTNR_edge && center_distance < 16'hFFFE) begin
        center_distance <= center_distance + 16'h000A; // Increase by 10
    end
end

// Update weight for exponential control
always @(posedge CLK) begin
    if (BTNU_edge && weight < 4'b1111) begin
        weight <= weight + 1; // Increase weight
    end
    if (BTND_edge && weight > 4'b0001) begin
        weight <= weight - 1; // Decrease weight
    end
end

// Controlled pulse width logic
always @(posedge seg_tmr) begin
    if (distance_diff < -200) begin
        controlled_pulse_width <= 1595 + (weight * 5); 
    end else if (distance_diff >= -200 && distance_diff < -100) begin
        controlled_pulse_width <= 1575 + (weight * 4); 
    end else if (distance_diff >= -100 && distance_diff < -50) begin
        controlled_pulse_width <= 1560 + (weight * 3); 
    end else if (distance_diff >= -50 && distance_diff < 50) begin
        controlled_pulse_width <= 1500; // Center zone
    end else if (distance_diff >= 50 && distance_diff < 100) begin
        controlled_pulse_width <= 1480 - (weight * 3); 
    end else if (distance_diff >= 100 && distance_diff < 200) begin
        controlled_pulse_width <= 1465 - (weight * 4); 
    end else begin
        controlled_pulse_width <= 1450 - (weight * 5); 
    end
end

endmodule
