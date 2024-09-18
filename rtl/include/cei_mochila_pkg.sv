/*
 *
 *
 * Description: Contains common system definitions.
 *
 */

package cei_mochila_pkg;

  import addr_map_rule_pkg::*;


//System Bus

  //master idx
  localparam logic [31:0] CORE0_INSTR_IDX = 0;
  localparam logic [31:0] CORE0_DATA_IDX = 1;
  localparam logic [31:0] CORE1_INSTR_IDX = 2;
  localparam logic [31:0] CORE1_DATA_IDX = 3;
  localparam logic [31:0] CORE2_INSTR_IDX = 4;
  localparam logic [31:0] CORE2_DATA_IDX = 5;
  localparam logic [31:0] EXTERNAL_MASTER_IDX = 6;

  localparam SYSTEM_XBAR_NMASTER = 7;
  localparam SYSTEM_XBAR_NSLAVE = 6;

  
  localparam int unsigned MEM_SIZE = 32'h00010000;
  localparam int unsigned NUM_BANKS = 2;
  

  //Internal Memory Map and Index
  //--------------------
  localparam int unsigned LOG_SYSTEM_XBAR_NMASTER = SYSTEM_XBAR_NMASTER > 1 ? $clog2(
      SYSTEM_XBAR_NMASTER
  ) : 32'd1;
  localparam int unsigned LOG_SYSTEM_XBAR_NSLAVE = SYSTEM_XBAR_NSLAVE > 1 ? $clog2(
      SYSTEM_XBAR_NSLAVE
  ) : 32'd1;

  localparam logic [31:0] ERROR_START_ADDRESS = 32'hBADACCE5;
  localparam logic [31:0] ERROR_SIZE = 32'h00000001;
  localparam logic [31:0] ERROR_END_ADDRESS = ERROR_START_ADDRESS + ERROR_SIZE;
  localparam logic [31:0] ERROR_IDX = 32'd0;

  localparam logic [31:0] PERIPHERAL_START_ADDRESS = 32'hF0010000;
  localparam logic [31:0] PERIPHERAL_SIZE = 32'h00010000;
  localparam logic[31:0] PERIPHERAL_END_ADDRESS = PERIPHERAL_START_ADDRESS + PERIPHERAL_SIZE;
  localparam logic [31:0] PERIPHERAL_IDX = 32'd1;

  localparam logic [31:0] EXTERNAL_PERIPHERAL_START_ADDRESS = 32'h00000000;
  localparam logic [31:0] EXTERNAL_PERIPHERAL_SIZE = 32'h41000000;
  localparam logic[31:0] EXTERNAL_PERIPHERAL_END_ADDRESS = EXTERNAL_PERIPHERAL_START_ADDRESS + EXTERNAL_PERIPHERAL_SIZE;
  localparam logic [31:0] EXTERNAL_PERIPHERAL_IDX = 32'd2;

  localparam logic [31:0] MEMORY_RAM0_START_ADDRESS = 32'hF0100000;
  localparam logic [31:0] MEMORY_RAM0_SIZE = 32'h00008000;
  localparam logic[31:0]  MEMORY_RAM0_END_ADDRESS = MEMORY_RAM0_START_ADDRESS + MEMORY_RAM0_SIZE;
  localparam logic [31:0] MEMORY_RAM0_IDX = 32'd3;

  localparam logic [31:0] MEMORY_RAM1_START_ADDRESS = 32'hF0108000;
  localparam logic [31:0] MEMORY_RAM1_SIZE = 32'h00008000;
  localparam logic[31:0]  MEMORY_RAM1_END_ADDRESS = MEMORY_RAM1_START_ADDRESS + MEMORY_RAM1_SIZE;
  localparam logic [31:0] MEMORY_RAM1_IDX = 32'd4;

  localparam logic [31:0] SAFE_WRAPPER_CSR_START_ADDRESS = 32'hF0020000;
  localparam logic [31:0] SAFE_WRAPPER_CSR_SIZE = 32'h00010000;
  localparam logic[31:0]  SAFE_WRAPPER_CSR_END_ADDRESS = SAFE_WRAPPER_CSR_START_ADDRESS + SAFE_WRAPPER_CSR_SIZE;
  localparam logic [31:0] SAFE_WRAPPER_CSR_IDX = 32'd5;  

  localparam addr_map_rule_t [SYSTEM_XBAR_NSLAVE-1:0] XBAR_ADDR_RULES = '{
      '{  idx: ERROR_IDX, start_addr: ERROR_START_ADDRESS, end_addr: ERROR_END_ADDRESS},
      '{
          idx: PERIPHERAL_IDX,
          start_addr: PERIPHERAL_START_ADDRESS,
          end_addr: PERIPHERAL_END_ADDRESS
      },
      '{
          idx: EXTERNAL_PERIPHERAL_IDX,
          start_addr: EXTERNAL_PERIPHERAL_START_ADDRESS,
          end_addr: EXTERNAL_PERIPHERAL_END_ADDRESS
      },
      '{
          idx: MEMORY_RAM0_IDX,
          start_addr: MEMORY_RAM0_START_ADDRESS,
          end_addr: MEMORY_RAM0_END_ADDRESS
      },
      '{
          idx: MEMORY_RAM1_IDX,
          start_addr: MEMORY_RAM1_START_ADDRESS,
          end_addr: MEMORY_RAM1_END_ADDRESS
      },
      '{
          idx: SAFE_WRAPPER_CSR_IDX,
          start_addr: SAFE_WRAPPER_CSR_START_ADDRESS,
          end_addr: SAFE_WRAPPER_CSR_END_ADDRESS
      }
  };

