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
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/seq_num
add wave -noupdate -radix hexadecimal /tb_taglist_RAM/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2895781 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ns
update
WaveRestoreZoom {2873509 ps} {2901395 ps}
