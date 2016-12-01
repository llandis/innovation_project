module sequencer(
  input pb_seq_up,
  input pb_seq_dn,
  input slow_clk,
  input clk_50,
  input reset,

  output rom_addr,
  output seq_num
);
  
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
endmodule

