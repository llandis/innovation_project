module sequencer(
  input pb_seq_up,
  input pb_seq_dn,
  input slow_clk,
  input CLK_50,
  input reset,

  output [9:0] rom_addr,
  output [5:0] seq_num
);
  
  always (@posedge CLK_50) begin
    if (pb_seq_up == 1 & pb_seq_dn == 0)
      seq_num <= seq_num + 1;
    else if (pb_seq_up == 0 & pb_seq_dn == 1)
      seq_num <= seq_num - 1;
    else if (pb_seq_up == 0 & pb_seq_dn ==0)
      seq_num <= seq_num;
  end
  
endmodule

