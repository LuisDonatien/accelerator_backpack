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
    output logic force_error_o

);

  import cb_heep_ctrl_reg_pkg::* ;

  cb_heep_ctrl_hw2reg_t hw2reg;
  cb_heep_ctrl_reg2hw_t reg2hw; // Write
`ifndef SYNTHESIS
  logic testbench_set_exit_loop[1];
  //forced by simulation for preloading, do not touch
  //only arrays can be "forced" in verilator, thus array of 1 element is done
  //At synthesis time this signal will get removed
  always_ff @(posedge clk_i or negedge rst_ni) begin : proc_
    if (~rst_ni) begin
      testbench_set_exit_loop[0] <= '0;
    end
  end
  assign hw2reg.exit_loop.d  = testbench_set_exit_loop[0];
  assign hw2reg.exit_loop.de= testbench_set_exit_loop[0];
`else
  assign hw2reg.exit_loop.d = 1'b0;
  assign hw2reg.exit_loop.de = 1'b0;
`endif

assign force_error_o = reg2hw.force_soft_error.q;

  cb_heep_ctrl_reg_top #(
      .reg_req_t(reg_req_t),
      .reg_rsp_t(reg_rsp_t)
  ) cb_heep_ctrl_reg_top_i (
      .clk_i,
      .rst_ni,
      .reg_req_i,
      .reg_rsp_o,
      .hw2reg,
      .reg2hw,
      .devmode_i(1'b1)
  );



endmodule : cb_heep_ctrl
