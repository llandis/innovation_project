module throttle(
input CLK_50,
input reset,
input pb_freq_up,
input pb_freq_dn,

  
  
output slow_clk,
output freq_num,
);
wire dbUP
wire dbDN

debouncer (pb_freq_up,CLK_50,dbUP);
debouncer (pb_freq_dn,CLK_50,dbDN);

always @(posedge CLK_50)
begin
	if (reset == 1)
		begin 
		freq_num = 0; 
		end
	else 
		begin
		freq_num = freq_num;
		end
	if (freq_num = 0 || freq_num=5)
         	begin
		freq_num=freq_num;
		end	
	else 
		begin
		if (dbUP == 1 & dbDN == 0)
    			begin
     			 freq_num = freq_num +1;
    			end
		else if (dbUP ==0 & dbDN == 1)
			begin 
		 	freq_num = freq_num - 1; 
			end
		else if (dbUP == 1 & dbDN == 1)
			begin
			 freq_num = freq_num;
			end
		else 
			begin
			freq_num = freq_num;
			end
		end
	
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

