onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/slow_clk
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/fast_clk
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/reset
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/tag_write
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/romAddr
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/romData
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/rd_addr_from_harry
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/rd_data_to_harry
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/data_in
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/data_out
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/display_seq_num
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/display_start_address
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/display_end_address
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/seq_num
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/w_e_RAM
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/INIT0
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/SCAN
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/END_SEQ
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/END_ROM
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/clk_50MHz
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/reset
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/lastEnd
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/ramData
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/seqNum
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/seqWire
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/first
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/firstNext
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/RAMstate
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/i_taglist_gen/RAMstateUpdate
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {630000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 349
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {401431 ps} {584279 ps}
