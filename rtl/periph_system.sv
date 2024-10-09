// Mochila_TOP
//
//
//

module periph_system
  import obi_pkg::*;
  import reg_pkg::*;
#(
  parameter NHARTS = 3
) (
    input logic clk_i,
    input logic rst_ni,

    input  obi_req_t  slave_req_i,
    output obi_resp_t slave_resp_o,

    //External MM CSR ports 
    input  obi_req_t    csr_reg_req_i,
    output obi_resp_t   csr_reg_resp_o, 

    //***Safe CPU wrapper control ports***//
    input  logic EndSw_i,
    output logic [2:0] master_core_o,
    output logic safe_mode_o,
    output logic [1:0] safe_configuration_o,
    output logic critical_section_o,
    output logic Start_o,
    output logic [31:0] boot_addr_o,

    //***Safe CPU wrapper status ports***//
    input logic [NHARTS-1 : 0] debug_mode_i,
    input logic [NHARTS-1 : 0] sleep_i,

    // Interrupt Interface
    output logic interrupt_o
);

  import cei_mochila_pkg::*;


  reg_pkg::reg_req_t peripheral_req;
  reg_pkg::reg_rsp_t peripheral_rsp;

  reg_pkg::reg_req_t [cei_mochila_pkg::PERIPHERALS-1:0] peripheral_slv_req;
  reg_pkg::reg_rsp_t [cei_mochila_pkg::PERIPHERALS-1:0] peripheral_slv_rsp;

  logic [PERIPHERALS_PORT_SEL_WIDTH-1:0] peripheral_select;

  periph_to_reg #(
      .req_t(reg_pkg::reg_req_t),
      .rsp_t(reg_pkg::reg_rsp_t),
      .IW(1)
  ) periph_to_reg_i (
      .clk_i,
      .rst_ni,
      .req_i(slave_req_i.req),
      .add_i(slave_req_i.addr),
      .wen_i(~slave_req_i.we),
      .wdata_i(slave_req_i.wdata),
      .be_i(slave_req_i.be),
      .id_i('0),
      .gnt_o(slave_resp_o.gnt),
      .r_rdata_o(slave_resp_o.rdata),
      .r_opc_o(),
      .r_id_o(),
      .r_valid_o(slave_resp_o.rvalid),
      .reg_req_o(peripheral_req),
      .reg_rsp_i(peripheral_rsp)
  );

  addr_decode #(
      .NoIndices(cei_mochila_pkg::PERIPHERALS),
      .NoRules(cei_mochila_pkg::PERIPHERALS),
      .addr_t(logic [31:0]),
      .rule_t(addr_map_rule_pkg::addr_map_rule_t)
  ) i_addr_decode_soc_regbus_periph_xbar (
      .addr_i(peripheral_req.addr),
      .addr_map_i(cei_mochila_pkg::PERIPHERALS_ADDR_RULES),
      .idx_o(peripheral_select),
      .dec_valid_o(),
      .dec_error_o(),
      .en_default_idx_i(1'b0),
      .default_idx_i('0)
  );

  reg_demux #(
      .NoPorts(cei_mochila_pkg::PERIPHERALS),
      .req_t  (reg_pkg::reg_req_t),
      .rsp_t  (reg_pkg::reg_rsp_t)
  ) reg_demux_i (
      .clk_i,
      .rst_ni,
      .in_select_i(peripheral_select),
      .in_req_i(peripheral_req),
      .in_rsp_o(peripheral_rsp),
      .out_req_o(peripheral_slv_req),
      .out_rsp_i(peripheral_slv_rsp)
  );

  CB_boot_rom CB_boot_rom_i (
      .reg_req_i(peripheral_slv_req[cei_mochila_pkg::DEBUG_BOOTROM_IDX]),
      .reg_rsp_o(peripheral_slv_rsp[cei_mochila_pkg::DEBUG_BOOTROM_IDX])
  );

  cb_heep_ctrl #(
    .reg_req_t(reg_pkg::reg_req_t),
    .reg_rsp_t(reg_pkg::reg_rsp_t)
    )cb_heep_ctrl_i(
    .clk_i,
    .rst_ni,
    // Bus Interface
    .reg_req_i(csr_reg_req_i),
    .reg_rsp_o(csr_reg_resp_o),
    .EndSw_i,
    .master_core_o,
    .safe_mode_o,
    .safe_configuration_o,
    .critical_section_o,
    .Start_o,
    .boot_addr_o,
    .debug_mode_i,
    .sleep_i,
    .interrupt_o
    );
endmodule
