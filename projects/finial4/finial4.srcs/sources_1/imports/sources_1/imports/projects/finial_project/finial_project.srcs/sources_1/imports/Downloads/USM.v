module USM(CLK, USN_READ, seg_tmr, us_tmr, USN_PULSE, SEG_m, AN_m, DIST);
input CLK;
input USN_READ;
input seg_tmr;
input us_tmr;

output [15:0] DIST;
output USN_PULSE;
output [6:0] SEG_m;
output [7:0] AN_m;

//Ultrasonic Ranging registers and assignments
reg [3:0] usn_pulse_count = 0;
reg [15:0] usn_period_count = 0;
reg [15:0] usn_hold_time = 0;
reg usn_reset = 1'b0;
reg usn_read_done = 1'b0;
reg usn_read_started = 1'b0;
reg USN_reg = 1'b0;

assign USN_PULSE = USN_reg;

//Segment registers and assignments
reg [2:0] seg_state = 3'b000;
reg [3:0] seg_val = 1'h0;
reg [15:0] seg_hold_val = 0;
reg [7:0] AN_reg = 8'b11111111;
reg [6:0] SEG_reg = 7'b0000000;

assign SEG_m = SEG_reg;
assign AN_m = AN_reg;

//Distance assignment
assign DIST = seg_hold_val;

//Ultrasonic generation
always @(posedge us_tmr)
begin   
    if((usn_read_started == 1'b1) & ~USN_READ)  //Utilized for Echo pulse count smoothing
    begin                                       //Echo pulse pseudo falling edge detection
        usn_read_started <= 1'b0;
        usn_read_done <= 1'b1;
    end
    
    if(usn_pulse_count < 10)    //10us Trigger pulse generation
    begin
        USN_reg <= 1'b1;
        usn_reset <= 1'b0;
        usn_read_done <= 1'b0;
        usn_pulse_count <= usn_pulse_count + 1;
        usn_period_count <= usn_period_count + 1;
    end
    else if(usn_period_count == 2250) //Utilizied for pulse smoothing 
    begin                             //Echo pulse starts at ~2.2 ms, so assume pulse starts 50us later (observed via LFR measurement)
        USN_reg <= 1'b0;
        usn_read_started = 1'b1;
        usn_period_count <= usn_period_count + 1;
    end
    else if(usn_period_count == 60000) //60ms has passed reset counters and set reset flag
    begin
        USN_reg <= 1'b0;
        usn_reset <= 1'b1;
        usn_pulse_count <= 0;
        usn_period_count <= 0;
    end
    else if(usn_period_count < 60000) //Not 60ms yet, increment
    begin
        USN_reg <= 1'b0;
        usn_period_count <= usn_period_count + 1;
    end
end

//Store Echo pulse count into display register.
always @(posedge CLK)
begin
    if(usn_read_done == 1'b1)
    begin
        seg_hold_val <= usn_hold_time;
    end
end

//Ultrasonic Echo Hold Count
always @(posedge us_tmr)
begin
    if(USN_READ)    //Echo pulse active, count number of microseconds
    begin
        usn_hold_time <= usn_hold_time + 1;
    end
    else if(usn_reset)  //Ultrasonic has reset, clear count
    begin
        usn_hold_time <= 0; 
    end
end

//Segment state control
always @(posedge seg_tmr)
begin
    if(seg_state == 4'b0100)
    begin
        seg_state <= 4'b0000;
    end
    else
    begin
        seg_state <= seg_state + 1;
    end
end

//Segment multiplex
always @(posedge CLK)
begin
    case(seg_state) //Segment selector
        0:  begin
                seg_val <= seg_hold_val[15:12];
                AN_reg <= 8'b11110111;
            end
        1:  begin
                seg_val <= seg_hold_val[11:8];
                AN_reg <= 8'b11111011;
            end    
        2:  begin
                seg_val <= seg_hold_val[7:4];
                AN_reg <= 8'b11111101;
            end    
        3:  begin
                seg_val <= seg_hold_val[3:0];
                AN_reg <= 8'b11111110;
            end        
    endcase
    case(seg_val) //Character selector
        0: SEG_reg <= 7'b1000000;
        1: SEG_reg <= 7'b1111001;
        2: SEG_reg <= 7'b0100100;
        3: SEG_reg <= 7'b0110000;
        4: SEG_reg <= 7'b0011001;
        5: SEG_reg <= 7'b0010010;
        6: SEG_reg <= 7'b0000010;
        7: SEG_reg <= 7'b1111000;
        8: SEG_reg <= 7'b0000000;
        9: SEG_reg <= 7'b0011000;
        10: SEG_reg <= 7'b0001000;
        11: SEG_reg <= 7'b0000011;
        12: SEG_reg <= 7'b0100111;
        13: SEG_reg <= 7'b0100001;
        14: SEG_reg <= 7'b0000100;
        15: SEG_reg <= 7'b0001110;
    endcase
end
endmodule