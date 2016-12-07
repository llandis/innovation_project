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
