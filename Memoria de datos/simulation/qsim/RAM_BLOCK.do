onerror {quit -f}
vlib work
vlog -work work RAM_BLOCK.vo
vlog -work work RAM_BLOCK.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.RAM_BLOCK_vlg_vec_tst
vcd file -direction RAM_BLOCK.msim.vcd
vcd add -internal RAM_BLOCK_vlg_vec_tst/*
vcd add -internal RAM_BLOCK_vlg_vec_tst/i1/*
add wave /*
run -all
