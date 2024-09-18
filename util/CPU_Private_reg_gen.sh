
echo "Generating RTL"
${PYTHON} ../../esl_epfl_x_heep/hw/vendor/pulp_platform_register_interface/vendor/lowrisc_opentitan/util/regtool.py -r -t ../rtl ../data/CPU_Private_reg.hjson
mv ../rtl/cpu_private_reg_pkg.sv ../rtl/include
