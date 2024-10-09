// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`


`include "common_cells/assertions.svh"

module cb_heep_ctrl_reg_top #(
  parameter type reg_req_t = logic,
  parameter type reg_rsp_t = logic,
  parameter int AW = 6
) (
  input logic clk_i,
  input logic rst_ni,
  input  reg_req_t reg_req_i,
  output reg_rsp_t reg_rsp_o,
  // To HW
  output cb_heep_ctrl_reg_pkg::cb_heep_ctrl_reg2hw_t reg2hw, // Write
  input  cb_heep_ctrl_reg_pkg::cb_heep_ctrl_hw2reg_t hw2reg, // Read


  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import cb_heep_ctrl_reg_pkg::* ;

  localparam int DW = 32;
  localparam int DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  // Below register interface can be changed
  reg_req_t  reg_intf_req;
  reg_rsp_t  reg_intf_rsp;


  assign reg_intf_req = reg_req_i;
  assign reg_rsp_o = reg_intf_rsp;


  assign reg_we = reg_intf_req.valid & reg_intf_req.write;
  assign reg_re = reg_intf_req.valid & ~reg_intf_req.write;
  assign reg_addr = reg_intf_req.addr;
  assign reg_wdata = reg_intf_req.wdata;
  assign reg_be = reg_intf_req.wstrb;
  assign reg_intf_rsp.rdata = reg_rdata;
  assign reg_intf_rsp.error = reg_error;
  assign reg_intf_rsp.ready = 1'b1;

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err;


  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic [1:0] safe_configuration_qs;
  logic [1:0] safe_configuration_wd;
  logic safe_configuration_we;
  logic safe_mode_qs;
  logic safe_mode_wd;
  logic safe_mode_we;
  logic [2:0] master_core_qs;
  logic [2:0] master_core_wd;
  logic master_core_we;
  logic critical_section_qs;
  logic critical_section_wd;
  logic critical_section_we;
  logic start_qs;
  logic start_wd;
  logic start_we;
  logic [31:0] boot_address_qs;
  logic [31:0] boot_address_wd;
  logic boot_address_we;
  logic end_sw_routine_qs;
  logic end_sw_routine_wd;
  logic end_sw_routine_we;
  logic interrupt_controler_enable_interrupt_qs;
  logic interrupt_controler_enable_interrupt_wd;
  logic interrupt_controler_enable_interrupt_we;
  logic interrupt_controler_status_interrupt_qs;
  logic interrupt_controler_status_interrupt_wd;
  logic interrupt_controler_status_interrupt_we;
  logic [2:0] cb_heep_status_cores_sleep_qs;
  logic [2:0] cb_heep_status_cores_debug_mode_qs;

  // Register instances
  // R[safe_configuration]: V(False)

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_safe_configuration (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (safe_configuration_we),
    .wd     (safe_configuration_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.safe_configuration.q ),

    // to register interface (read)
    .qs     (safe_configuration_qs)
  );


  // R[safe_mode]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_safe_mode (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (safe_mode_we),
    .wd     (safe_mode_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.safe_mode.q ),

    // to register interface (read)
    .qs     (safe_mode_qs)
  );


  // R[master_core]: V(False)

  prim_subreg #(
    .DW      (3),
    .SWACCESS("RW"),
    .RESVAL  (3'h1)
  ) u_master_core (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (master_core_we),
    .wd     (master_core_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.master_core.q ),

    // to register interface (read)
    .qs     (master_core_qs)
  );


  // R[critical_section]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_critical_section (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (critical_section_we),
    .wd     (critical_section_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.critical_section.q ),

    // to register interface (read)
    .qs     (critical_section_qs)
  );


  // R[start]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_start (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (start_we),
    .wd     (start_wd),

    // from internal hardware
    .de     (hw2reg.start.de),
    .d      (hw2reg.start.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.start.q ),

    // to register interface (read)
    .qs     (start_qs)
  );


  // R[boot_address]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RW"),
    .RESVAL  (32'h0)
  ) u_boot_address (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (boot_address_we),
    .wd     (boot_address_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.boot_address.q ),

    // to register interface (read)
    .qs     (boot_address_qs)
  );


  // R[end_sw_routine]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_end_sw_routine (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (end_sw_routine_we),
    .wd     (end_sw_routine_wd),

    // from internal hardware
    .de     (hw2reg.end_sw_routine.de),
    .d      (hw2reg.end_sw_routine.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (end_sw_routine_qs)
  );


  // R[interrupt_controler]: V(False)

  //   F[enable_interrupt]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_interrupt_controler_enable_interrupt (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (interrupt_controler_enable_interrupt_we),
    .wd     (interrupt_controler_enable_interrupt_wd),

    // from internal hardware
    .de     (hw2reg.interrupt_controler.enable_interrupt.de),
    .d      (hw2reg.interrupt_controler.enable_interrupt.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.interrupt_controler.enable_interrupt.q ),

    // to register interface (read)
    .qs     (interrupt_controler_enable_interrupt_qs)
  );


  //   F[status_interrupt]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_interrupt_controler_status_interrupt (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (interrupt_controler_status_interrupt_we),
    .wd     (interrupt_controler_status_interrupt_wd),

    // from internal hardware
    .de     (hw2reg.interrupt_controler.status_interrupt.de),
    .d      (hw2reg.interrupt_controler.status_interrupt.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.interrupt_controler.status_interrupt.q ),

    // to register interface (read)
    .qs     (interrupt_controler_status_interrupt_qs)
  );


  // R[cb_heep_status]: V(False)

  //   F[cores_sleep]: 2:0
  prim_subreg #(
    .DW      (3),
    .SWACCESS("RO"),
    .RESVAL  (3'h0)
  ) u_cb_heep_status_cores_sleep (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.cb_heep_status.cores_sleep.de),
    .d      (hw2reg.cb_heep_status.cores_sleep.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (cb_heep_status_cores_sleep_qs)
  );


  //   F[cores_debug_mode]: 5:3
  prim_subreg #(
    .DW      (3),
    .SWACCESS("RO"),
    .RESVAL  (3'h0)
  ) u_cb_heep_status_cores_debug_mode (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.cb_heep_status.cores_debug_mode.de),
    .d      (hw2reg.cb_heep_status.cores_debug_mode.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (cb_heep_status_cores_debug_mode_qs)
  );




  logic [8:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[0] = (reg_addr == CB_HEEP_CTRL_SAFE_CONFIGURATION_OFFSET);
    addr_hit[1] = (reg_addr == CB_HEEP_CTRL_SAFE_MODE_OFFSET);
    addr_hit[2] = (reg_addr == CB_HEEP_CTRL_MASTER_CORE_OFFSET);
    addr_hit[3] = (reg_addr == CB_HEEP_CTRL_CRITICAL_SECTION_OFFSET);
    addr_hit[4] = (reg_addr == CB_HEEP_CTRL_START_OFFSET);
    addr_hit[5] = (reg_addr == CB_HEEP_CTRL_BOOT_ADDRESS_OFFSET);
    addr_hit[6] = (reg_addr == CB_HEEP_CTRL_END_SW_ROUTINE_OFFSET);
    addr_hit[7] = (reg_addr == CB_HEEP_CTRL_INTERRUPT_CONTROLER_OFFSET);
    addr_hit[8] = (reg_addr == CB_HEEP_CTRL_CB_HEEP_STATUS_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = (reg_we &
              ((addr_hit[0] & (|(CB_HEEP_CTRL_PERMIT[0] & ~reg_be))) |
               (addr_hit[1] & (|(CB_HEEP_CTRL_PERMIT[1] & ~reg_be))) |
               (addr_hit[2] & (|(CB_HEEP_CTRL_PERMIT[2] & ~reg_be))) |
               (addr_hit[3] & (|(CB_HEEP_CTRL_PERMIT[3] & ~reg_be))) |
               (addr_hit[4] & (|(CB_HEEP_CTRL_PERMIT[4] & ~reg_be))) |
               (addr_hit[5] & (|(CB_HEEP_CTRL_PERMIT[5] & ~reg_be))) |
               (addr_hit[6] & (|(CB_HEEP_CTRL_PERMIT[6] & ~reg_be))) |
               (addr_hit[7] & (|(CB_HEEP_CTRL_PERMIT[7] & ~reg_be))) |
               (addr_hit[8] & (|(CB_HEEP_CTRL_PERMIT[8] & ~reg_be)))));
  end

  assign safe_configuration_we = addr_hit[0] & reg_we & !reg_error;
  assign safe_configuration_wd = reg_wdata[1:0];

  assign safe_mode_we = addr_hit[1] & reg_we & !reg_error;
  assign safe_mode_wd = reg_wdata[0];

  assign master_core_we = addr_hit[2] & reg_we & !reg_error;
  assign master_core_wd = reg_wdata[2:0];

  assign critical_section_we = addr_hit[3] & reg_we & !reg_error;
  assign critical_section_wd = reg_wdata[0];

  assign start_we = addr_hit[4] & reg_we & !reg_error;
  assign start_wd = reg_wdata[0];

  assign boot_address_we = addr_hit[5] & reg_we & !reg_error;
  assign boot_address_wd = reg_wdata[31:0];

  assign end_sw_routine_we = addr_hit[6] & reg_we & !reg_error;
  assign end_sw_routine_wd = reg_wdata[0];

  assign interrupt_controler_enable_interrupt_we = addr_hit[7] & reg_we & !reg_error;
  assign interrupt_controler_enable_interrupt_wd = reg_wdata[0];

  assign interrupt_controler_status_interrupt_we = addr_hit[7] & reg_we & !reg_error;
  assign interrupt_controler_status_interrupt_wd = reg_wdata[1];

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[1:0] = safe_configuration_qs;
      end

      addr_hit[1]: begin
        reg_rdata_next[0] = safe_mode_qs;
      end

      addr_hit[2]: begin
        reg_rdata_next[2:0] = master_core_qs;
      end

      addr_hit[3]: begin
        reg_rdata_next[0] = critical_section_qs;
      end

      addr_hit[4]: begin
        reg_rdata_next[0] = start_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[31:0] = boot_address_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[0] = end_sw_routine_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[0] = interrupt_controler_enable_interrupt_qs;
        reg_rdata_next[1] = interrupt_controler_status_interrupt_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[2:0] = cb_heep_status_cores_sleep_qs;
        reg_rdata_next[5:3] = cb_heep_status_cores_debug_mode_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Unused signal tieoff

  // wdata / byte enable are not always fully used
  // add a blanket unused statement to handle lint waivers
  logic unused_wdata;
  logic unused_be;
  assign unused_wdata = ^reg_wdata;
  assign unused_be = ^reg_be;

  // Assertions for Register Interface
  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit))

endmodule

module cb_heep_ctrl_reg_top_intf
#(
  parameter int AW = 6,
  localparam int DW = 32
) (
  input logic clk_i,
  input logic rst_ni,
  REG_BUS.in  regbus_slave,
  // To HW
  output cb_heep_ctrl_reg_pkg::cb_heep_ctrl_reg2hw_t reg2hw, // Write
  input  cb_heep_ctrl_reg_pkg::cb_heep_ctrl_hw2reg_t hw2reg, // Read
  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);
 localparam int unsigned STRB_WIDTH = DW/8;

`include "register_interface/typedef.svh"
`include "register_interface/assign.svh"

  // Define structs for reg_bus
  typedef logic [AW-1:0] addr_t;
  typedef logic [DW-1:0] data_t;
  typedef logic [STRB_WIDTH-1:0] strb_t;
  `REG_BUS_TYPEDEF_ALL(reg_bus, addr_t, data_t, strb_t)

  reg_bus_req_t s_reg_req;
  reg_bus_rsp_t s_reg_rsp;
  
  // Assign SV interface to structs
  `REG_BUS_ASSIGN_TO_REQ(s_reg_req, regbus_slave)
  `REG_BUS_ASSIGN_FROM_RSP(regbus_slave, s_reg_rsp)

  

  cb_heep_ctrl_reg_top #(
    .reg_req_t(reg_bus_req_t),
    .reg_rsp_t(reg_bus_rsp_t),
    .AW(AW)
  ) i_regs (
    .clk_i,
    .rst_ni,
    .reg_req_i(s_reg_req),
    .reg_rsp_o(s_reg_rsp),
    .reg2hw, // Write
    .hw2reg, // Read
    .devmode_i
  );
  
endmodule


