module sequencer(
  input pb_seq_up,
  input pb_seq_dn,
  input slow_clk,
  input CLK_50,
  input reset,
  
  output [9:0] rom_addr,
  output [5:0] seq_num,
  output load,
);
  
wire load;
wire [9:0] addr;
wire at_end_rst;
wire addr_inc;
wire ram_counter_inc;
wire ram_counter_dec;
wire [31:0] RAM_Data_Out;
wire [6:0] rdaddress;
  
  always (@posedge CLK_50) begin
    if (pb_seq_up == 1 & pb_seq_dn == 0)
      seq_num <= seq_num + 1;
    else if (pb_seq_up == 0 & pb_seq_dn == 1)
      seq_num <= seq_num - 1;
    else if (pb_seq_up == 0 & pb_seq_dn ==0)
      seq_num <= seq_num;
  end
  
ROM_state ROM_state_i (
	.clock_p(slow_clk),
  .data_in(RAM_Data_Out),
	.pb_seq_up(pb_seq_up),
	.pb_seq_dn(pb_seq_dn),
	.reset(reset),
	.load(load),
	.addr(addr),
  .ram_counter(rdaddress),
	.at_end_rst(at_end_rst),
	.addr_inc(addr_inc),
	.ram_counter_inc(ram_counter_inc),
	.ram_counter_dec(ram_counter_dec)
	);
  
endmodule

