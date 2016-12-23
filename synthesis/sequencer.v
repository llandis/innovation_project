module sequencer(
  input pb_seq_up,
  input pb_seq_dn,
  input slow_clk,
  input CLK_50,
  input reset,
  
  output [9:0] rom_addr,
  output reg [5:0] seq_num,
  output [9:0] LEDR
);

wire load;
wire [9:0] addr;
wire [9:0] addr_from_rom_state;
wire [15:0] ROM_to_LED;
wire at_end_rst;
wire addr_inc;
wire ram_counter_inc;
wire ram_counter_dec;
wire [31:0] RAM_Data_Out;
wire [31:0] RAM_Data_In;
wire [6:0] rdaddress;
wire [1:0] last_two_ROM;
wire tag_write;
wire [6:0] seq_num_RAM;
wire [15:0] ROM_data;

assign rom_addr = addr;	
assign last_two_ROM [1:0] = ROM_data [1:0]; 
assign LEDR = ROM_to_LED[15:6];

reg [5:0] next_seq_num;
reg up_frm_pb;
reg dn_frm_pb;
wire temp0, temp1, debounced_up, debounced_dn;


PushButton_Debouncer debounce0(CLK_50, pb_seq_up, temp0, debounced_up);
PushButton_Debouncer debounce1(CLK_50, pb_seq_dn, temp1, debounced_dn);

  always @(posedge CLK_50 or posedge reset) begin
	
	 if (reset)
	 begin
		seq_num <= 6'b00_0000;
		dn_frm_pb <= 0;
		up_frm_pb <= 0;
	end
	else if (~reset)
	begin
		seq_num <= next_seq_num;
		dn_frm_pb <= debounced_dn;
		up_frm_pb <= debounced_up;
	end
  end
  
  always @(seq_num or dn_frm_pb or up_frm_pb) begin
	next_seq_num = seq_num;
	if(~dn_frm_pb && up_frm_pb)
		next_seq_num = seq_num - 1;
	if(dn_frm_pb && ~up_frm_pb)
		next_seq_num = seq_num + 1;
	end
	
ROM_state ROM_state_i (
	.clock_p(slow_clk),
  	.data_in(RAM_Data_Out),
	.pb_seq_up(up_frm_pb),
	.pb_seq_dn(dn_frm_pb),
	.reset(reset),
	.load(load),
	.addr(addr_from_rom_state),
  	.ram_counter(rdaddress),
	.at_end_rst(at_end_rst),
	.addr_inc(addr_inc),
	.ram_counter_inc(ram_counter_inc),
	.ram_counter_dec(ram_counter_dec)
	);
  
taglist_gen i_taglist_gen(
	.clk_50MHz(CLK_50),
	.reset(reset),
	.lastEnd(last_two_ROM),
	.ramData(RAM_Data_In),
	.seqNum(seq_num_RAM),
	.w_e_RAM(tag_write),
	.seqWire(addr)
);

RAM2Port RAM2Port_inst (
	.data (RAM_Data_In),
   .rdaddress (rdaddress),
   .rdclock ( slow_clk ),
	.wraddress (seq_num_RAM),
	.wrclock (CLK_50),
	.wren (tag_write),
	.q (RAM_Data_Out)
	);
  
  
ROM2Port ROM2Port_inst (
	.address_a (addr),
	.address_b (addr_from_rom_state),
	.clock_a (CLK_50),
	.clock_b (slow_clk),
	.q_a (ROM_data),
	.q_b (ROM_to_LED)
	);
	
endmodule