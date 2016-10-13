module seg_disp
(
	//seq_num,
	//freq_num,
	//rom_addr
);
	input [6:0] SW;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6;
	
	bcd_conv seq(SW[6:0], HEX0, HEX1);
	
endmodule
