//External CPU_System
// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

module ext_cpu_system
  import obi_pkg::*;
  import core_v_mini_mcu_pkg::*;
#(
    parameter BOOT_ADDR = cei_mochila_pkg::DEBUG_BOOTROM_START_ADDRESS,
    parameter NHARTS = 3,
    parameter HARTID = 32'h01,
    parameter DM_HALTADDRESS = cei_mochila_pkg::DEBUG_BOOTROM_START_ADDRESS + 32'h50
) (
    // Clock and Reset
    input logic clk_i,
    input logic rst_ni,
    // Instruction memory interface 
    output obi_req_t  [NHARTS-1 : 0] core_instr_req_o,
    input  obi_resp_t [NHARTS-1 : 0] core_instr_resp_i,

    // Data memory interface 
    output obi_req_t  [NHARTS-1 : 0] core_data_req_o,
    input  obi_resp_t [NHARTS-1 : 0] core_data_resp_i,

    // Interrupt
    //Core 0
    input logic [31:0] intc_core0,
    //Core 1
    input logic [31:0] intc_core1,
    //Core 2
    input logic [31:0] intc_core2,

    output logic [NHARTS-1:0] new_irq_o,

    output logic     [NHARTS-1:0]   sleep_o,

    // Debug Interface
    input logic [NHARTS-1 : 0] debug_req_i,
    output logic [NHARTS-1 : 0] debug_mode_o
);

  logic fetch_enable; 
  // CPU Control Signals


  assign fetch_enable = 1'b1;
  
  //Core 0 
  assign core_instr_req_o[0].wdata = '0;
  assign core_instr_req_o[0].we    = '0;
  assign core_instr_req_o[0].be    = 4'b1111;
  
  // Core 1
  assign core_instr_req_o[1].wdata = '0;
  assign core_instr_req_o[1].we    = '0;
  assign core_instr_req_o[1].be    = 4'b1111;

  // Core 2
  assign core_instr_req_o[2].wdata = '0;
  assign core_instr_req_o[2].we    = '0;
  assign core_instr_req_o[2].be    = 4'b1111;  

always_comb begin

end


  
  // instantiate the core 0
    cve2_top #(
        .DmHaltAddr(DM_HALTADDRESS),
        .DmExceptionAddr('0)
    ) cv32e20_core0 (
        .clk_i (clk_i),
        .rst_ni(rst_ni),

        .test_en_i(1'b0),
        .ram_cfg_i('0),

        .hart_id_i  (32'h02),
        .boot_addr_i(BOOT_ADDR),

        .instr_addr_o  (core_instr_req_o[0].addr),
        .instr_req_o   (core_instr_req_o[0].req),
        .instr_rdata_i (core_instr_resp_i[0].rdata),
        .instr_gnt_i   (core_instr_resp_i[0].gnt),
        .instr_rvalid_i(core_instr_resp_i[0].rvalid),
        .instr_err_i   (1'b0),

        .data_addr_o  (core_data_req_o[0].addr),
        .data_wdata_o (core_data_req_o[0].wdata),
        .data_we_o    (core_data_req_o[0].we),
        .data_req_o   (core_data_req_o[0].req),
        .data_be_o    (core_data_req_o[0].be),
        .data_rdata_i (core_data_resp_i[0].rdata),
        .data_gnt_i   (core_data_resp_i[0].gnt),
        .data_rvalid_i(core_data_resp_i[0].rvalid),
        .data_err_i   (1'b0),

        .irq_software_i(),
        .irq_timer_i   (),
        .irq_external_i(),
        .irq_fast_i    (intc_core0[31:16]),
        .irq_nm_i      (1'b0),
        .new_irq_o(new_irq_o[0]),

        .debug_req_i (debug_req_i[0]),
        .crash_dump_o(),
        .debug_mode_o(debug_mode_o[0]),

        .fetch_enable_i(fetch_enable),
        .core_sleep_o(sleep_o[0])
    );
  
  
  // instantiate the core 1
    cve2_top #(
        .DmHaltAddr(DM_HALTADDRESS),
        .DmExceptionAddr('0)
    ) cv32e20_core1 (
        .clk_i (clk_i),
        .rst_ni(rst_ni),

        .test_en_i(1'b0),
        .ram_cfg_i('0),

        .hart_id_i  (32'h02),
        .boot_addr_i(BOOT_ADDR),

        .instr_addr_o  (core_instr_req_o[1].addr),
        .instr_req_o   (core_instr_req_o[1].req),
        .instr_rdata_i (core_instr_resp_i[1].rdata),
        .instr_gnt_i   (core_instr_resp_i[1].gnt),
        .instr_rvalid_i(core_instr_resp_i[1].rvalid),
        .instr_err_i   (1'b0),

        .data_addr_o  (core_data_req_o[1].addr),
        .data_wdata_o (core_data_req_o[1].wdata),
        .data_we_o    (core_data_req_o[1].we),
        .data_req_o   (core_data_req_o[1].req),
        .data_be_o    (core_data_req_o[1].be),
        .data_rdata_i (core_data_resp_i[1].rdata),
        .data_gnt_i   (core_data_resp_i[1].gnt),
        .data_rvalid_i(core_data_resp_i[1].rvalid),
        .data_err_i   (1'b0),

        .irq_software_i(),
        .irq_timer_i   (),
        .irq_external_i(),
        .irq_fast_i    (intc_core1[31:16]),
        .irq_nm_i      (1'b0),
        .new_irq_o(new_irq_o[1]),

        .debug_req_i (debug_req_i[1]),
        .crash_dump_o(),
        .debug_mode_o(debug_mode_o[1]),

        .fetch_enable_i(fetch_enable),
        .core_sleep_o(sleep_o[1])
    );

  // instantiate the core 2
    cve2_top #(
        .DmHaltAddr(DM_HALTADDRESS),
        .DmExceptionAddr('0)
    ) cv32e20_core2 (
        .clk_i (clk_i),
        .rst_ni(rst_ni),

        .test_en_i(1'b0),
        .ram_cfg_i('0),

        .hart_id_i  (HARTID),
        .boot_addr_i(BOOT_ADDR),

        .instr_addr_o  (core_instr_req_o[2].addr),
        .instr_req_o   (core_instr_req_o[2].req),
        .instr_rdata_i (core_instr_resp_i[2].rdata),
        .instr_gnt_i   (core_instr_resp_i[2].gnt),
        .instr_rvalid_i(core_instr_resp_i[2].rvalid),
        .instr_err_i   (1'b0),

        .data_addr_o  (core_data_req_o[2].addr),
        .data_wdata_o (core_data_req_o[2].wdata),
        .data_we_o    (core_data_req_o[2].we),
        .data_req_o   (core_data_req_o[2].req),
        .data_be_o    (core_data_req_o[2].be),
        .data_rdata_i (core_data_resp_i[2].rdata),
        .data_gnt_i   (core_data_resp_i[2].gnt),
        .data_rvalid_i(core_data_resp_i[2].rvalid),
        .data_err_i   (1'b0),

        .irq_software_i(),
        .irq_timer_i   (),
        .irq_external_i(),
        .irq_fast_i    (intc_core2[31:16]),
        .irq_nm_i      (1'b0),
        .new_irq_o(new_irq_o[2]),

        .debug_req_i (debug_req_i[2]),
        .crash_dump_o(),
        .debug_mode_o(debug_mode_o[2]),

        .fetch_enable_i(fetch_enable),
        .core_sleep_o(sleep_o[2])
    );
endmodule
