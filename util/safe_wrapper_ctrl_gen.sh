
echo "Generating RTL"
${PYTHON} ../../esl_epfl_x_heep/hw/vendor/pulp_platform_register_interface/vendor/lowrisc_opentitan/util/regtool.py -r -t ../rtl ../data/safe_wrapper_ctrl.hjson
mv ../rtl/safe_wrapper_ctrl_reg_pkg.sv ../rtl/include
