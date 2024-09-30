// Generated register defines for CB_heep_ctrl

// Copyright information found in source file:
// Copyright lowRISC contributors.

// Licensing information found in source file:
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef _CB_HEEP_CTRL_REG_DEFS_
#define _CB_HEEP_CTRL_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif
// Register width
#define CB_HEEP_CTRL_PARAM_REG_WIDTH 32

// Configure Single, TMR, DMR or Lockstep
#define CB_HEEP_CTRL_SAFE_CONFIGURATION_REG_OFFSET 0x0
#define CB_HEEP_CTRL_SAFE_CONFIGURATION_SAFE_CONFIGURATION_MASK 0x3
#define CB_HEEP_CTRL_SAFE_CONFIGURATION_SAFE_CONFIGURATION_OFFSET 0
#define CB_HEEP_CTRL_SAFE_CONFIGURATION_SAFE_CONFIGURATION_FIELD \
  ((bitfield_field32_t) { .mask = CB_HEEP_CTRL_SAFE_CONFIGURATION_SAFE_CONFIGURATION_MASK, .index = CB_HEEP_CTRL_SAFE_CONFIGURATION_SAFE_CONFIGURATION_OFFSET })

// Activate Safe Mode
#define CB_HEEP_CTRL_SAFE_MODE_REG_OFFSET 0x4
#define CB_HEEP_CTRL_SAFE_MODE_SAFE_MODE_BIT 0

// Master Core Configuration
#define CB_HEEP_CTRL_MASTER_CORE_REG_OFFSET 0x8
#define CB_HEEP_CTRL_MASTER_CORE_MASTER_CORE_MASK 0x7
#define CB_HEEP_CTRL_MASTER_CORE_MASTER_CORE_OFFSET 0
#define CB_HEEP_CTRL_MASTER_CORE_MASTER_CORE_FIELD \
  ((bitfield_field32_t) { .mask = CB_HEEP_CTRL_MASTER_CORE_MASTER_CORE_MASK, .index = CB_HEEP_CTRL_MASTER_CORE_MASTER_CORE_OFFSET })

// critical_section
#define CB_HEEP_CTRL_CRITICAL_SECTION_REG_OFFSET 0xc
#define CB_HEEP_CTRL_CRITICAL_SECTION_CRITICAL_SECTION_BIT 0

// INIT IP based on configuration
#define CB_HEEP_CTRL_START_REG_OFFSET 0x10
#define CB_HEEP_CTRL_START_START_BIT 0

// boot_address
#define CB_HEEP_CTRL_BOOT_ADDRESS_REG_OFFSET 0x14

// End_SW_Routine
#define CB_HEEP_CTRL_END_SW_ROUTINE_REG_OFFSET 0x18
#define CB_HEEP_CTRL_END_SW_ROUTINE_END_SW_ROUTINE_BIT 0

#ifdef __cplusplus
}  // extern "C"
#endif
#endif  // _CB_HEEP_CTRL_REG_DEFS_
// End generated register defines for CB_heep_ctrl