//Microsecond Timer
module microsecond_timer(clk, slow_tim);
input clk;
output slow_tim;

//(50*2) = 100 / 100 -> 1us
//EDIT: delay = 50;
parameter delay = 50; //50-1

reg slow_tim_reg;
reg [6:0] slow_cnt = 0;

assign slow_tim = slow_tim_reg;

always @(posedge clk)
begin
    if(slow_cnt < delay)
    begin
        slow_cnt <= slow_cnt + 1;
    end
    else
    begin
        slow_cnt <= 0;
        slow_tim_reg <= ~slow_tim_reg;
    end
end
endmodule