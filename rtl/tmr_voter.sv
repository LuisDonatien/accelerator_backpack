/*
 *
 *
 *
 */

module tmr_voter
  import obi_pkg::*;
  import cei_mochila_pkg::*;
#(
    parameter NHARTS = 3 
) (
    // Instruction Bus
    input   obi_req_t  [NHARTS-1 : 0] core_instr_req_i,
    output  obi_req_t   voted_core_instr_req_o,
    
    // Data Bus
    input   obi_req_t  [NHARTS-1 : 0] core_data_req_i,
    output  obi_req_t   voted_core_data_req_o,

    input   logic enable_i,

    output  logic   error_o,
    output  [NHARTS-1:0]   error_id_o
);

logic [5:0] error_s;
logic [NHARTS-1:0] instr_error_s;
logic [NHARTS-1:0] data_error_s;

obi_req_t   voted_core_instr_req_s;
obi_req_t   voted_core_data_req_s;
//Classic Implementation Voter


assign  voted_core_instr_req_s.addr = ((core_instr_req_i[0].addr & core_instr_req_i[1].addr) |
                                 (core_instr_req_i[1].addr & core_instr_req_i[2].addr) |
                                 (core_instr_req_i[0].addr & core_instr_req_i[2].addr));

assign  voted_core_instr_req_s.wdata = (core_instr_req_i[0].wdata & core_instr_req_i[1].wdata) |
                                    (core_instr_req_i[1].wdata & core_instr_req_i[2].wdata) |
                                    (core_instr_req_i[0].wdata & core_instr_req_i[2].wdata);

assign  voted_core_instr_req_s.we = (core_instr_req_i[0].we & core_instr_req_i[1].we) |
                                (core_instr_req_i[1].we & core_instr_req_i[2].we) |
                                (core_instr_req_i[0].we & core_instr_req_i[2].we);

assign  voted_core_instr_req_s.be = (core_instr_req_i[0].be & core_instr_req_i[1].be) |
                                (core_instr_req_i[1].be & core_instr_req_i[2].be) |
                                (core_instr_req_i[0].be & core_instr_req_i[2].be);

assign  voted_core_instr_req_s.req = (core_instr_req_i[0].req & core_instr_req_i[1].req) |
                                (core_instr_req_i[1].req & core_instr_req_i[2].req) |
                                (core_instr_req_i[0].req & core_instr_req_i[2].req);


assign  voted_core_data_req_s.addr = (core_data_req_i[0].addr & core_data_req_i[1].addr) |
                                    (core_data_req_i[1].addr & core_data_req_i[2].addr) |
                                    (core_data_req_i[0].addr & core_data_req_i[2].addr);

assign  voted_core_data_req_s.wdata = (core_data_req_i[0].wdata & core_data_req_i[1].wdata) |
                                    (core_data_req_i[1].wdata & core_data_req_i[2].wdata) |
                                    (core_data_req_i[0].wdata & core_data_req_i[2].wdata);

assign  voted_core_data_req_s.we = (core_data_req_i[0].we & core_data_req_i[1].we) |
                                (core_data_req_i[1].we & core_data_req_i[2].we) |
                                (core_data_req_i[0].we & core_data_req_i[2].we);

assign  voted_core_data_req_s.be = (core_data_req_i[0].be & core_data_req_i[1].be) |
                                (core_data_req_i[1].be & core_data_req_i[2].be) |
                                (core_data_req_i[0].be & core_data_req_i[2].be);

assign  voted_core_data_req_s.req = (core_data_req_i[0].req & core_data_req_i[1].req) |
                                (core_data_req_i[1].req & core_data_req_i[2].req) |
                                (core_data_req_i[0].req & core_data_req_i[2].req);



//Checker 
always_comb begin
    instr_error_s = '0;
    data_error_s = '0;
    error_s = '0;

        //Instruction
        for(int i=0; i<NHARTS;i++) begin : instr_bus_checker 
            if (((voted_core_instr_req_s.addr != core_instr_req_i[i].addr) ||
                (voted_core_instr_req_s.wdata != core_instr_req_i[i].wdata) ||
                (voted_core_instr_req_s.be != core_instr_req_i[i].be) ||
                (voted_core_instr_req_s.we != core_instr_req_i[i].we) ||
                (voted_core_instr_req_s.req != core_instr_req_i[i].req)) && enable_i) begin
                instr_error_s[i] = 1'b1;
                error_s[i] = 1'b1;    
            end
        end
    
        //Data
        for(int i=0; i<NHARTS;i++) begin : data_bus_checker 
            if (((voted_core_data_req_s.addr != core_data_req_i[i].addr) ||
                (voted_core_data_req_s.wdata != core_data_req_i[i].wdata) ||
                (voted_core_data_req_s.be != core_data_req_i[i].be) ||
                (voted_core_data_req_s.we != core_data_req_i[i].we) ||
                (voted_core_data_req_s.req != core_data_req_i[i].req)) && enable_i) begin
                data_error_s[i] = 1'b1;
                error_s[3+i] = 1'b1;    
            end
        end      
end  


assign error_id_o = instr_error_s | data_error_s;
assign error_o = error_s[0] | error_s[1] | error_s[2] | error_s[3] | error_s[4] | error_s[5];

assign voted_core_instr_req_o = voted_core_instr_req_s;
assign voted_core_data_req_o = voted_core_data_req_s;

endmodule


