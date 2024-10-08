// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package cb_heep_ctrl_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 6;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    logic [1:0]  q;
  } cb_heep_ctrl_reg2hw_safe_configuration_reg_t;

  typedef struct packed {
    logic        q;
  } cb_heep_ctrl_reg2hw_safe_mode_reg_t;

  typedef struct packed {
    logic [2:0]  q;
  } cb_heep_ctrl_reg2hw_master_core_reg_t;

  typedef struct packed {
    logic        q;
  } cb_heep_ctrl_reg2hw_critical_section_reg_t;

  typedef struct packed {
    logic        q;
  } cb_heep_ctrl_reg2hw_start_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } cb_heep_ctrl_reg2hw_boot_address_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } enable_interrupt;
    struct packed {
      logic        q;
    } status_interrupt;
  } cb_heep_ctrl_reg2hw_interrupt_controler_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } cb_heep_ctrl_hw2reg_start_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } cb_heep_ctrl_hw2reg_end_sw_routine_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } enable_interrupt;
    struct packed {
      logic        d;
      logic        de;
    } status_interrupt;
  } cb_heep_ctrl_hw2reg_interrupt_controler_reg_t;

  typedef struct packed {
    struct packed {
      logic [2:0]  d;
      logic        de;
    } cores_sleep;
    struct packed {
      logic [2:0]  d;
      logic        de;
    } cores_debug_mode;
  } cb_heep_ctrl_hw2reg_cb_heep_status_reg_t;

  // Register -> HW type
  typedef struct packed {
    cb_heep_ctrl_reg2hw_safe_configuration_reg_t safe_configuration; // [41:40]
    cb_heep_ctrl_reg2hw_safe_mode_reg_t safe_mode; // [39:39]
    cb_heep_ctrl_reg2hw_master_core_reg_t master_core; // [38:36]
    cb_heep_ctrl_reg2hw_critical_section_reg_t critical_section; // [35:35]
    cb_heep_ctrl_reg2hw_start_reg_t start; // [34:34]
    cb_heep_ctrl_reg2hw_boot_address_reg_t boot_address; // [33:2]
    cb_heep_ctrl_reg2hw_interrupt_controler_reg_t interrupt_controler; // [1:0]
  } cb_heep_ctrl_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    cb_heep_ctrl_hw2reg_start_reg_t start; // [15:14]
    cb_heep_ctrl_hw2reg_end_sw_routine_reg_t end_sw_routine; // [13:12]
    cb_heep_ctrl_hw2reg_interrupt_controler_reg_t interrupt_controler; // [11:8]
    cb_heep_ctrl_hw2reg_cb_heep_status_reg_t cb_heep_status; // [7:0]
  } cb_heep_ctrl_hw2reg_t;

  // Register offsets
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_SAFE_CONFIGURATION_OFFSET = 6'h 0;
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_SAFE_MODE_OFFSET = 6'h 4;
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_MASTER_CORE_OFFSET = 6'h 8;
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_CRITICAL_SECTION_OFFSET = 6'h c;
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_START_OFFSET = 6'h 10;
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_BOOT_ADDRESS_OFFSET = 6'h 14;
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_END_SW_ROUTINE_OFFSET = 6'h 18;
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_INTERRUPT_CONTROLER_OFFSET = 6'h 1c;
  parameter logic [BlockAw-1:0] CB_HEEP_CTRL_CB_HEEP_STATUS_OFFSET = 6'h 20;

  // Register index
  typedef enum int {
    CB_HEEP_CTRL_SAFE_CONFIGURATION,
    CB_HEEP_CTRL_SAFE_MODE,
    CB_HEEP_CTRL_MASTER_CORE,
    CB_HEEP_CTRL_CRITICAL_SECTION,
    CB_HEEP_CTRL_START,
    CB_HEEP_CTRL_BOOT_ADDRESS,
    CB_HEEP_CTRL_END_SW_ROUTINE,
    CB_HEEP_CTRL_INTERRUPT_CONTROLER,
    CB_HEEP_CTRL_CB_HEEP_STATUS
  } cb_heep_ctrl_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] CB_HEEP_CTRL_PERMIT [9] = '{
    4'b 0001, // index[0] CB_HEEP_CTRL_SAFE_CONFIGURATION
    4'b 0001, // index[1] CB_HEEP_CTRL_SAFE_MODE
    4'b 0001, // index[2] CB_HEEP_CTRL_MASTER_CORE
    4'b 0001, // index[3] CB_HEEP_CTRL_CRITICAL_SECTION
    4'b 0001, // index[4] CB_HEEP_CTRL_START
    4'b 1111, // index[5] CB_HEEP_CTRL_BOOT_ADDRESS
    4'b 0001, // index[6] CB_HEEP_CTRL_END_SW_ROUTINE
    4'b 0001, // index[7] CB_HEEP_CTRL_INTERRUPT_CONTROLER
    4'b 0001  // index[8] CB_HEEP_CTRL_CB_HEEP_STATUS
  };

endpackage

