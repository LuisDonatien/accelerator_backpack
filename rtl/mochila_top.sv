// Mochila_TOP
// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

module mochila_top
  import obi_pkg::*;
  import core_v_mini_mcu_pkg::*;
  import cei_mochila_pkg::*;
#(
    parameter DM_HALTADDRESS = cei_mochila_pkg::DEBUG_BOOTROM_START_ADDRESS + 32'h50,
    parameter NHARTS = 3,
    parameter HARTID = 32'h01,
    parameter N_BANKS = 2
) (
    // Clock and Reset
    input logic clk_i,
    input logic rst_ni,

    //Bus External Master
    input  obi_req_t    ext_master_req_i,
    output obi_resp_t   ext_master_resp_o,

    //Bus External Slave
    output obi_req_t    ext_slave_req_o,
    input  obi_resp_t   ext_slave_resp_i,

    // Debug Interface
    input logic         debug_req_i,
    output logic force_error_o

);



//Signals

    // Internal master ports
    obi_req_t  [NHARTS-1 : 0] core_instr_req;
    obi_resp_t [NHARTS-1 : 0] core_instr_resp;

    obi_req_t  [NHARTS-1 : 0] core_data_req;
    obi_resp_t [NHARTS-1 : 0] core_data_resp;

    // Safe Wrapper Control/Status Register
    obi_req_t  wrapper_csr_req;
    obi_resp_t wrapper_csr_resp;    

    // Internal slave ports
    obi_req_t  peripheral_slave_req;
    obi_resp_t peripheral_slave_resp;

    // RAM memory ports
    obi_req_t  [N_BANKS-1:0]ram_req;
    obi_resp_t [N_BANKS-1:0]ram_resp;    

//CPU_System
safe_cpu_wrapper #(
        .HARTID(HARTID),
        .DM_HALTADDRESS  (DM_HALTADDRESS)
    )safe_cpu_wrapper_i(
    .clk_i,
    .rst_ni,

    // Instruction memory interface
    .core_instr_req_o(core_instr_req),
    .core_instr_resp_i(core_instr_resp),

    // Data memory interface
    .core_data_req_o(core_data_req),
    .core_data_resp_i(core_data_resp),

    // Wrapper Control & Status Rgister
    .wrapper_csr_req_i(wrapper_csr_req),
    .wrapper_csr_resp_o(wrapper_csr_resp),

    // Debug Interface
    .debug_req_i
);

//Peripheral System
periph_system periph_system_i(
    .clk_i,
    .rst_ni,
    .slave_req_i(peripheral_slave_req),
    .slave_resp_o(peripheral_slave_resp),
    .force_error_o(force_error_o)
);

memory_sys memory_sys_i(
    .clk_i,
    .rst_ni,

    .ram_req_i(ram_req),
    .ram_resp_o(ram_resp)   
);




//Bus System
bus_system #(
        .NHARTS(NHARTS)
    )bus_system_i(
    .clk_i,
    .rst_ni,

    // Internal master ports
    .core_instr_req_i(core_instr_req),
    .core_instr_resp_o(core_instr_resp),

    .core_data_req_i(core_data_req),
    .core_data_resp_o(core_data_resp),

    .ext_master_req_i,
    .ext_master_resp_o,
    .ext_slave_req_o,
    .ext_slave_resp_i,

    // Internal slave ports
    .peripheral_slave_req_o(peripheral_slave_req),
    .peripheral_slave_resp_i(peripheral_slave_resp),

    .ram_req_o(ram_req),
    .ram_resp_i(ram_resp),

    .wrapper_csr_req_o(wrapper_csr_req),
    .wrapper_csr_resp_i(wrapper_csr_resp)
);

endmodule
