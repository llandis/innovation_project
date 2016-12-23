module KROS_simonly (
	input wire CLK_50,
	input wire pb_freq_up,
	input wire pb_freq_dn,
	input pb_seq_up,
	input pb_seq_dn,
	input reset,
	input slow_clk,

	output [9:0] LEDR,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5
	);

wire [9:0] address_b_sig;
wire [5:0] seq_num;
wire [2:0] freq_num;
//wire slow_clk;

throttle i_throttle (
  	.CLK_50(CLK_50),
  	.reset(reset),
	.pb_freq_up(pb_freq_up),
	.pb_freq_dn(pb_freq_dn),
  	//.slow_clk(slow_clk),
   .freq_num(freq_num) 
	);

seg_disp i_seq_disp (  
	.HEX0(HEX0), 
	.HEX1(HEX1), 
	.HEX2(HEX2), 
	.HEX3(HEX3), 
	.HEX4(HEX4), 
	.HEX5(HEX5), 
	.freq_num(freq_num),
	.seq_num(seq_num),
	.rom_addr(address_b_sig)
	);
	
sequencer i_sequencer (
	.pb_seq_up(pb_seq_up),
	.pb_seq_dn(pb_seq_dn),
 	.slow_clk(slow_clk),
	.CLK_50(CLK_50),
  	.reset(reset),
  	.rom_addr(address_b_sig),
	.seq_num(seq_num),
	.LEDR(LEDR)
  	);
 
endmodule
	
