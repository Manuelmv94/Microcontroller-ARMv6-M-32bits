onerror {quit -f}
vlib work
vlog -work work Micro_and_Memories.vo
vlog -work work Micro_and_Memories.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Micro_and_Memories_vlg_vec_tst
vcd file -direction Micro_and_Memories.msim.vcd
vcd add -internal Micro_and_Memories_vlg_vec_tst/*
vcd add -internal Micro_and_Memories_vlg_vec_tst/i1/*
add wave /*
run -all
