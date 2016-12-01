module taglist_gen(
	input clk_50MHz,
	input reset,
	input [1:0] lastEnd,
	output reg [31:0] ramData,
	output reg [6:0] seqNum,
	output reg w_e_RAM,
	output reg [9:0] seqWire
	);

	wire [6:0] display_seq_num;
	wire [9:0] display_start_address;
	wire [9:0] display_end_address;
	wire display_eof;
		
	reg [9:0] first = 10'b00_0000_0000;
	reg [9:0] firstNext = 10'b00_0000_0000;
	
	reg [3:0] RAMstate = 4'b0000; //establish states
	//reg [3:0] RAMstateUpdate = 4'b0000;
	parameter INIT0= 0, SCAN = 1, END_SEQ=2, END_ROM = 3, FINAL=4;

	assign display_seq_num = ramData[27:21];
	assign display_start_address = ramData[20:11];
	assign display_end_address = ramData[10:1];
	assign display_eof = ramData[0];
	
	

	
	always @ (posedge clk_50MHz)
	begin
	
		if (reset) begin
			RAMstate <= INIT0;
		end
		case(RAMstate)
			
			INIT0: begin
				w_e_RAM <= 1'b0;
				ramData <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
				first <= 10'b00_0000_0000;
				firstNext <= 10'b00_0000_0000;
				seqNum <= 7'b000_0000;
				
				seqWire <= 10'b00_0000_0000;
				RAMstate <= SCAN;
				
			end
			
			SCAN: begin
				if (w_e_RAM)
				begin
					w_e_RAM <= 1'b0;
					seqNum <= seqNum + 7'b000_0001;
				end
				first <= firstNext;
				
				if (lastEnd == 2'b11 ) begin
					RAMstate<=END_ROM;
				end
				else if (lastEnd == 2'b10) begin
					RAMstate <= END_SEQ;
				end
				else begin
					seqWire <= seqWire + 10'b00_0000_0001;
					RAMstate <= SCAN;
				end
			end
			
			END_SEQ: begin
				ramData [31:28] <= 4'b0000;
				ramData [20:11] <= first;
				ramData [10:1]  <= seqWire;
				ramData [27:21] <= seqNum;
				ramData [0] <= lastEnd [0];
				firstNext <= seqWire + 10'b00_0000_0001;
				w_e_RAM <= 1'b1; 
				RAMstate <= SCAN;
				seqWire <= seqWire + 10'b00_0000_0001;
			end
			
	
		END_ROM: begin	
				ramData [31:28] <= 4'b0000;
				ramData [20:11] <= first;
				ramData [10:1]  <= seqWire;
				ramData [27:21] <= seqNum;
				ramData [0] <= lastEnd [0];
				w_e_RAM <= 1'b1;
				RAMstate <= FINAL;
			end
			
		FINAL: begin
			w_e_RAM <= 1'b0;
		end
		
		endcase
	end
endmodule