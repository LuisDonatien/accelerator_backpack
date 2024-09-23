// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

`include "common_cells/assertions.svh"

module safe_wrapper_ctrl #(
    parameter type reg_req_t = logic,
    parameter type reg_rsp_t = logic
) (
    input logic clk_i,
    input logic rst_ni,

    // Bus Interface
    input  reg_req_t reg_req_i,
    output reg_rsp_t reg_rsp_o,

    // External Control Signal
    input logic [2:0] ext_master_core_i,
    input logic ext_safe_mode_i,
    input logic [1:0] ext_safe_configuration_i,
    input logic ext_critical_section_i,
    input logic ext_Start_i,
    input logic [31:0] boot_addr_i,

    // Safe wrapper Signal -> Internal FSM
    output logic [2:0] master_core_o,
    output logic safe_mode_o,
    output logic [1:0] safe_configuration_o,
    output logic critical_section_o,
    output logic Initial_Sync_Master_o,
    output logic Start_o,
    output logic End_sw_routine_o,
    //input logic Debug_ext_req_i,
    input logic Start_Boot_i,
    input logic en_ext_debug_i
);

  import safe_wrapper_ctrl_reg_pkg::*;


  safe_wrapper_ctrl_reg2hw_t reg2hw;
  safe_wrapper_ctrl_hw2reg_t hw2reg;

  safe_wrapper_ctrl_reg_top #(
      .reg_req_t(reg_req_t),
      .reg_rsp_t(reg_rsp_t)
  ) safe_wrapper_ctrl_reg_top_i (
      .clk_i,
      .rst_ni,
      .reg_req_i,
      .reg_rsp_o,
      .reg2hw,
      .hw2reg,
      .devmode_i(1'b1)
  );

  logic Start_Flag, Startff;

  //Reg2Hw read
  always_comb begin
    
    if (ext_Start_i == 1'b0) begin  //External config from external MM CB-HEEP Controler
      assign master_core_o = ext_master_core_i;
      assign safe_mode_o = ext_safe_mode_i;
      assign safe_configuration_o = ext_safe_configuration_i;
      assign critical_section_o = ext_critical_section_i;

      assign hw2reg.master_core.de = 1'b1;
      assign hw2reg.master_core.d = ext_master_core_i;
      assign hw2reg.safe_mode.de = 1'b1;
      assign hw2reg.safe_mode.d = ext_safe_mode_i;
      assign hw2reg.safe_configuration.de = 1'b1;
      assign hw2reg.safe_configuration.d = ext_safe_configuration_i;
      assign hw2reg.critical_section.de = 1'b1;
      assign hw2reg.critical_section.d = ext_critical_section_i;
    end
    else begin //Reg2Hw read
      assign master_core_o = reg2hw.master_core.q;
      assign safe_mode_o = reg2hw.safe_mode.q;
      assign safe_configuration_o = reg2hw.safe_configuration.q;
      assign critical_section_o = reg2hw.critical_section.q;

      assign hw2reg.master_core.de = 1'b0;
      assign hw2reg.master_core.d = '0;
      assign hw2reg.safe_mode.de = 1'b0;
      assign hw2reg.safe_mode.d = '0;
      assign hw2reg.safe_configuration.de = 1'b0;
      assign hw2reg.safe_configuration.d = '0;
      assign hw2reg.critical_section.de = 1'b0;
      assign hw2reg.critical_section.d = '0;
    end
  end
  assign End_sw_routine_o = reg2hw.end_sw_routine.q;
  assign Initial_Sync_Master_o = reg2hw.initial_sync_master.q;
  assign Start_o = ext_Start_i;

  assign hw2reg.external_debug_req.d =  {Start_Boot_i, en_ext_debug_i};   
  assign hw2reg.external_debug_req.de = 1'b1;
  
  assign hw2reg.end_sw_routine.d = 1'b0;
  assign hw2reg.end_sw_routine.de = Start_Flag;

  assign hw2reg.entry_address.d = boot_addr_i;
  assign hw2reg.entry_address.de = !ext_Start_i;
  //Generate Flip-Flop Bi-Stable
  // When pos edge End_Program switch off start. When start switch off positive En_Program
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      Startff <= 1'b0;
      Start_Flag <= 1'b0;
    end else begin
      Startff <= ext_Start_i;
      Start_Flag <= 1'b0;
      if (Startff == 1'b0 && ext_Start_i == 1'b1) 
        Start_Flag <= 1'b1;
    end
  end

endmodule : safe_wrapper_ctrl
