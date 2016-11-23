`timescale 1ns/1ns

module tb_taglist_RAM;

reg slow_clk;
reg fast_clk;
reg reset;

wire tag_write;
wire [9:0] romAddr;
wire [15:0] romData;

reg [6:0] rd_addr_from_harry;
wire [31:0] rd_data_to_harry;

reg [1:0] data_in;
wire [6:0] seq_num;
wire [31:0] data_out;


taglist_gen i_taglist_gen(
	.clk_1KHz(fast_clk),
	.reset(reset),
	.lastEnd(data_in),
	.ramData(data_out),
	.seqNum(seq_num),
	.w_e_RAM(tag_write),
	.seqWire(romAddr)
);


RAM2Port i_RAM2Port(
	.data(data_out),
	.rdaddress(rd_addr_from_harry),
	.rdclock(slow_clk),
	.wraddress(seq_num),
	.wrclock(fast_clk),
	.wren(tag_write),
	.q(rd_data_to_harry));

ROM2Port	ROM2Port_inst (
	.address_a (romAddr),
	.address_b (  ),
	.inclock ( fast_clk ),
	.outclock ( slow_clk ),
	.q_a (romData  ),
	.q_b (  )
	);

// Fast clock @ 50 MHz
initial begin
  fast_clk = 0;
  forever #10 fast_clk = ~fast_clk;
end

always @ (posedge fast_clk)
begin
	data_in[1:0]= romData [1:0];
end

// Setting up the RAM
//initial begin
//  #100;
//  taglist_wr = 1;
//  #20 taglist_addr = 6'h00; taglist_data [27:21] = 7'h01; taglist_data [20:11] = 11'h000; taglist_data [10:1] = 10'h005; taglist_data[0] = 1'h0;
//  #20 taglist_addr = 6'h01; taglist_data [27:21] = 7'h02; taglist_data [20:11] = 11'h006; taglist_data [10:1] = 10'h00c; taglist_data[0] = 1'h0;
//  #20 taglist_addr = 6'h02; taglist_data [27:21] = 7'h03; taglist_data [20:11] = 11'h00d; taglist_data [10:1] = 10'h015; taglist_data[0] = 1'h0;
//  #20 taglist_addr = 6'h03; taglist_data [27:21] = 7'h04; taglist_data [20:11] = 11'h016; taglist_data [10:1] = 10'h02a; taglist_data[0] = 1'h0;
//  #20 taglist_addr = 6'h04; taglist_data [27:21] = 7'h05; taglist_data [20:11] = 11'h02b; taglist_data [10:1] = 10'h03f; taglist_data[0] = 1'h1;
//  #20 taglist_wr = 0;
//end

// Slow clock @ 10 MHz ... normally slower but easier to read waveforms when running faster.
// Sequencing events from push buttons
initial begin
  slow_clk = 0;
  forever #50 slow_clk = ~slow_clk;
end



initial begin
  
  reset = 1'b1;
  #100 reset = 1'b0;
  #1000;
  rd_addr_from_harry = 7'h00;
  #100   rd_addr_from_harry = 7'h00;
  #100   rd_addr_from_harry = 7'h01;
  #100   rd_addr_from_harry = 7'h02;
  #100   rd_addr_from_harry = 7'h03;
  #100   rd_addr_from_harry = 7'h04;
  #100   rd_addr_from_harry = 7'h05;
  #100   rd_addr_from_harry = 7'h06;
  #100   rd_addr_from_harry = 7'h07;
  #1000;
  $stop;
end
  
endmodule