module bcd_conv
(
	input [6:0] x,
	output reg [0:6] seg0, seg1, seg2
);
	
	reg [6:0] x_temp;
	
	//012_3456 (segments are active-low)
	parameter ZERO = 7'b000_0001;
	parameter ONE = 7'b100_1111;
	parameter TWO = 7'b001_0010;
	parameter THREE = 7'b000_0110;
	parameter FOUR = 7'b100_1100;
	parameter FIVE = 7'b010_0100;
	parameter SIX = 7'b010_0000;
	parameter SEVEN = 7'b000_1111;
	parameter EIGHT = 7'b000_0000;
	parameter NINE = 7'b000_1100;

	always @(x)
	if(x < 10) begin
		seg1 = ZERO;
		seg2 = ZERO;
		case (x)
			0: seg0 = ZERO;
			1: seg0 = ONE;
			2: seg0 = TWO;
			3: seg0 = THREE;
			4: seg0 = FOUR;
			5: seg0 = FIVE;
			6: seg0 = SIX;
			7: seg0 = SEVEN;
			8: seg0 = EIGHT;
			9: seg0 = NINE;
			default: seg0 = 7'b111_1111;
		endcase
	end 
	else if (x >= 10 && x < 20) begin
		x_temp = x - 10;
		case (x_temp)
			0: seg0 = ZERO;
			1: seg0 = ONE;
			2: seg0 = TWO;
			3: seg0 = THREE;
			4: seg0 = FOUR;
			5: seg0 = FIVE;
			6: seg0 = SIX;
			7: seg0 = SEVEN;
			8: seg0 = EIGHT;
			9: seg0 = NINE;
			default: seg0 = 7'b111_1111;
		endcase
		seg1 = ONE;
		seg2 = ZERO;
	end
	else if (x >= 20 && x < 30) begin
		x_temp = x - 20;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = TWO;
		seg2 = ZERO;
	end	
	else if (x >= 30 && x < 40) begin
		x_temp = x - 30;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = THREE;
		seg2 = ZERO;
	end	
	else if (x >= 40 && x < 50) begin
		x_temp = x - 40;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = FOUR;
		seg2 = ZERO;
	end	
	else if (x >= 50 && x < 60) begin
		x_temp = x - 50;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = FIVE;
		seg2 = ZERO;
	end	
	else if (x >= 60 && x < 70) begin
		x_temp = x - 60;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = SIX;
		seg2 = ZERO;
	end	
	else if (x >= 70 && x < 80) begin
		x_temp = x - 70;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = SEVEN;
		seg2 = ZERO;
	end	
	else if (x >= 80 && x < 90) begin
		x_temp = x - 80;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = EIGHT;
		seg2 = ZERO;
	end	
	else if (x >= 90 && x < 100) begin
		x_temp = x - 90;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = NINE;
		seg2 = ZERO;
	end	
	else if (x >= 100 && x < 110) begin
		x_temp = x - 100;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = ZERO;
		seg2 = ONE;
	end	
	else if (x >= 110 && x < 120) begin
		x_temp = x - 110;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = ONE;
		seg2 = ONE;
	end	
	else if (x >= 120 && x < 128) begin
		x_temp = x - 120;
			case (x_temp)
				0: seg0 = ZERO;
				1: seg0 = ONE;
				2: seg0 = TWO;
				3: seg0 = THREE;
				4: seg0 = FOUR;
				5: seg0 = FIVE;
				6: seg0 = SIX;
				7: seg0 = SEVEN;
				8: seg0 = EIGHT;
				9: seg0 = NINE;
				default: seg0 = 7'b111_1111;
			endcase
		seg1 = TWO;
		seg2 = ONE;
	end	
endmodule
