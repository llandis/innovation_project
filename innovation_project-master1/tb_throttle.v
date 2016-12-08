module tb_throttle;

	reg CLK_50;
	reg reset;
	reg pb_freq_up;
	reg pb_freq_dn;
	wire slow_clk;
	wire freq_num;
	
throttle throttle_DUT(
	.CLK_50(CLK_50),
	.reset(reset),
	.pb_freq_up(pb_freq_up),
	.pb_freq_dn(pb_freq_dn),
	.slow_clk(slow_clk),
	.freq_num(freq_num)
);
	
	initial begin 
		CLK_50 = 0;
		forever #10 CLK_50 = ~CLK_50;
	end
		
	initial begin
		reset = 1;
		pb_freq_up = 0; 
		pb_freq_dn = 0;
		#40 reset = 0;
		
		#60000 pb_freq_up = 1;
		#200 pb_freq_up = 0;
		#60000 pb_freq_up = 1;
		#200 pb_freq_up = 0;
		#60000 pb_freq_up = 1;
		#200 pb_freq_up = 0;
		#60000 pb_freq_up = 1;
		#200 pb_freq_up = 0;
		#60000 pb_freq_up = 1;
		#200 pb_freq_up = 0;
		#60000 pb_freq_up = 1;
		#200 pb_freq_up = 0;
		
		#60000 pb_freq_dn = 1;
		#200 pb_freq_dn = 0;
		#60000 pb_freq_dn = 1;
		#200 pb_freq_dn = 0;
		#60000 pb_freq_dn = 1;
		#200 pb_freq_dn = 0;
		#60000 pb_freq_dn = 1;
		#200 pb_freq_dn = 0;
		#60000 pb_freq_dn = 1;
		#200 pb_freq_dn = 0;
		#60000 pb_freq_dn = 1;
		#200 pb_freq_dn = 0;
		$stop;
		
		end
endmodule
		
	
	