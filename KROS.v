module KROS (
  input CLK_50,
  input [3:0] pb,
  output [9:0] LEDR,
  output [6:0] HEX0,
  output [6:0] HEX1,
  output [6:0] HEX2,
  output [6:0] HEX3,
  output [6:0] HEX4,
  output [6:0] HEX5);

wire [9:0] address_b_sig;
	wire [5:0] seq_num;
        wire [2:0] freq_num;

throttle i_throttle (
  .CLK_50(CLK_50),
  .reset(1'b0),
	.pb_freq_up(pb[3]),
	.pb_freq_dn(pb[2]),
  .slow_clk(slow_clk),
        .freq_num(freq_num) );
  
sequencer i_sequencer
	.pb_seq_up(pb[1]),
	.pb_seq_dn(pb[0]),
  .slow_clk(slow_clk),
  .reset(1'b0),
  .rom_addr(address_b_sig),
	.seq_num(seq_num) 
  );
  

RAM2Port	RAM2Port_inst (
        .data ( //data_sig ),
        .rdaddress ( //rdaddress_sig ),
        .rdclock ( slow_clk ),
        .wraddress ( //wraddress_sig ),
	.wrclock ( CLK_50 ),
        .wren ( //wren_sig ),
        .q ( //q_sig )
	);
  
  
ROM2Port	ROM2Port_inst (
	.address_a ( address_a_sig ),
	.address_b ( address_b_sig ),
	.inclock ( inclock_sig ),
	.outclock ( outclock_sig ),
	.q_a ( q_a_sig ),
	.q_b ( LEDR )
	);
  
debouncer i_debouncer_pb0 (
	.noisy (pb[0]),
	.clk_50 (CLK_50),
  .debounced()
  );
 
debouncer i_debouncer_pb1 (
	.noisy (pb[1]),
	.clk_50 (CLK_50),
  .debounced()
  );
  
debouncer i_debouncer_pb2 (
	.noisy (pb[2]),
	.clk_50 (CLK_50),
  .debounced()
  );
 
 debouncer i_debouncer_pb3 (
	 .noisy (pb[3]),
	 .clk_50 (CLK_50),
  .debounced()
  );
