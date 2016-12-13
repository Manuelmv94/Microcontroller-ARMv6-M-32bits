onerror {quit -f}
vlib work
vlog -work work Multiplicacion.vo
vlog -work work Multiplicacion.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Multiplicacion_vlg_vec_tst
vcd file -direction Multiplicacion.msim.vcd
vcd add -internal Multiplicacion_vlg_vec_tst/*
vcd add -internal Multiplicacion_vlg_vec_tst/i1/*
add wave /*
run -all
