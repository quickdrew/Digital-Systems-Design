//Segement timer - ~1.5ms
module segment_timer(clk, slow_tim);
input clk;
output slow_tim;

parameter delay = 150000; //150000-1

reg slow_tim_reg;
reg [19:0] slow_cnt;

assign slow_tim = slow_tim_reg;

always @(posedge clk)
begin
    if(slow_cnt < delay)
    begin
        slow_cnt <= slow_cnt + 1;
    end
    else if(slow_cnt == delay)
    begin
        slow_cnt <= 0;
        slow_tim_reg <= ~slow_tim_reg;
    end
end
endmodule