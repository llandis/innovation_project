module taglist_gen(
	input reset,
	input wire [1:0] lastEnd,
	output wire [31:0] ramData,
	output wire [6:0] seqNum,
	output wire w_e_RAM,
	output wire [9:0] seqWire
	);
	
	reg [2:0] pad = 3'b000; //establish registers
	reg [9:0] first = 10'b00_0000_0000;
	reg [9:0] firstNext = 10'b00_0000_0000;
	
	reg [3:0] RAMstate; //establish states
	reg [3:0] RAMstateUpdate;
	parameter INIT0= 0, SCAN = 1, END_SEQ=2, END_ROM = 3;
	
	always @ (posedge clk_1KHz)
	begin
		if (clk_1KHz) begin
			RAMstate <= RAMstateUpdate;
		end
		if (reset) begin
			RAMstate = INIT0;
		end
	end
	
	always @ (RAMstate or lastEnd or reset)
	begin
		case(RAMstate)
			
			INIT0: begin
				w_e_RAM <= 1'b0;
				ramData <= 32b'0000_0000_0000_0000_0000_0000_0000_0000;
				first <= 10'b00_0000_0000;
				firstNext <= 10'b00_0000_0000;
				seqNum <= 7'b000_0000;
				
				seqWire <= 10'b00_0000_0000;
				reg tic <= 1'b0;
				RAMstateUpdate = SCAN;
				
			end
			
			SCAN: begin
				if (w_e_RAM)
				begin
					w_e_RAM <= 1'b0;
					seqNum <= seqNum + 7'b000_0001;
				end
				first = firstNext;
				if (lastEnd == 2'b11 ) begin
					RAMstateUpdate=END_ROM;
				end
				else if (lastEnd == 2'b10) begin
					RAMstateUpdate = END_SEQ;
				end
				else if (lastEnd == 2'b00) begin
					seqWire = seqWire + 10'b00_0000_0001;
				end
			
			end
			
			END_SEQ: begin
				ramData [31:28] = 4'b0000;
				ramData [20:11] = first;
				ramData [10:1] = seqWire;
				ramData [27:21] = seqNum;
				ramData [0] = lastEnd [0];
				firstNext = seqWire + 10'b00_0000_0001;
				w_e_RAM = 1'b1; 
				RAMstateUpdate = SCAN;
			end
			
			END_ROM: begin	
				ramData [31:28] = 4'b0000;
				ramData [20:11] = first;
				ramData [10:1] = seqWire;
				ramData [27:21] = seqNum;
				ramData [0] = lastEnd [0];
				w_e_RAM = 1'b1;
			end
		endcase
	end
endmodule
