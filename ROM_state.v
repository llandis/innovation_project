// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// Generated by Quartus Prime Version 16.0.0 Build 211 04/27/2016 SJ Standard Edition
// Created on Wed Nov  2 11:10:02 2016

// synthesis message_off 10175

`timescale 1ns/1ns

module ROM_state (
    	clock_n,
	data_in,
	pb_seq_up,
	pb_seq_dn,
	reset,
    	load,
	addr,
	ram_counter,
	at_end_rst,
	addr_inc,
	ram_counter_inc,
	ram_counter_dec
);

    input clock_n;
    input [31:0] data_in;
	 //input at_end;
	 input pb_seq_up;
	 input pb_seq_dn;
	 input reset;
	//tri0 [31:0] data_in;
	// tri0 at_end;
	 //tri0 pb_seq_up;
	 //tri0 pb_seq_dn;
	 //tri0 reset;
    output reg load;
    output reg [9:0] addr;
    output reg [6:0] ram_counter;
    output reg [9:0] at_end_rst;
    output reg addr_inc;
    output reg ram_counter_inc;
    output reg ram_counter_dec;
	reg at_end;
    reg [5:0] fstate;
    reg [5:0] reg_fstate;
	reg [5:0] prev_fstate;
	reg delay_done;
	reg [1:0] delay_amt;
	reg [1:0] delay_i;
	//reg load_d1;
	//reg load_d2;
	wire [9:0] start_seq;
	wire [9:0] end_seq;
	wire last_ram;
	wire [6:0] curr_ram_count;
    parameter INIT=0,IN_SEQ=1,BOT_SEQ=2,NEXT_SEQ=3,PREV_SEQ=4,LAST_SEQ=5,WAIT_SEQ=6;
	
	assign curr_ram_count = data_in[27:21];
	assign start_seq = data_in[20:11];
	assign end_seq = data_in[10:1];
	assign last_ram = data_in[0];

    always @(posedge clock_n)
    begin
        if (clock_n) begin
            fstate <= reg_fstate;
			//load_d1 <= load;
			//load_d2 <= load_d1;
        end
    end
	
	always @(posedge clock_n)
	begin
		if(load == 1'b1) begin
			if(ram_counter + 1  == curr_ram_count)
				addr <= start_seq;
		end
		
		else if(addr_inc == 1'b1) begin
			addr <= addr + 1;
		end
		
		if(ram_counter_inc == 1'b1) begin
			ram_counter <= ram_counter + 1;
		end
		
		else if(ram_counter_dec == 1'b1) begin
			ram_counter <= ram_counter - 1;
		end
		
		if(end_seq == addr + 2)
			at_end <= 1;
		else if(end_seq != addr + 2)
			at_end <= 0;
	end

    always @(fstate or end_seq or start_seq or at_end or last_ram or pb_seq_up or pb_seq_dn or reset or delay_i or prev_fstate or addr)
    begin
        if (reset) begin
            reg_fstate <= INIT;
			prev_fstate <= INIT;
            load <= 1'b1;
            addr <= 10'b0000000000;
            ram_counter <= 6'b000000;
            at_end_rst <= 1'b0;
            addr_inc <= 1'b0;
            ram_counter_inc <= 1'b0;
            ram_counter_dec <= 1'b0;
			delay_done <= 1'b0;
			delay_amt <= 2'b00;
			delay_i <= 2'b00;
			//at_end <= 0;
        end
        else begin
            //load <= 1'b0;
            //addr <= 10'b0000000000;
            //ram_counter <= 6'b000000;
            //at_end_rst <= 1'b0;
            //addr_inc <= 1'b0;
            //ram_counter_inc <= 1'b0;
            //ram_counter_dec <= 1'b0;
            case (fstate)
                INIT: begin
                    if ((reset == 1'b0))
                        reg_fstate <= IN_SEQ;
                    else if ((reset == 1'b1))
                        reg_fstate <= INIT;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= INIT;

                    at_end_rst <= 1'b0;
                    //ram_counter <= 6'b000000;

                    //addr <= start_seq;

                    load <= 1'b0;
                end
                IN_SEQ: begin
					if ((pb_seq_dn == 1'b1 && start_seq == 10'b00_0000_0000))
                        //reg_fstate <= LAST_SEQ;
						reg_fstate <= IN_SEQ;
					else if ((pb_seq_up == 1'b1 && last_ram == 1'b1))
                        //reg_fstate <= INIT;
						reg_fstate <= IN_SEQ;
                    else if ((pb_seq_dn == 1'b1 && pb_seq_up == 1'b0))
                        reg_fstate <= PREV_SEQ;
                    else if ((pb_seq_up == 1'b1 && pb_seq_dn == 1'b0))
                        reg_fstate <= NEXT_SEQ;
                    else if ((at_end == 1'b1))
                        reg_fstate <= BOT_SEQ;
                    else if ((at_end == 1'b0))
                        reg_fstate <= IN_SEQ;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= IN_SEQ;

                    addr_inc <= 1'b1;
                    at_end_rst <= 1'b0;
                    load <= 1'b0;
					ram_counter_inc <= 1'b0;
					ram_counter_dec <= 1'b0;
					delay_done <= 1'b0;
					delay_i <= 2'b00;
                end
                BOT_SEQ: begin
                    if ((at_end == 1'b0))
                        reg_fstate <= IN_SEQ;
                    else if ((pb_seq_up == 1'b1 && pb_seq_dn == 1'b0))
                        reg_fstate <= NEXT_SEQ;
                    else if ((pb_seq_dn == 1'b1 && pb_seq_up == 1'b0))
                        reg_fstate <= PREV_SEQ;
                    else if ((pb_seq_dn == 1'b1 && addr == 10'b00_0000_0000))
                        reg_fstate <= LAST_SEQ;
                    else if ((pb_seq_up == 1'b1 && last_ram == 1'b1))
                        reg_fstate <= INIT;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= BOT_SEQ;

                    at_end_rst <= 1'b1;
                    //addr <= start[9:0];

                    load <= 1'b1;
                end
                NEXT_SEQ: begin
                    if ((pb_seq_up == 0 && delay_done == 1'b1))
                        reg_fstate <= IN_SEQ;
					else if((delay_amt > 0 && delay_done == 1'b0)) begin
						reg_fstate <= WAIT_SEQ;
						prev_fstate <= NEXT_SEQ;
					end
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= NEXT_SEQ;

                    //addr <= start[9:0];
					if(delay_done == 1'b0) begin
						load <= 1'b1;
						ram_counter_inc <= 1'b1;
						addr_inc <= 1'b0;
						delay_amt <= 2'b10;
					end
                end
                PREV_SEQ: begin
                    if ((pb_seq_dn == 0 && delay_done == 1'b1))
                        reg_fstate <= IN_SEQ;
					else if((delay_amt > 0 && delay_done == 1'b0)) begin
						reg_fstate <= WAIT_SEQ;
						prev_fstate <= PREV_SEQ;
					end
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= PREV_SEQ;

                    //ram_counter_dec <= 1'b1;
					if(delay_done == 1'b0) begin
						load <= 1'b1;
						ram_counter_dec <= 1'b1;
						addr_inc <= 1'b0;
						delay_amt <= 2'b10;
					end
                    //addr <= start[9:0];

                    //load <= 1'b1;
                end
                LAST_SEQ: begin
                    if ((pb_seq_dn == 0 && addr == 10'b00_0000_0000))
                        reg_fstate <= IN_SEQ;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= LAST_SEQ;
					//if(last_ram == 1)
						//ram_counter <= curr_ram_count;

                    //addr <= start[9:0];

                    load <= 1'b1;
                end
				WAIT_SEQ: begin
					if((delay_i == delay_amt)) begin
						reg_fstate <= prev_fstate;
						delay_done <= 1'b1;
					end
					else begin
						delay_i = delay_i + 1;
						reg_fstate <= WAIT_SEQ;
					end
					ram_counter_inc <= 1'b0;
					ram_counter_dec <= 1'b0;
				end
                default: begin
                    load <= 1'bx;
                    addr <= 10'bxxxxxxxxxx;
                    ram_counter <= 6'bxxxxxx;
                    at_end_rst <= 1'bx;
                    addr_inc <= 1'bx;
                    ram_counter_inc <= 1'bx;
                    ram_counter_dec <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
        end
    end
endmodule // ROM_state
