module seg_disp
(
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	input [2:0] freq_num,
	input [5:0] seq_num,
	input [9:0] rom_addr
);
	//turn these into inputs as integrated into the top level module
	wire [9:0] seq_num_pass;
	wire [9:0] freq_num_pass;
	wire [9:0] rom_addr_pass;
	wire [0:6] temp0, temp1, temp2;
	//assign seq_num_pass = 10'b00_0000_0000;
	//assign freq_num_pass = 10'b00_0000_0000;
	//assign rom_addr_pass = 10'b00_0000_0000;
	
	assign freq_num_pass = {7'b000_0000,freq_num}; 
	//assign freq_num_pass = 10'b00_0000_0101;
	assign seq_num_pass = {4'b0000,seq_num};
	assign rom_addr_pass = rom_addr;
	
	bcd_conv seq(seq_num_pass, HEX0, HEX1, temp0);
	bcd_conv freq(freq_num_pass, HEX2, temp1, temp2);
	bcd_conv rom(rom_addr_pass, HEX3, HEX4, HEX5);

endmodule
