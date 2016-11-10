transcript on
if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn {/data/haliu/NCG_Innovation_Project/knightriderinn/ROM_state.v}

vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn {/data/haliu/NCG_Innovation_Project/knightriderinn/tb_state_ROM.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn {/data/haliu/NCG_Innovation_Project/knightriderinn/ROM2Port.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn {/data/haliu/NCG_Innovation_Project/knightriderinn/RAM2Port.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L work -L work -voptargs="+acc"  tb_ROM_state

do wave1.do

view structure
view signals
run -all
