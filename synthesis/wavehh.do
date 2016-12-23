onerror {resume}
quietly virtual signal -install /tb_kros/DUT/i_sequencer/RAM2Port_inst { /tb_kros/DUT/i_sequencer/RAM2Port_inst/data[27:21]} seq_num
quietly virtual signal -install /tb_kros/DUT/i_sequencer/RAM2Port_inst { /tb_kros/DUT/i_sequencer/RAM2Port_inst/data[20:11]} start_seq
quietly virtual signal -install /tb_kros/DUT/i_sequencer/RAM2Port_inst { /tb_kros/DUT/i_sequencer/RAM2Port_inst/data[10:1]} end_seq
quietly virtual signal -install /tb_kros/DUT/i_sequencer/RAM2Port_inst {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[0]  } last
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_kros/CLK_50
add wave -noupdate /tb_kros/DUT/i_sequencer/slow_clk
add wave -noupdate /tb_kros/pb_freq_up
add wave -noupdate /tb_kros/pb_freq_dn
add wave -noupdate /tb_kros/pb_seq_up
add wave -noupdate /tb_kros/pb_seq_dn
add wave -noupdate /tb_kros/reset
add wave -noupdate /tb_kros/LEDR
add wave -noupdate /tb_kros/HEX0
add wave -noupdate /tb_kros/HEX1
add wave -noupdate /tb_kros/HEX2
add wave -noupdate /tb_kros/HEX3
add wave -noupdate /tb_kros/HEX4
add wave -noupdate /tb_kros/HEX5
add wave -noupdate /tb_kros/DUT/i_seq_disp/seq_num_pass
add wave -noupdate /tb_kros/DUT/i_seq_disp/freq_num_pass
add wave -noupdate /tb_kros/DUT/i_seq_disp/rom_addr_pass
add wave -noupdate /tb_kros/DUT/i_throttle/freq_num
add wave -noupdate /tb_kros/DUT/i_sequencer/rom_addr
add wave -noupdate /tb_kros/DUT/i_sequencer/seq_num
add wave -noupdate /tb_kros/DUT/i_sequencer/next_seq_num
add wave -noupdate /tb_kros/DUT/i_sequencer/debounced_up
add wave -noupdate /tb_kros/DUT/i_sequencer/debounced_dn
add wave -noupdate /tb_kros/DUT/i_sequencer/up_frm_pb
add wave -noupdate /tb_kros/DUT/i_sequencer/dn_frm_pb
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/debounce0/PB
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/debounce0/PB_state
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/debounce0/PB_down
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/debounce0/PB_up
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/debounce0/PB_cnt
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/RAM2Port_inst/seq_num
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/RAM2Port_inst/start_seq
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/RAM2Port_inst/end_seq
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/RAM2Port_inst/last
add wave -noupdate -radix hexadecimal -childformat {{{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[31]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[30]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[29]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[28]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[27]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[26]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[25]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[24]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[23]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[22]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[21]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[20]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[19]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[18]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[17]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[16]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[15]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[14]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[13]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[12]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[11]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[10]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[9]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[8]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[7]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[6]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[5]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[4]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[3]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[2]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[1]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[0]} -radix hexadecimal}} -subitemconfig {{/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[31]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[30]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[29]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[28]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[27]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[26]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[25]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[24]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[23]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[22]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[21]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[20]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[19]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[18]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[17]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[16]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[15]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[14]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[13]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[12]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[11]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[10]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[9]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[8]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[7]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[6]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[5]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[4]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[3]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[2]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[1]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/RAM2Port_inst/data[0]} {-height 17 -radix hexadecimal}} /tb_kros/DUT/i_sequencer/RAM2Port_inst/data
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/RAM2Port_inst/wraddress
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/RAM2Port_inst/wren
add wave -noupdate -radix hexadecimal -childformat {{{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[9]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[8]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[7]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[6]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[5]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[4]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[3]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[2]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[1]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[0]} -radix hexadecimal}} -subitemconfig {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[9]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[8]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[7]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[6]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[5]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[4]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[3]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[2]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[1]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a[0]} {-height 17 -radix hexadecimal}} /tb_kros/DUT/i_sequencer/ROM2Port_inst/address_a
add wave -noupdate -radix hexadecimal -childformat {{{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[15]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[14]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[13]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[12]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[11]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[10]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[9]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[8]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[7]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[6]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[5]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[4]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[3]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[2]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[1]} -radix hexadecimal} {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[0]} -radix hexadecimal}} -subitemconfig {{/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[15]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[14]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[13]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[12]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[11]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[10]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[9]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[8]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[7]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[6]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[5]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[4]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[3]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[2]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[1]} {-height 17 -radix hexadecimal} {/tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a[0]} {-height 17 -radix hexadecimal}} /tb_kros/DUT/i_sequencer/ROM2Port_inst/q_a
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/ROM2Port_inst/address_b
add wave -noupdate -radix hexadecimal /tb_kros/DUT/i_sequencer/ROM2Port_inst/q_b
add wave -noupdate /tb_kros/DUT/i_sequencer/i_taglist_gen/RAMstate
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49640 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 363
configure wave -valuecolwidth 50
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {122136 ps}
