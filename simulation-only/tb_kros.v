`timescale 1ns/1ns
module tb_kros;
	reg CLK_50;
	reg pb_freq_up;
	reg pb_freq_dn;
	reg pb_seq_up;
	reg pb_seq_dn;
	reg reset;
	reg slow_clk;

	wire [9:0] LEDR;
	wire [6:0] HEX0;
	wire [6:0] HEX1;
	wire [6:0] HEX2;
	wire [6:0] HEX3;
	wire [6:0] HEX4;
	wire [6:0] HEX5;

KROS_simonly DUT(
	.CLK_50(CLK_50),
	.pb_freq_up(pb_freq_up),
	.pb_freq_dn(pb_freq_dn),
	.pb_seq_up(pb_seq_up),
	.pb_seq_dn(pb_seq_dn),
	.reset(reset),
	.slow_clk(slow_clk),
	.LEDR(LEDR),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	.HEX4(HEX4),
	.HEX5(HEX5));

initial begin
	slow_clk = 0;
	forever #100 slow_clk  = ~slow_clk;
end

initial begin
  CLK_50 = 0;
  forever #10 CLK_50 = ~CLK_50;
end


initial begin
  
  reset = 1'b1;
  pb_freq_up = 1'b1;
  pb_freq_dn = 1'b1;
  pb_seq_up = 1'b1;
  pb_seq_dn = 1'b1;
  #400 reset = 1'b0;
// Let run for a while
  #1000; //around 100 cycles
  //@(posedge CLK_50);
  pb_seq_up = 1'b0;
  #1000; // Hold for 50 cycles
  pb_seq_up = 1'b1;
  #1000; //around 100 slow clock cycles
  //@(posedge CLK_50);
  pb_seq_up = 1'b0;
  #1000; // Hold for 50 cycles
  pb_seq_up = 1'b1;
  #1000000; //around 100 slow clock cycles
  $stop;

end

endmodule
