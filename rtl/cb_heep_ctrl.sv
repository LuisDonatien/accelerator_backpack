// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

`include "common_cells/assertions.svh"

module cb_heep_ctrl 
  import cei_mochila_pkg::*;
  #(
    parameter type reg_req_t = logic,
    parameter type reg_rsp_t = logic,
    parameter NHARTS = 3,
    parameter cei_mochila_pkg::interrupt_type_e INTC_TYPE = cei_mochila_pkg::Intc_Iype
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
    output logic [31:0] boot_addr_o,

    input logic [NHARTS-1 : 0] debug_mode_i,
    input logic [NHARTS-1 : 0] sleep_i,

    output logic interrupt_o

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

  logic en_sw_routineff;


//Reg2Hw read
  assign master_core_o = reg2hw.master_core.q;
  assign safe_mode_o = reg2hw.safe_mode.q;
  assign safe_configuration_o = reg2hw.safe_configuration.q;
  assign critical_section_o = reg2hw.critical_section.q;
  assign Start_o = reg2hw.start.q;
  assign boot_addr_o = reg2hw.boot_address.q;

  assign hw2reg.start.d = 1'b0;
  assign hw2reg.start.de = enable_endSW;

  assign hw2reg.end_sw_routine.d = EndSw_i & sleep_i[0] & sleep_i[1] & sleep_i[2];
  assign hw2reg.end_sw_routine.de = 1'b1;



  if (INTC_TYPE == LEVEL)begin
    logic enable_endSW_wfi;// clear_endSW_wfi;
    logic en_sw_wfi_routineff;
    assign enable_endSW_wfi = !en_sw_wfi_routineff & EndSw_i & sleep_i[0] & sleep_i[1] & sleep_i[2];
    always_ff @(posedge clk_i or negedge rst_ni) begin
      if (!rst_ni) begin
        en_sw_wfi_routineff <= 1'b0;
      end else begin
        en_sw_wfi_routineff <= EndSw_i & sleep_i[0] & sleep_i[1] & sleep_i[2];
      end  
    end
    assign hw2reg.interrupt_controler.status_interrupt.d = 1'b1;
    assign hw2reg.interrupt_controler.status_interrupt.de = enable_endSW_wfi;
  end else begin
    assign hw2reg.interrupt_controler.status_interrupt.d = 1'b0;  //Status not hw write during edge mode. Check end sw reg.
    assign hw2reg.interrupt_controler.status_interrupt.de = 1'0;
  end

  assign hw2reg.cb_heep_status.cores_sleep.d = sleep_i;
  assign hw2reg.cb_heep_status.cores_sleep.de = 1'b1;

  assign hw2reg.cb_heep_status.cores_debug_mode.d = debug_mode_i;
  assign hw2reg.cb_heep_status.cores_debug_mode.de = 1'b1;  
 
  // When pos edge End_Program switch off start. When start switch off positive En_Program
  logic enable_endSW;//, clear_endSW;

  assign enable_endSW = !en_sw_routineff & EndSw_i;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      en_sw_routineff <= 1'b0;
    end else begin
      en_sw_routineff <= EndSw_i;
    end  
  end

  logic enable_interrupt;
  assign enable_interrupt = reg2hw.interrupt_controler.enable_interrupt.q;

  if (INTC_TYPE == LEVEL) begin :Interrupt_mode
    logic status_interrupt;
    logic load_intc, clear_intc;

    assign status_interrupt = reg2hw.interrupt_controler.status_interrupt.q;
    //synopsys sync_set_reset "load_intc"
    assign load_intc = enable_interrupt & status_interrupt;
    //synopsys sync_set_reset "clear_intc"
    assign clear_intc = !status_interrupt;
  
    always_ff @(posedge clk_i or negedge rst_ni) begin
      if (!rst_ni) begin
        interrupt_o <= 1'b0;
      end else begin
        if (clear_intc)      
          interrupt_o <= 1'b0;
        else if(load_intc)   
          interrupt_o <= sleep_i[0] & sleep_i[1] & sleep_i[2] & EndSw_i;
        end
    end
  end else begin
    logic load_intc;
    logic interrupt_ff;
    logic [1:0] edge_interrupt_ff;
    //synopsys sync_set_reset "load_intc"
    assign load_intc = enable_interrupt & !interrupt_ff & sleep_i[0] & sleep_i[1] & sleep_i[2] & EndSw_i; //edge detect interrupt
    always_ff @(posedge clk_i or negedge rst_ni) begin
      if (!rst_ni) begin
        edge_interrupt_ff <= '0;
        interrupt_ff      <= '0;
      end else begin
        interrupt_ff <= sleep_i[0] & sleep_i[1] & sleep_i[2] & EndSw_i;
        edge_interrupt_ff <= {edge_interrupt_ff[0], 1'b0}; 
        if (load_intc)
          edge_interrupt_ff <= 2'b11;
      end
    end
    assign interrupt_o = edge_interrupt_ff[1];    
  end


endmodule : cb_heep_ctrl
