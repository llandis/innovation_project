transcript on
if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/KROS_simonly.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/tb_kros.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/sequencer.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/bcd_conv.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/ROM2Port.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/RAM2Port.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/seg_disp.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/throttle.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/stateMachine_taglistRAM.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/ROM_state.v}
vlog -vlog01compat -work work +incdir+/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master {/data/haliu/NCG_Innovation_Project/knightriderinn/simulation/innovation_project-master/PushButton_Debouncer.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L work -L work -voptargs="+acc"  tb_kros



view structure
view signals
do wavehh.do
run -all
