//Segement timer - ~1.5ms
module millisecond_timer(clk, slow_tim);
input clk;
output slow_tim;

//(75000*2) = 150000 / 100000 -> 1.5ms
parameter delay = 75000; //75000-1

reg slow_tim_reg;
reg [19:0] slow_cnt = 0;

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