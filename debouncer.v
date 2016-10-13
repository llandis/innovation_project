module debouncer (noisy,clk_1KHz,debounced);

input wire clk_1KHz, noisy;
output reg debounced;

reg [7:0] reg;

//reg: wait for stable
always @ (posedge clk_1KHz) 
begin
reg[7:0] <= {reg[6:0],noisy}; //shift register
if(reg[7:0] == 8'b00000000)
  debounced <= 1'b0;
else if(reg[7:0] == 8'b11111111)
  debounced <= 1'b1;
else debounced <= debounced;
end

endmodule
