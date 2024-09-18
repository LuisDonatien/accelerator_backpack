// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

module xbar_system
  import obi_pkg::*;
  import addr_map_rule_pkg::*;
  import cei_mochila_pkg::*;
#(
    parameter XBAR_NMASTER = 3,
    parameter XBAR_NSLAVE = 6,
    localparam int unsigned IdxWidth = cf_math_pkg::idx_width(XBAR_NSLAVE)
) (
    input logic clk_i,
    input logic rst_ni,

    // Address map
    input addr_map_rule_pkg::addr_map_rule_t [XBAR_NSLAVE-1:0] addr_map_i,

    // Default slave index
    input logic [IdxWidth-1:0] default_idx_i,

    input  obi_req_t  [XBAR_NMASTER-1:0] master_req_i,
    output obi_resp_t [XBAR_NMASTER-1:0] master_resp_o,

    output obi_req_t  [XBAR_NSLAVE-1:0] slave_req_o,
    input  obi_resp_t [XBAR_NSLAVE-1:0] slave_resp_i

);

  localparam int unsigned LOG_XBAR_NMASTER = XBAR_NMASTER > 1 ? $clog2(XBAR_NMASTER) : 32'd1;
  localparam int unsigned LOG_XBAR_NSLAVE = XBAR_NSLAVE > 1 ? $clog2(XBAR_NSLAVE) : 32'd1;

  //Aggregated Request Data (from Master -> slaves)
  //WE + BE + ADDR + WDATA
  localparam int unsigned REQ_AGG_DATA_WIDTH = 1 + 4 + 32 + 32;
  localparam int unsigned RESP_AGG_DATA_WIDTH = 32;

  //Address Decoder
  logic [XBAR_NMASTER-1:0][LOG_XBAR_NSLAVE-1:0] port_sel;

  // Neck crossbar
  obi_req_t neck_req;
  obi_resp_t neck_resp;

  logic [XBAR_NMASTER-1:0] master_req_req;
  logic [XBAR_NMASTER-1:0] master_resp_gnt;
  logic [XBAR_NMASTER-1:0] master_resp_rvalid;
  logic [XBAR_NMASTER-1:0][31:0] master_resp_rdata;

  logic [XBAR_NSLAVE-1:0] slave_req_req;
  logic [XBAR_NSLAVE-1:0] slave_resp_gnt;
  logic [XBAR_NSLAVE-1:0] slave_resp_rvalid;
  logic [XBAR_NSLAVE-1:0][31:0] slave_resp_rdata;


  logic [XBAR_NMASTER-1:0][REQ_AGG_DATA_WIDTH-1:0] master_req_data;
  logic [XBAR_NSLAVE-1:0][REQ_AGG_DATA_WIDTH-1:0] slave_req_out_data;
  obi_req_t [XBAR_NMASTER-1:0] master_req;


  // Propagate interleaved address
  generate
    for (genvar i = 0; i < XBAR_NMASTER; i++) begin : gen_unroll_master
      assign master_req[i] = '{
              req: master_req_i[i].req,
              we: master_req_i[i].we,
              be: master_req_i[i].be,
              addr: master_req_i[i].addr,
              wdata: master_req_i[i].wdata
          };
    end
  endgenerate

    // N-to-1 crossbar
    xbar_varlat_n_to_one #(
        .XBAR_NMASTER(XBAR_NMASTER)
    ) xbar_varlat_n_to_one_i (
        .clk_i        (clk_i),
        .rst_ni       (rst_ni),
        .master_req_i (master_req),
        .master_resp_o(master_resp_o),
        .slave_req_o  (neck_req),
        .slave_resp_i (neck_resp)
    );

    // 1-to-N crossbar
    // NOTE: AGGREGATE_GNT should be 0 when a single master is actually
    // aggregating multiple master requests. This is not needed when a
    // real-single master is used or multiple masters are used as the
    // rr_arb_tree dispatches the grant to each corresponding master.
    // Whereas, when the xbar_varlat is used with a single master, which is
    // shared among severals (as in this case as an output of another
    // xbar_varlat), the rr_arb_tree gives all the grant to the shared single
    // master, thus granting transactions that should not be granted.

    xbar_varlat_one_to_n #(
        .XBAR_NSLAVE   (XBAR_NSLAVE),
        .AGGREGATE_GNT (32'd0) // the neck request is aggregating all the input masters
    ) xbar_varlat_one_to_n_i (
        .clk_i        (clk_i),
        .rst_ni       (rst_ni),
        .addr_map_i,
        .default_idx_i,
        .master_req_i (neck_req),
        .master_resp_o(neck_resp),
        .slave_req_o  (slave_req_o),
        .slave_resp_i (slave_resp_i)
    );

endmodule : xbar_system
