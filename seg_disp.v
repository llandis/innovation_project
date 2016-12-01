module seg_disp
(
	//input KEY0, KEY1, KEY2, KEY3, 
	input [6:0] SW,
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6
	//output [0:9] LEDR
	input [2:0] freq_num,
	input [6:0] seq_num,
	input [6:0] rom_addr
);
	//turn these into inputs as integrated into the top level module
	//wire [6:0] seq_num;
	//wire [6:0] freq_num;
	//wire [6:0] rom_addr;
	wire [0:6] temp0, temp1, temp2;
	
	//assign freq_num = 7'b000_1001;
	//assign seq_num = 7'b011_1111;
	//assign rom_addr = 7'b111_1111;
	
	bcd_conv seq(seq_num, HEX0, HEX1, temp0);
	bcd_conv freq(freq_num, HEX2, temp1, temp2);
	bcd_conv rom(rom_addr, HEX3, HEX4, HEX5);

endmodule
