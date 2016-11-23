`timescale 1ns/1ns

module tb_ROM_state;

reg slow_clk;
reg fast_clk;

reg tag_write;
reg [9:0] romAddr;
reg [XX:0] romData;

wire reset;
wire [1:0] data_in;
wire [6:0] seq_num;
wire [31:0] data_out;


RAM_state i_RAM_state(
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
	.rdaddress(),
	.rdclock(slow_clk),
	.wraddress(seq_num),
	.wrclock(fast_clk),
	.wren(tag_write),
	.q());

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
initial begin
  #100;
  taglist_wr = 1;
  #20 taglist_addr = 6'h00; taglist_data [27:21] = 7'h01; taglist_data [20:11] = 11'h000; taglist_data [10:1] = 10'h005; taglist_data[0] = 1'h0;
  #20 taglist_addr = 6'h01; taglist_data [27:21] = 7'h02; taglist_data [20:11] = 11'h006; taglist_data [10:1] = 10'h00c; taglist_data[0] = 1'h0;
  #20 taglist_addr = 6'h02; taglist_data [27:21] = 7'h03; taglist_data [20:11] = 11'h00d; taglist_data [10:1] = 10'h015; taglist_data[0] = 1'h0;
  #20 taglist_addr = 6'h03; taglist_data [27:21] = 7'h04; taglist_data [20:11] = 11'h016; taglist_data [10:1] = 10'h02a; taglist_data[0] = 1'h0;
  #20 taglist_addr = 6'h04; taglist_data [27:21] = 7'h05; taglist_data [20:11] = 11'h02b; taglist_data [10:1] = 10'h03f; taglist_data[0] = 1'h1;
  #20 taglist_wr = 0;
end

// Slow clock @ 10 MHz ... normally slower but easier to read waveforms when running faster.
// Sequencing events from push buttons
initial begin
  slow_clk = 0;
  forever #50 slow_clk = ~slow_clk;
end

initial begin
  pb_seq_up = 1'b0;
  pb_seq_dn = 1'b0;
  #2000; // 20 clocks on first sequence - this will give ample time to load the RAM
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #1000; // Circulate through first sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #1000; // Circulate through second sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #1000; // Circulate through third sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #1000; // Circulate through fourth sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #1000; // Circulate through fifth sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #1000; // Circulate through first sequence (check if loop works)
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #200; // Circulate through second sequence and leave sequence before it goes through all second sequence addresses
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #1000; // Circulate through third sequence 
  pb_seq_dn = 1'b1; #100 pb_seq_dn = 1'b0; // Push button down sequence 1 cycle pulse
  #1000; // Circulate through second sequence 
  pb_seq_dn = 1'b1; pb_seq_up = 1'b1; #100 pb_seq_dn = 1'b0; pb_seq_up = 1'b0;// Push both buttons at the same time and watch for smoke
  #1000; // Circulate through first or third sequence sequence 
end
  
endmodule