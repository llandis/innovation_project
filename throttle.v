module throttle(
input CLK_50,
input reset,
input pb_freq_up,
input pb_freq_dn,
  
output reg slow_clk,
output [2:0] freq_num
);
	

wire dbUP;
wire dbDN;

reg [2:0] MUX_SEL;

//parameter COUNT_SIZE= 6, COUNT_SIZE1 = 5, COUNT_SIZE2 = 4, COUNT_SIZE3 = 3, COUNT_SIZE4 = 2, COUNT_SIZE5 = 1;
parameter COUNT_SIZE= 26, COUNT_SIZE1 = 25, COUNT_SIZE2 = 24, COUNT_SIZE3 = 23, COUNT_SIZE4 = 22, COUNT_SIZE5 = 21;


wire [COUNT_SIZE-1:0]count;

debouncer debounce1(pb_freq_up,CLK_50,dbUP,reset);
debouncer debounce2(pb_freq_dn,CLK_50,dbDN,reset);


always @(posedge CLK_50 or posedge reset)
begin
	if (reset == 1)
		MUX_SEL = 0; 
	else if ((MUX_SEL == 3'b000 && dbDN == 0 && dbUP == 1) || (MUX_SEL == 3'd5 && dbDN == 1 && dbUP == 0))
		MUX_SEL = MUX_SEL;
	else 
		begin
		if (dbUP == 0 && dbDN == 1)
     		MUX_SEL = MUX_SEL + 3'b001;
		else if (dbUP == 1 && dbDN == 0)
		 	MUX_SEL = MUX_SEL - 3'b001;
		end
		
	end
		
	clk_div div1(.clk(CLK_50),.reset(reset),.count(count));

	assign freq_num = MUX_SEL;
	
	always @(count or MUX_SEL)
	begin

		case(MUX_SEL)
		0: slow_clk = count[COUNT_SIZE-1];
		1: slow_clk = count[COUNT_SIZE1];
		2: slow_clk = count[COUNT_SIZE2];
		3: slow_clk = count[COUNT_SIZE3];
		4: slow_clk = count[COUNT_SIZE4];
		5: slow_clk = count[COUNT_SIZE5];
		default: slow_clk = count[COUNT_SIZE5];
		endcase
		
	end
		

endmodule


module debouncer (noisy,clk_50,debounced,reset);

input wire clk_50, noisy, reset;
output debounced;

reg db_8cycle;
reg db_8cycle_d1;

reg [7:0] reg1;

//reg: wait for stable
  always @ (posedge clk_50 or posedge reset) 
begin
	reg1[7:0] <= {reg1[6:0],noisy}; //shift register
		if (reset) reg1 <= 8'b0000_0000;
		else if (reg1[7:0] == 8'b00000000)
			db_8cycle <= 1'b0;
		else if (reg1[7:0] == 8'b11111111)
			db_8cycle <= 1'b1;
		else db_8cycle <= db_8cycle;
		
		db_8cycle_d1 <= db_8cycle;
		
end

assign debounced = db_8cycle & ~db_8cycle_d1;



endmodule 

module clk_div (
 
	input clk,
	input reset,
	output  reg [25:0] count
	);
	
	//parameter COUNT_SIZE= 26, COUNT_SIZE1 = 25, COUNT_SIZE2 = 24, COUNT_SIZE3 = 23, COUNT_SIZE4 = 22, COUNT_SIZE5 = 21;


	parameter MAX_COUNT = ((2 * 50000000) -1); 
	//parameter MAX_COUNT = 63; 
	
	always @(posedge clk or posedge reset)
	begin 
	
	if (reset == 1)
		count = 0;
	else if (count == MAX_COUNT)
		count = 0;
	else 
		count = count +1;
	end 
	           
	
endmodule
