module sequencer(
  input pb_seq_up,
  input pb_seq_dn,
  input slow_clk,
  input clk_50,
  input reset,

  output ROM_addr,
  output seq_num,
  output LEDS,
  always ( ) begin
   // seq_num = 0;
   // if (pb_seq_up == 1 & pb_seq_dn == 0) begin
    //  seq_num = seq_num + 1;
   // end
   // else if (pb_seq_up == 0 & pb_seq_dn == 1) begin
   //   seq_num = seq_num - 1;
   // end
   // else if (pb_seq_up == 0 & pb_seq_dn ==0) begin
     // seq_num = seq_num
   // end
  end
);
endmodule

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