//Peripherals
//-----------

  localparam PERIPHERALS = 2;

  localparam logic [31:0] DEBUG_BOOTROM_START_ADDRESS = PERIPHERAL_START_ADDRESS + 32'h00000000;
  localparam logic [31:0] DEBUG_BOOTROM_SIZE = 32'h00001000;
  localparam logic [31:0] DEBUG_BOOTROM_END_ADDRESS = DEBUG_BOOTROM_START_ADDRESS + DEBUG_BOOTROM_SIZE;
  localparam logic [31:0] DEBUG_BOOTROM_IDX = 32'd0;

  localparam logic [31:0] CB_CTRL_START_ADDRESS = PERIPHERAL_START_ADDRESS + 32'h00001000;
  localparam logic [31:0] CB_CTRL_SIZE = 32'h00001000;
  localparam logic [31:0] CB_CTRL_END_ADDRESS = CB_CTRL_START_ADDRESS + CB_CTRL_SIZE;
  localparam logic [31:0] CB_CTRL_IDX = 32'd1;

  localparam addr_map_rule_t [PERIPHERALS-1:0] PERIPHERALS_ADDR_RULES ='{
      '{  idx: DEBUG_BOOTROM_IDX, 
          start_addr: DEBUG_BOOTROM_START_ADDRESS, 
          end_addr: DEBUG_BOOTROM_END_ADDRESS
      },
      '{  idx: CB_CTRL_IDX, 
          start_addr: CB_CTRL_START_ADDRESS, 
          end_addr: CB_CTRL_END_ADDRESS
      }
  };

  localparam int unsigned PERIPHERALS_PORT_SEL_WIDTH = PERIPHERALS > 1 ? $clog2(
      PERIPHERALS
  ) : 32'd1;


  //Private Memory CPU
  localparam CPU_XBAR_SLAVE = 2;
  localparam CPU_XBAR_NRULES = 3; //Depending on the external address.

  localparam logic [31:0] BUS_SYSTEM_START_ADDRESS = PERIPHERAL_START_ADDRESS;
  localparam logic [31:0] BUS_SYSTEM_SIZE = 32'h10000000;
  localparam logic [31:0] BUS_SYSTEM_END_ADDRESS = BUS_SYSTEM_START_ADDRESS + BUS_SYSTEM_SIZE;
  localparam logic [31:0] BUS_SYSTEM_IDX = 32'd0;

  localparam logic [31:0] EXT_BUS_SYSTEM_START_ADDRESS = 32'h00000000;
  localparam logic [31:0] EXT_BUS_SYSTEM_SIZE = 32'h41000000;
  localparam logic [31:0] EXT_BUS_SYSTEM_END_ADDRESS = EXT_BUS_SYSTEM_START_ADDRESS + EXT_BUS_SYSTEM_SIZE;
  localparam logic [31:0] EXT_BUS_SYSTEM_IDX = 32'd0;

  localparam logic [31:0] CPU_REG_START_ADDRESS = 32'hFF000000;
  localparam logic [31:0] CPU_REG_SIZE = 32'h00001000;
  localparam logic [31:0] CPU_REG_END_ADDRESS = CPU_REG_START_ADDRESS + CPU_REG_SIZE;
  localparam logic [31:0] CPU_REG_IDX = 32'd1;



  localparam addr_map_rule_t [CPU_XBAR_NRULES-1:0] CPU_XBAR_ADDR_RULES ='{
      '{  idx: BUS_SYSTEM_IDX, 
          start_addr: BUS_SYSTEM_START_ADDRESS, 
          end_addr: BUS_SYSTEM_END_ADDRESS
      },
      '{  idx: EXT_BUS_SYSTEM_IDX, 
          start_addr: EXT_BUS_SYSTEM_START_ADDRESS, 
          end_addr: EXT_BUS_SYSTEM_END_ADDRESS
      },
      '{  idx: CPU_REG_IDX, 
          start_addr: CPU_REG_START_ADDRESS, 
          end_addr: CPU_REG_END_ADDRESS
      }
  };

  //External Peripherals MM Base Address
  
  //DEBUG SYSTEM
  localparam int unsigned DEBUG_SYSTEM_START_START_ADDRESS = 32'h10000000;

endpackage
