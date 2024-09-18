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

  logic EndSw_Flag, Start_Flag, en_sw_routineff, Startff;

  //Reg2Hw read
  assign master_core_o = reg2hw.master_core.q;
  assign safe_mode_o = reg2hw.safe_mode.q;
  assign safe_configuration_o = reg2hw.safe_configuration.q;
  assign critical_section_o = reg2hw.critical_section.q;
  assign Initial_Sync_Master_o = reg2hw.initial_sync_master.q;
  assign Start_o = reg2hw.start.q;
  assign End_sw_routine_o = reg2hw.end_sw_routine.q;

  //Hw2Reg always write

  //Detects pos-edges and write '1' to the register
/*  logic Debug_ext_req_i_ff;
  logic wen;
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      Debug_ext_req_i_ff <= 1'b0;
      wen <= 1'b0;
    end else begin
      Debug_ext_req_i_ff <= Debug_ext_req_i;
      wen <= 1'b0;
      
      if (Debug_ext_req_i_ff == 1'b0 && Debug_ext_req_i == 1'b1) 
        wen <=1'b1; 
    end
  end
  
*/
  assign hw2reg.external_debug_req.d =  {Start_Boot_i, en_ext_debug_i};   
  assign hw2reg.external_debug_req.de = 1'b1;
  assign hw2reg.end_sw_routine.d = 1'b0;
  assign hw2reg.end_sw_routine.de = Start_Flag;
  assign hw2reg.start.d = 1'b0;
  assign hw2reg.start.de = EndSw_Flag;

  //Generate Flip-Flop Bi-Stable
  // When pos edge End_Program switch off start. When start switch off positive En_Program
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      en_sw_routineff <= 1'b0;
      Startff <= 1'b0;
      EndSw_Flag <= 1'b0;
      Start_Flag <= 1'b0;
    end else begin
      en_sw_routineff <= reg2hw.end_sw_routine.q;
      Startff <= reg2hw.start.q;
      EndSw_Flag <= 1'b0;
      Start_Flag <= 1'b0;
      if (Startff == 1'b0 && reg2hw.start.q == 1'b1) 
        Start_Flag <= 1'b1;

      if (en_sw_routineff == 1'b0 && reg2hw.end_sw_routine.q == 1'b1) 
        EndSw_Flag <= 1'b1;
    end
  end

endmodule : safe_wrapper_ctrl
