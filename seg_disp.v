module seg_disp
(
	input KEY0, KEY1, KEY2, KEY3, 
	input [6:0] SW,
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6,
	output [0:9] LEDR
);
	
	//seq_num,
	//freq_num,
	//rom_addr
	
	bcd_conv seq(SW[6:0], HEX0, HEX1);
	//tie the rest of the hex to the ground for now
	assign HEX2 = 7'b111_1111;
	assign HEX3 = 7'b111_1111;
	assign HEX4 = 7'b111_1111;
	assign HEX5 = 7'b111_1111;
	assign HEX6 = 7'b111_1111;

endmodule
