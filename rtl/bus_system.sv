// Copyright 2017 Embecosm Limited <www.embecosm.com>
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

// System bus for core-v-mini-mcu
// Contributor: Jeremy Bennett <jeremy.bennett@embecosm.com>
//              Robert Balas <balasr@student.ethz.ch>
//              Davide Schiavone <davide@openhwgroup.org>
//              Simone Machetti <simone.machetti@epfl.ch>
//              Michele Caon <michele.caon@epfl.ch>

module bus_system
  import obi_pkg::*;
  import addr_map_rule_pkg::*;
#(
  parameter NHARTS = 3,
  parameter N_BANKS = 2
) (
    input logic clk_i,
    input logic rst_ni,

    // Internal master ports
    input  obi_req_t  [NHARTS-1 : 0] core_instr_req_i,
    output obi_resp_t [NHARTS-1 : 0] core_instr_resp_o,

    input  obi_req_t  [NHARTS-1 : 0] core_data_req_i,
    output obi_resp_t [NHARTS-1 : 0] core_data_resp_o,

    // Internal slave ports
    output obi_req_t  peripheral_slave_req_o,
    input  obi_resp_t peripheral_slave_resp_i,

    //External master
    input  obi_req_t    ext_master_req_i,
    output obi_resp_t   ext_master_resp_o,

    //External slave
    output obi_req_t    ext_slave_req_o,
    input  obi_resp_t   ext_slave_resp_i,

    //Ram memory
    output obi_req_t   [N_BANKS-1:0]ram_req_o,
    input  obi_resp_t  [N_BANKS-1:0]ram_resp_i,

    // Control Status Register
    output obi_req_t   wrapper_csr_req_o,
    input  obi_resp_t  wrapper_csr_resp_i

);

  import cei_mochila_pkg::*;

  // Internal master ports
  obi_req_t [cei_mochila_pkg::SYSTEM_XBAR_NMASTER-1:0] int_master_req;
  obi_resp_t [cei_mochila_pkg::SYSTEM_XBAR_NMASTER-1:0] int_master_resp;

  // Internal slave ports
  obi_req_t [cei_mochila_pkg::SYSTEM_XBAR_NSLAVE-1:0] int_slave_req;
  obi_resp_t [cei_mochila_pkg::SYSTEM_XBAR_NSLAVE-1:0] int_slave_resp;

  // Internal master requests
  assign int_master_req[cei_mochila_pkg::CORE0_INSTR_IDX] = core_instr_req_i[0];
  assign int_master_req[cei_mochila_pkg::CORE0_DATA_IDX] = core_data_req_i[0];
  assign int_master_req[cei_mochila_pkg::CORE1_INSTR_IDX] = core_instr_req_i[1];
  assign int_master_req[cei_mochila_pkg::CORE1_DATA_IDX] = core_data_req_i[1];
  assign int_master_req[cei_mochila_pkg::CORE2_INSTR_IDX] = core_instr_req_i[2];
  assign int_master_req[cei_mochila_pkg::CORE2_DATA_IDX] = core_data_req_i[2];
  assign int_master_req[cei_mochila_pkg::EXTERNAL_MASTER_IDX] = ext_master_req_i; 

  // Internal master responses
  assign core_instr_resp_o[0] = int_master_resp[cei_mochila_pkg::CORE0_INSTR_IDX];
  assign core_data_resp_o[0] = int_master_resp[cei_mochila_pkg::CORE0_DATA_IDX];
  assign core_instr_resp_o[1] = int_master_resp[cei_mochila_pkg::CORE1_INSTR_IDX];
  assign core_data_resp_o[1] = int_master_resp[cei_mochila_pkg::CORE1_DATA_IDX];
  assign core_instr_resp_o[2] = int_master_resp[cei_mochila_pkg::CORE2_INSTR_IDX];
  assign core_data_resp_o[2] = int_master_resp[cei_mochila_pkg::CORE2_DATA_IDX];
  // External master responses
  assign ext_master_resp_o = int_master_resp[cei_mochila_pkg::EXTERNAL_MASTER_IDX];

  // Internal slave requests
  assign peripheral_slave_req_o = int_slave_req[cei_mochila_pkg::PERIPHERAL_IDX];
  assign ram_req_o[0]              = int_slave_req[cei_mochila_pkg::MEMORY_RAM0_IDX];
  assign ram_req_o[1]              = int_slave_req[cei_mochila_pkg::MEMORY_RAM1_IDX];
  assign wrapper_csr_req_o      = int_slave_req[cei_mochila_pkg::SAFE_WRAPPER_CSR_IDX];

  // External slave requests
  assign ext_slave_req_o = int_slave_req[cei_mochila_pkg::EXTERNAL_PERIPHERAL_IDX];

  // Internal slave responses
  assign int_slave_resp[cei_mochila_pkg::PERIPHERAL_IDX] = peripheral_slave_resp_i;
  assign int_slave_resp[cei_mochila_pkg::MEMORY_RAM0_IDX] = ram_resp_i[0];
  assign int_slave_resp[cei_mochila_pkg::MEMORY_RAM1_IDX] = ram_resp_i[1];
  assign int_slave_resp[cei_mochila_pkg::SAFE_WRAPPER_CSR_IDX] = wrapper_csr_resp_i;
  // External slave responses
  assign int_slave_resp[cei_mochila_pkg::EXTERNAL_PERIPHERAL_IDX] = ext_slave_resp_i;
  // Internal system crossbar
  // ------------------------
  system_xbar #(
      .XBAR_NMASTER(cei_mochila_pkg::SYSTEM_XBAR_NMASTER),
      .XBAR_NSLAVE (cei_mochila_pkg::SYSTEM_XBAR_NSLAVE)
  ) system_xbar_i (
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      .addr_map_i(cei_mochila_pkg::XBAR_ADDR_RULES),
      .default_idx_i(cei_mochila_pkg::ERROR_IDX[LOG_SYSTEM_XBAR_NSLAVE-1:0]),
      .master_req_i(int_master_req),
      .master_resp_o(int_master_resp),
      .slave_req_o(int_slave_req),
      .slave_resp_i(int_slave_resp)
  );

endmodule
