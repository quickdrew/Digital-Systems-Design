module final_proj(CLK, USN_READ, PWM, USN_PULSE, SEG, AN, VGA_VS, VGA_HS, VGA_R, VGA_G, VGA_B, BTNL, BTNR, BTNU, BTND);
input CLK;
input USN_READ;
input BTNL, BTNR, BTNU, BTND;

output VGA_VS, VGA_HS;
output [3:0] VGA_R, VGA_G, VGA_B;

output PWM;
output USN_PULSE;
output [6:0] SEG;
output [7:0] AN;

//Module connection wires
wire [15:0] Distance, center_distance, weight;
wire [12:0] controlled_pulse_width;

//Timers
wire us_tmr;
microsecond_timer ust1(CLK, us_tmr);

//Note: Unused.
wire ms_tmr;
millisecond_timer mst1(CLK, ms_tmr);

wire seg_tmr;
segment_timer segt1(CLK, seg_tmr);

//Ultrasonic Module
USM usm1(CLK, USN_READ, seg_tmr, us_tmr, USN_PULSE, SEG, AN, Distance);

//PWM Module
PWM pmw1(CLK, us_tmr, controlled_pulse_width, PWM);

//Controller Module
CTRL ctrl1(CLK, seg_tmr, Distance, center_distance, controlled_pulse_width, weight, BTNL, BTNR, BTNU, BTND);

// VGA Controller
vgatop vga_instance (CLK, VGA_VS, VGA_HS, VGA_R, VGA_G, VGA_B, Distance, center_distance, weight);

endmodule