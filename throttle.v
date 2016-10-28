module throttle(
input CLK_50,
input reset,
input pb_freq_up,
input pb_freq_dn,

  
  
output slow_clk,
output freq_num,
);

	
always @(posedge CLK_50)
begin
	if (pb_freq_up == 1 & pb_freq_dn == 0)
    		begin
     		 freq_num = freq_num +1;
    		end
	else if (pb_freq_up ==0 & pb_freq_dn == 1)
		begin 
		 freq_num = freq_num - 1; 
		end
	else if (pb_freq_up == 1 & pb_freq_dn == 1)
		begin
		 freq_num = freq_num;
		end
	else (pb_freq_up == 0 & pb_freq_dm == 0)
		begin
		freq_num = freq_num;
		end
end
endmodule


