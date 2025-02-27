/*module obi_pipelined_delay
  import obi_pkg::*;
  import reg_pkg::*;
#(
  parameter NDELAY = 2
) (
    input logic clk_i,
    input logic rst_ni,
    input logic clear_pipeline,

    input obi_req_t core_instr_req_i,
    output obi_req_t  core_instr_req_o,
    input logic core_instr_resp_gnt_i,
    output logic core_instr_resp_gnt_o,
    input logic core_instr_resp_rvalid_i
);



  obi_req_t [NDELAY-1:0] core_instr_req_ff; 

  logic clear;
  logic [NDELAY-1:0] load;

assign core_instr_resp_gnt_o = (core_instr_req_i.req && core_instr_req_ff[NDELAY-1].req == 1'b0) ||
                               (core_instr_resp_gnt_i && core_instr_req_i.req); // Accept req while N req not 0

assign core_instr_req_o = core_instr_req_ff[NDELAY-1];

assign clear = (core_instr_req_i.req == 1'b0 & core_instr_resp_gnt_i == 1'b1)     |
               (core_instr_req_i.req == 1'b0 & core_instr_req_ff[NDELAY-1].req == 1'b0)  | 
               clear_pipeline; //injects '0'


logic or_ff;
assign or_ff = |core_instr_req_ff;

for (genvar i = 0 ; i<NDELAY ; i++) begin

  
always_comb begin
  if (i == 0) begin
    if ((core_instr_req_i.req & core_instr_req_ff[0].req == 1'b0) |
        (core_instr_req_i.req & core_instr_resp_gnt_i)            |
        (core_instr_req_i.req & (or_ff))) // Accept req while N req not 0)
      load[i] = 1'b1;
    else
      load[i] = 1'b0;
  end else if (i == NDELAY-1) begin
    if ((core_instr_req_ff[i].req==1'b0) | (core_instr_resp_gnt_i & core_instr_req_ff[i-1].we == 1'b0) |
            (core_instr_req_ff[i-1].we & core_instr_resp_rvalid_i))
      load[i] = 1'b1;
    else 
      load[i] = 1'b0;
  end
  else
      load[i] = 1'b1;
end

  always_ff @(posedge clk_i or negedge rst_ni) begin : pipelined_req 
    if(~rst_ni) begin
      core_instr_req_ff[i].req <= '0;
    end else begin
      if (load[i]) begin
        if (i==0) 
          core_instr_req_ff[0].req <= core_instr_req_i.req;
        else
          core_instr_req_ff[i].req <= core_instr_req_ff[i-1].req;        
      end
      if (i==0) begin //injects 0 to the pipeline
        if (clear) 
          core_instr_req_ff[0].req <= '0;
      end else begin
        if (clear_pipeline)
          core_instr_req_ff[i].req <= '0;
      end
    end
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin : pipelined_addr
    if(~rst_ni) begin
      core_instr_req_ff[i].addr <= '0;
    end else begin
        if(load[i]) begin
          if (i==0) 
            core_instr_req_ff[0].addr <= core_instr_req_i.addr;
          else
            core_instr_req_ff[i].addr <= core_instr_req_ff[i-1].addr; 
        end
        if (i==0) begin //injects addr to the pipeline to propagate default address bus
          if (clear) 
            core_instr_req_ff[0].addr <= core_instr_req_i.addr;
        end else begin
          if (clear_pipeline)
            core_instr_req_ff[i].addr <= core_instr_req_i.addr;
        end
    end
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin : pipelined_we
    if(~rst_ni) begin
      core_instr_req_ff[i].we <= '0;
    end else begin
      if (load[i]) begin 
        if (i==0) 
          core_instr_req_ff[0].we <= core_instr_req_i.we;
        else
          core_instr_req_ff[i].we <= core_instr_req_ff[i-1].we; 
      end
      if (i==0) begin //injects 0 to the pipeline
        if (clear) 
          core_instr_req_ff[0].we <= '0;
      end else begin
        if (clear_pipeline)
          core_instr_req_ff[i].we <= '0;
      end
    end
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin : pipelined_wdata
    if(~rst_ni) begin
      core_instr_req_ff[i].wdata <= '0;
    end else begin
      if (load[i]) begin
        if (i==0) 
          core_instr_req_ff[0].wdata <= core_instr_req_i.wdata;
        else
          core_instr_req_ff[i].wdata <= core_instr_req_ff[i-1].wdata; 
      end
      if (i==0) begin //injects 0 to the pipeline
        if (clear) 
          core_instr_req_ff[0].wdata <= core_instr_req_i.wdata;
      end else begin
        if (clear_pipeline)
          core_instr_req_ff[i].wdata <= core_instr_req_i.wdata;
      end
    end
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin : pipelined_be 
    if(~rst_ni) begin
      core_instr_req_ff[i].be <= '0;
    end else begin
      if (load[i]) begin
        if (i==0) 
          core_instr_req_ff[0].be <= core_instr_req_i.be;
        else
          core_instr_req_ff[i].be <= core_instr_req_ff[i-1].be; 
      end
      if (i==0) begin //injects 0 to the pipeline
        if (clear) 
          core_instr_req_ff[0].be <= core_instr_req_i.be;
      end else begin
        if (clear_pipeline)
          core_instr_req_ff[i].be <= core_instr_req_i.be;
      end
    end
  end

end

endmodule  // obi_pipelined*/

module obi_pipelined_delay
  import obi_pkg::*;
  import reg_pkg::*;
#(
  parameter NDELAY = 2
) (
    input logic clk_i,
    input logic rst_ni,
    input logic clear_pipeline,

    input obi_req_t core_instr_req_i,
    output obi_req_t  core_instr_req_o,
    input logic core_instr_resp_gnt_i,
    output logic core_instr_resp_gnt_o
);
    
  obi_req_t [NDELAY-2:0] core_instr_req_s;
  logic     [NDELAY-2:0] core_instr_resp_gnt_s;

  for (genvar i = 0 ; i<NDELAY ; i++) begin
    if (i==0) begin
    obi_sngreg obi_sngreg_i(
      .clk_i,
      .rst_ni,
      .clear_pipeline,
      .core_instr_req_i(core_instr_req_i),
      .core_instr_req_o(core_instr_req_s[i]),
      .core_instr_resp_gnt_i(core_instr_resp_gnt_s[i]),
      .core_instr_resp_gnt_o(core_instr_resp_gnt_o)
    );    
    end else if (i==NDELAY-1) begin
    obi_sngreg obi_sngreg_i(
      .clk_i,
      .rst_ni,
      .clear_pipeline,
      .core_instr_req_i(core_instr_req_s[i-1]),
      .core_instr_req_o(core_instr_req_o),
      .core_instr_resp_gnt_i(core_instr_resp_gnt_i),
      .core_instr_resp_gnt_o(core_instr_resp_gnt_s[i-1])
    );    
    end else begin
    obi_sngreg obi_sngreg_i(
    .clk_i,
    .rst_ni,
    .clear_pipeline,
    .core_instr_req_i(core_instr_req_s[i-1]),
    .core_instr_req_o(core_instr_req_s[i]),
    .core_instr_resp_gnt_i(core_instr_resp_gnt_s[i]),
    .core_instr_resp_gnt_o(core_instr_resp_gnt_s[i-1])      
    );
    end
  end

endmodule
