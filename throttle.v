module throttle(
input CLK_50,
input reset,
input pb_freq_up,
input pb_freq_dn,

  
  
output slow_clk,
output freq_num,
);

endmodule


module clock_divider(
input fast_clk,
output slow_clk);

parameter COUNTER_SIZE = 24;
parameter COUNTER_MAX_COUNT = (2 ** COUNTER_SIZE) - 1;

reg [COUNTER_SIZE -1:0] count;

always @(posedge fast_clock)
begin
if(count==COUNTER_MAX_COUNT)
	count<=0;
else
	count<=count+1;
end

assign slow_clock = count[COUNTER_SIZE -1];

endmodule
