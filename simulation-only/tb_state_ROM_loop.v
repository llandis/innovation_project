`timescale 1ns/1ns

module tb_ROM_state;

reg slow_clk;
reg fast_clk;
reg at_end;
reg pb_seq_up;
reg pb_seq_dn;
reg reset;
reg taglist_wr;
reg [31:0] taglist_data;
reg [6:0] taglist_addr;
wire load;
wire [9:0] addr;
wire at_end_rst;
wire addr_inc;
wire ram_counter_inc;
wire ram_counter_dec;
wire [31:0] RAM_Data_Out;
wire [6:0] rdaddress;



ROM_state_loop i_ROM_state(
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
    .ram_counter_dec(ram_counter_dec));

RAM2Port i_RAM2Port(
	.data(taglist_data),
	.rdaddress(rdaddress),
	.rdclock(slow_clk),
	.wraddress(taglist_addr),
	.wrclock(fast_clk),
	.wren(taglist_wr),
	.q(RAM_Data_Out));

ROM2Port	ROM2Port_inst (
	.address_a (  ),
	.address_b (  ),
	.inclock ( fast_clk ),
	.outclock ( slow_clk ),
	.q_a (  ),
	.q_b (  )
	);

// Fast clock @ 50 MHz
initial begin
  fast_clk = 0;
  forever #10 fast_clk = ~fast_clk;
end

// Setting up the RAM
initial begin
  //reset = 1;
  //#100;
  //reset = 0;
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
  reset = 1;
  #500;
  reset = 0;
  #2000; // 20 clocks on first sequence - this will give ample time to load the RAM
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate second sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate through third sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate through fourth sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate through fifth sequence
  pb_seq_dn = 1'b1; #100 pb_seq_dn = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate through fourth sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate through fifth sequence
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate through first sequence (test if can go loop last to first)
  reset = 1;
  #500;
  reset = 0;
  #2000; //Circulate through first sequence again
  
  /* pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate through fifth sequence
  
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #2000; // Circulate through first sequence (check if loop works)
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #200; // Circulate through second sequence and leave sequence before it goes through all second sequence addresses
  pb_seq_up = 1'b1; #100 pb_seq_up = 1'b0; // Push button 1 cycle pulse
  #1000; // Circulate through third sequence 
  pb_seq_dn = 1'b1; #100 pb_seq_dn = 1'b0; // Push button down sequence 1 cycle pulse
  #1000; // Circulate through second sequence 
  pb_seq_dn = 1'b1; pb_seq_up = 1'b1; #100 pb_seq_dn = 1'b0; pb_seq_up = 1'b0;// Push both buttons at the same time and watch for smoke
  #1000; // Circulate through first or third sequence sequence  */
  $stop;
end
  
endmodule
