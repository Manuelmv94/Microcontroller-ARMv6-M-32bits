onerror {quit -f}
vlib work
vlog -work work Sumador_CarryLookahead.vo
vlog -work work Sumador_CarryLookahead.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Sumador_CarryLookahead_vlg_vec_tst
vcd file -direction Sumador_CarryLookahead.msim.vcd
vcd add -internal Sumador_CarryLookahead_vlg_vec_tst/*
vcd add -internal Sumador_CarryLookahead_vlg_vec_tst/i1/*
add wave /*
run -all
