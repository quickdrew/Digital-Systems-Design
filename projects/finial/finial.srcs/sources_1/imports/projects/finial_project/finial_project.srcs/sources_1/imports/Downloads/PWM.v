module PWM(CLK, us_tmr, pulse_width, PWM);
input CLK;
input us_tmr;
input [12:0] pulse_width;

output PWM;

//Pulse Width Modulation
reg [14:0] pwm_period_count = 0;
reg [12:0] pwm_pulse_count = 0;
reg [12:0] pwm_duty_period_length = 0;
reg PWM_reg = 1'b0;

assign PWM = PWM_reg;

//PWM Pulse Generation
//possibly re-add ~15ms reorientation period
always @(posedge us_tmr)
begin
    if(pwm_period_count < 499)
    begin 
        PWM_reg <= 1'b0;
        pwm_period_count <= pwm_period_count + 1;
    end
    if((pwm_period_count >= 499) & (pwm_pulse_count < pwm_duty_period_length)) //500-1
    begin
        PWM_reg <= 1'b1;
        pwm_pulse_count <= pwm_pulse_count + 1;
        pwm_period_count <= pwm_period_count + 1;
    end
    else if(pwm_period_count == 19599)
    begin
        PWM_reg <= 1'b0;
        pwm_pulse_count <= 0;
        pwm_period_count <= 0;
        pwm_duty_period_length <= pulse_width;
    end
    //0.2% err from 20ms (20,000 us)
    //EDITED:  else if(pwm_period_count < 19599)
    else if(pwm_period_count < 19599) //19600-1
    begin
        PWM_reg <= 1'b0;
        pwm_period_count <= pwm_period_count + 1;
    end
    else 
    begin
        PWM_reg <= 1'b0;
    end
end

endmodule