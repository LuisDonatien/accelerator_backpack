// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

`include "common_cells/assertions.svh"

module cb_heep_ctrl #(
    parameter type reg_req_t = logic,
    parameter type reg_rsp_t = logic
) (
    input logic clk_i,
    input logic rst_ni,

    // Bus Interface
    input  reg_req_t reg_req_i,
    output reg_rsp_t reg_rsp_o,

    //External Safe CPU wrapper control port
    input  logic EndSw_i,
    output logic [2:0] master_core_o,
    output logic safe_mode_o,
    output logic [1:0] safe_configuration_o,
    output logic critical_section_o,
    output logic Start_o,
    output logic [31:0] boot_addr_o

);

  cb_heep_ctrl_reg_pkg::cb_heep_ctrl_reg2hw_t reg2hw; // Write
  cb_heep_ctrl_reg_pkg::cb_heep_ctrl_hw2reg_t hw2reg; // Read

  cb_heep_ctrl_reg_top #(
      .reg_req_t(reg_req_t),
      .reg_rsp_t(reg_rsp_t)
  ) cb_heep_ctrl_reg_top_i (
      .clk_i,
      .rst_ni,
      .reg2hw,
      .hw2reg,
      .reg_req_i,
      .reg_rsp_o,
      .devmode_i(1'b1)
  );

  logic EndSw_Flag, en_sw_routineff;

//Reg2Hw read
  assign master_core_o = reg2hw.master_core.q;
  assign safe_mode_o = reg2hw.safe_mode.q;
  assign safe_configuration_o = reg2hw.safe_configuration.q;
  assign critical_section_o = reg2hw.critical_section.q;
  assign Start_o = reg2hw.start.q;
  assign boot_addr_o = reg2hw.boot_address.q;
 
  assign hw2reg.start.d = 1'b0;
  assign hw2reg.start.de = EndSw_Flag;

  assign hw2reg.end_sw_routine.d = EndSw_i;
  assign hw2reg.end_sw_routine.de = 1'b1;

  //Generate Flip-Flop Bi-Stable
  // When pos edge End_Program switch off start. When start switch off positive En_Program
  logic enable, clear;

  //synopsys sync_set_reset "enable"
  assign enable = !en_sw_routineff && EndSw_i;
  //synopsys sync_set_reset "clear"
  assign clear = !enable;
  //synopsys sync_set_reset "enable"
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      en_sw_routineff <= 1'b0;
      EndSw_Flag <= 1'b0;
    end else begin
      en_sw_routineff <= EndSw_i;
      if (clear)      
        EndSw_Flag <= 1'b0;
      else if(enable)   
        EndSw_Flag <= 1'b1;
      end
  end

endmodule : cb_heep_ctrl
