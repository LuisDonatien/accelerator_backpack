/* Copyright 2018 ETH Zurich and University of Bologna.
 * Copyright and related rights are licensed under the Solderpad Hardware
 * License, Version 0.51 (the "License"); you may not use this file except in
 * compliance with the License.  You may obtain a copy of the License at
 * http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
 * or agreed to in writing, software, hardware and materials distributed under
 * this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 *
 * File: $filename.v
 *
 * Description: Auto-generated bootrom
 */

// Auto-generated code
module CB_boot_rom
  import reg_pkg::*;
(
  input  reg_req_t     reg_req_i,
  output reg_rsp_t     reg_rsp_o
);
  import core_v_mini_mcu_pkg::*;

  localparam int unsigned RomSize = 128;

  logic [RomSize-1:0][31:0] mem;
  assign mem = {
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'hf31ff06f,
    32'h00000013,
    32'h00000013,
    32'h00000013,
    32'h00000013,
    32'h7b200073,
    32'h7b1f1073,
    32'h0ff0000f,
    32'h07cfaf03,
    32'h078faf83,
    32'h074faf03,
    32'h070fae83,
    32'h06cfae03,
    32'h068fad83,
    32'h064fad03,
    32'h060fac83,
    32'h05cfac03,
    32'h058fab83,
    32'h054fab03,
    32'h050faa83,
    32'h04cfaa03,
    32'h048fa983,
    32'h044fa903,
    32'h040fa883,
    32'h03cfa803,
    32'h038fa783,
    32'h034fa703,
    32'h030fa683,
    32'h02cfa603,
    32'h028fa583,
    32'h024fa503,
    32'h020fa483,
    32'h01cfa403,
    32'h018fa383,
    32'h014fa303,
    32'h010fa283,
    32'h00cfa203,
    32'h008fa183,
    32'h004fa103,
    32'h000fa083,
    32'h100f8f93,
    32'hf0108fb7,
    32'h343f9073,
    32'h010f2f83,
    32'h341f9073,
    32'h00cf2f83,
    32'h305f9073,
    32'h008f2f83,
    32'h304f9073,
    32'h004f2f83,
    32'h300f9073,
    32'h000f2f83,
    32'hf0108f37,
    32'h00000013,
    32'h00040067,
    32'h83040413,
    32'h10001437,
    32'h10000537,
    32'h0ff0000f,
    32'hfb5ff06f,
    32'h00051463,
    32'h00254513,
    32'h02050463,
    32'h01052503,
    32'hf0020537,
    32'h7b241073,
    32'h7b351073,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h13000000,
    32'h7b200073,
    32'h7b151073,
    32'h02052503,
    32'hf0020537,
    32'h00000013,
    32'h00000013,
    32'hff5ff06f,
    32'h10500073,
    32'h00000013,
    32'h00000013,
    32'h00000013,
    32'h00000013
  };

  logic [$clog2(core_v_mini_mcu_pkg::BOOTROM_SIZE)-1-2:0] word_addr;
  logic [$clog2(RomSize)-1:0] rom_addr;

  assign word_addr = reg_req_i.addr[$clog2(core_v_mini_mcu_pkg::BOOTROM_SIZE)-1:2];
  assign rom_addr  = word_addr[$clog2(RomSize)-1:0];

  assign reg_rsp_o.error = 1'b0;
  assign reg_rsp_o.ready = 1'b1;

  always_comb begin
    if (word_addr > (RomSize-1)) begin
      reg_rsp_o.rdata = '0;
    end else begin
      reg_rsp_o.rdata = mem[rom_addr];
    end
  end

endmodule
