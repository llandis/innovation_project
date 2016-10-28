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


