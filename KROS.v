module KROS (
	input wire CLK_50,
	input wire pb_freq_up,
	input wire pb_freq_dn,
	input pb_seq_up,
	input pb_seq_dn,
	input reset,

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
wire slow_clk;

throttle i_throttle (
  	.CLK_50(CLK_50),
  	.reset(1'b0),
	.pb_freq_up(pb_freq_up),
	.pb_freq_dn(pb_freq_dn),
  	.slow_clk(slow_clk),
   .freq_num(freq_num) 
	);

seg_disp i_seq_disp (  
	//.SW(SW),
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
 
//ROM_state ROM_state (
//	.clock_p(slow_clk),
//	.data_in(q_sig),
//	.pb_seq_up(pb_seq_up),
//	.pb_seq_dn(pb_seq_dn),
//	.reset(reset),
//	.load(load),
//	.addr(addr ),
//	.ram_counter(raddress),
//	.at_end_rst(at_end_rst),
//	.addr_inc(addr_inc),
//	.ram_counter_inc(ram_counter_inc),
//	.ram_counter_dec(ram_counter_dec)
//	);
//
//RAM2Port	RAM2Port_inst (
//        .data ( data_sig ),
//        .rdaddress ( rdaddress_sig ),
//        .rdclock ( slow_clk ),
//        .wraddress ( wraddress_sig ),
//	.wrclock ( CLK_50 ),
//        .wren ( wren_sig ),
//        .q ( q_sig )
//	);
//  
//  
//ROM2Port	ROM2Port_inst (
//	.address_a ( address_a_sig ),
//	.address_b ( address_b_sig ),
//	.inclock ( CLK_50 ),
//	.outclock ( slow_clk ),
//	.q_a ( q_a_sig ),
//	.q_b ( LEDR )
//	);
//  
//debouncer i_debouncer_pb0 (
//	.noisy (pb_seq_dn),
//	.clk_50 (CLK_50),
//	.debounced(pb_freq_dn)
//  	);
// 
//debouncer i_debouncer_pb1 (
//	.noisy (pb_seq_up),
//	.clk_50 (CLK_50),
//	.debounced(pb_freq_up)
//  	);
//  
//debouncer i_debouncer_pb2 (
//	.noisy (pb[2]),
//	.clk_50 (CLK_50),
//	.debounced(pb_seq_dn)
//  	);
// 
//debouncer i_debouncer_pb3 (
//	 .noisy (pb[3]),
//	 .clk_50 (CLK_50),
//	 .debounced(pb_seq_up)
//  	);
	
endmodule
	
