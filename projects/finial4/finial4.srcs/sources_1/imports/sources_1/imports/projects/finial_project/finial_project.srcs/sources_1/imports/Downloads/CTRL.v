module CTRL(CLK, seg_tmr, DIST, center_distance, pulse_width, weight, BTNL, BTNR, BTNU, BTND);
input CLK;
input seg_tmr;
input BTNL, BTNR, BTNU, BTND;
input [15:0] DIST;

output [12:0] pulse_width;
output reg [15:0] center_distance; // Output for dynamic center distance
output reg [15:0] weight;           // Output for weight, accessible to other modules

reg [12:0] controlled_pulse_width = 1100;

assign pulse_width = controlled_pulse_width;

// Calculate the difference between DIST and center_distance
wire signed [15:0] distance_diff;
assign distance_diff = DIST - center_distance;

// Initialize center_distance and weight
initial begin
    center_distance = 16'h5DC; // Example: 1500 in hexadecimal
    weight = 4'h0001;          // Default weight
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
    if (BTNU_edge && weight < 16'h1111) begin
        weight <= weight + 1; // Increase weight
    end
    if (BTND_edge && weight > 16'h0001) begin
        weight <= weight - 1; // Decrease weight
    end
end

// Controlled pulse width logic
always @(posedge seg_tmr) begin
    if (distance_diff < -1000) begin
        controlled_pulse_width <= 1600 + (weight); 
    end else if (distance_diff >= -1000 && distance_diff < -750) begin
        controlled_pulse_width <= 1580 + (weight); 
    end else if (distance_diff >= -750 && distance_diff < -500) begin
        controlled_pulse_width <= 1550 + (weight); 
    end else if (distance_diff >= -500 && distance_diff < -300) begin
        controlled_pulse_width <= 1525 + (weight); 
    end else if (distance_diff >= -300 && distance_diff < -100) begin
        controlled_pulse_width <= 1500 + (weight); 
    end else if (distance_diff >= -100 && distance_diff < -50) begin
        controlled_pulse_width <= 1475 + (weight); 
    end else if (distance_diff >= -50 && distance_diff < 50) begin
        controlled_pulse_width <= 1450; // Center zone
    end else if (distance_diff >= 50 && distance_diff < 100) begin
        controlled_pulse_width <= 1425 - (weight); 
    end else if (distance_diff >= 100 && distance_diff < 300) begin
        controlled_pulse_width <= 1400 - (weight); 
    end else if (distance_diff >= 300 && distance_diff < 500) begin
        controlled_pulse_width <= 1375 - (weight); 
    end else if (distance_diff >= 500 && distance_diff < 750) begin
        controlled_pulse_width <= 1350 - (weight); 
    end else if (distance_diff >= 750 && distance_diff < 1000) begin
        controlled_pulse_width <= 1325 - (weight); 
    end else if (distance_diff >= 1000) begin
        controlled_pulse_width <= 1300 - (weight); 
    end    
end

endmodule
