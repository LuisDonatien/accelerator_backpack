
module memory_wrapper #(
    parameter int unsigned NumWords = 32'd1024,  // Number of Words in data array
    parameter int unsigned DataWidth = 32'd32,  // Data signal width
    // DEPENDENT PARAMETERS, DO NOT OVERWRITE!
    parameter int unsigned AddrWidth = (NumWords > 32'd1) ? $clog2(NumWords) : 32'd1
) (
    input logic clk_i,
    input logic rst_ni,
    // input ports
    input logic req_i,
    input logic we_i,
    input logic [AddrWidth-1:0] addr_i,
    input logic [31:0] wdata_i,
    input logic [3:0] be_i,
    // output ports
    output logic [31:0] rdata_o
);

  tc_sram #(
      .NumWords (NumWords),
      .DataWidth(DataWidth),
      .NumPorts (32'd1)
  ) tc_ram_i (
      .clk_i  (clk_i),
      .rst_ni (rst_ni),
      .req_i  (req_i),
      .we_i   (we_i),
      .addr_i (addr_i),
      .wdata_i(wdata_i),
      .be_i   (be_i),
      // output ports
      .rdata_o(rdata_o)
  );

endmodule
