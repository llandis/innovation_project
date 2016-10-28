module rom_statem(clk_50, pb_seq_dn, reset, seq_num);

  input clk_50, pb_seq_dn;
  output [7:0] seq_num;

  reg [7:0] seq_num;
  reg state;
  reg nextstate;

  always @* 
    begin
      case(state)
      
 
   end

  always @(posedge clk  or posedge reset)
     if (reset)
      

endmodule
