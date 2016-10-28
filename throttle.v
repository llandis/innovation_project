module throttle(
input CLK_50,
input reset,
input pb_freq_up,
input pb_freq_dn,
  
output slow_clk,
output freq_num,
);
	
wire WIDTH;
wire N;
wire dbUP;
wire dbDN;

assign count = 0;

debouncer debounce1(pb_freq_up,CLK_50,dbUP);
debouncer debounce2(pb_freq_dn,CLK_50,dbDN);

always @(posedge CLK_50)
begin
	if (reset == 1)
		begin 
		count = 0; 
		end
	else 
		begin
		count = count;
		end
	if ((count == 0 && dbDN == 1 && dbUP == 0) || (count == 5 && dbDN == 0 && dbUP ==1))
         	begin
		count = count;
		end	
	else 
		begin
		if (dbUP == 1 & dbDN == 0)
    		begin
     			 count = count +1;
    			end
		else if (dbUP ==0 & dbDN == 1)
			begin 
		 	count = count - 1; 
			end
		else if (dbUP == 1 & dbDN == 1)
			begin
			 count = count;
			end
		else if (dbUP == 0 && dbDN == 0)
			begin
			count = count;
			end
		end
	
assign freq_num = count;

	if (freq_num = 0)
		begin
			N = 2500000;
			WIDTH = 22;
		end
	else if (freq_num = 1)
		begin
			N = 12500000;
			WIDTH = 21;
		end
	else if (freq_num = 2)
		begin
			N = 830000;
			WIDTH = 20;
		end
	else if (freq_num = 3)
		begin
			N = 625000;
			WIDTH = 20;
		end
	else if (freq_num = 4)
		begin
			N = 500000;
			WIDTH = 19;
		end
	else if (freq_num = 5)
		begin
			N = 416000;
			WIDTH = 19;
		end
	end
		
clk_div div1 (WIDTH, N, clk,reset, slow_clk);
	
end
endmodule


module debouncer (noisy,clk_50,debounced);

input wire clk_50, noisy;
output reg debounced;

reg [7:0] reg;

//reg: wait for stable
  always @ (posedge clk_50) 
begin
reg[7:0] <= {reg[6:0],noisy}; //shift register
if(reg[7:0] == 8'b00000000)
  debounced <= 1'b0;
else if(reg[7:0] == 8'b11111111)
  debounced <= 1'b1;
else debounced <= debounced;
end

endmodule

module clk_div (WIDTH, N, clk,reset, slow_clk);
  
	input WIDTH = 3, // Width of the register required
	input N = 6// We will divide by 12 for example in this case
	input clk;
	input reset;
	output slow_clk;
	 
	reg [WIDTH-1:0] r_reg;
	wire [WIDTH-1:0] r_nxt;
	reg clk_track;
	 
	always @(posedge clk or posedge reset)
	 
	begin
	  if (reset)
	     begin
	        r_reg <= 0;
	      clk_track <= 1'b0;
	     end
	 
	  else if (r_nxt == N)
	        begin
	           r_reg <= 0;
	           clk_track <= ~clk_track;
	         end
	 
	  else 
	      r_reg <= r_nxt;
	end
	 
	assign r_nxt = r_reg+1;            
	assign slow_clk = clk_track;
endmodule

