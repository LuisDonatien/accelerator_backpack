//External CPU_System
// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

module safe_cpu_wrapper
  import obi_pkg::*;
  import cei_mochila_pkg::*;
#(
    parameter NHARTS = 3,
    parameter HARTID = 32'h01,
    parameter DM_HALTADDRESS = cei_mochila_pkg::DEBUG_BOOTROM_START_ADDRESS + 32'h50
) (
    // Clock and Reset
    input logic clk_i,
    input logic rst_ni,

    // Instruction memory interface 
    output obi_req_t  [NHARTS-1 : 0] core_instr_req_o,
    input  obi_resp_t [NHARTS-1 : 0] core_instr_resp_i,

    // Data memory interface 
    output obi_req_t  [NHARTS-1 : 0] core_data_req_o,
    input  obi_resp_t [NHARTS-1 : 0] core_data_resp_i,


    // Safe Wrapper Control/Status Register
    input  obi_req_t  wrapper_csr_req_i,
    output obi_resp_t wrapper_csr_resp_o,


    // Debug Interface
    input logic       debug_req_i
);

localparam NRCOMPARATORS = NHARTS == 3 ? 3 : 1 ;

    //Signals//

    logic bus_config_s;

    logic [NHARTS-1:0][31:0] intr;
    logic [NHARTS-1:0] debug_req;
    logic en_ext_debug_s;
    logic Initial_Sync_Master_s;
    logic [NHARTS-1:0] Hart_ack_s;
    logic [NHARTS-1:0] Hart_wfi_s;
    logic [NHARTS-1:0] Hart_intc_ack_s;
    logic [NHARTS-1:0] Interrupt_swResync_s;
    logic [NHARTS-1:0] Interrupt_CpyResync_s;
    logic [NHARTS-1:0] Interrupt_DMSH_Sync_s;
    logic [NHARTS-1:0][0:0] Select_wfi_core_s;
    logic [NHARTS-1:0] master_core_s;
    logic safe_mode_s;
    logic [1:0] safe_configuration_s;
    logic critical_section_s;
    logic [NHARTS-1:0] intc_sync_s;
    logic [NHARTS-1:0] intc_halt_s;
    logic [NHARTS-1:0] sleep_s;
    logic [NHARTS-1:0] debug_mode_s;
    logic [NHARTS-1:0] new_irq_s;
    logic End_sw_routine_s;
    logic Start_s;
    logic Start_Boot_s;

    // CPU ports
    obi_req_t  [NHARTS-1 : 0] core_instr_req;
    obi_resp_t [NHARTS-1 : 0] core_instr_resp;

    obi_req_t  [NHARTS-1 : 0] core_data_req;
    obi_resp_t [NHARTS-1 : 0] core_data_resp;


    // XBAR_CPU Slaves Signals
    obi_req_t  [NHARTS-1 : 0][1:0] xbar_core_data_req;
    obi_resp_t [NHARTS-1 : 0][1:0] xbar_core_data_resp;
    obi_req_t  [NHARTS-1 : 0]      xbar_core_data_req_s;  

    //Voted_CPU Signals
    obi_req_t  voted_core_instr_req_o;
    obi_req_t  voted_core_data_req_o; 
    logic tmr_error_s;
    logic [2:0] tmr_errorid_s;
    logic tmr_voter_enable_s;
    logic [2:0] tmr_dmr_config_s;
    logic dual_mode_tmr_s;

    //Compared CPU Signals
    obi_req_t  [NRCOMPARATORS-1:0] compared_core_instr_req_o;
    obi_req_t  [NRCOMPARATORS-1:0] compared_core_data_req_o;   

    // CPU Private Regs
    reg_pkg::reg_req_t  [NHARTS-1 : 0]cpu_reg_req;
    reg_pkg::reg_rsp_t  [NHARTS-1 : 0]cpu_reg_rsp;    

    //Control & Status Regs 
    reg_pkg::reg_req_t  reg_req;
    reg_pkg::reg_rsp_t  reg_rsp;  


    //Configuration IDs Cores

    logic [2:0][NHARTS-1:0] Core_ID;
    assign Core_ID[0] = {3'b001};
    assign Core_ID[1] = {3'b010};
    assign Core_ID[2] = {3'b100};


//Cores System//

ext_cpu_system #(
        .HARTID        (HARTID),
        .DM_HALTADDRESS  (DM_HALTADDRESS)
    )ext_cpu_system_i(
    .clk_i,
    .rst_ni,
    // Instruction memory interface
    .core_instr_req_o(core_instr_req),
    .core_instr_resp_i(core_instr_resp),

    // Data memory interface
    .core_data_req_o(core_data_req),
    .core_data_resp_i(core_data_resp),

    // Interrupt
    //Core 0
    .intc_core0(intr[0]),
    //Core 1
    .intc_core1(intr[1]),

    //Core 2
    .intc_core2(intr[2]),

    .new_irq_o(new_irq_s),

    .sleep_o(sleep_s),

    // Debug Interface
    .debug_req_i(debug_req),
    .debug_mode_o(debug_mode_s)
);

safe_wrapper_ctrl #(
    .reg_req_t(reg_pkg::reg_req_t),
    .reg_rsp_t(reg_pkg::reg_rsp_t)
    )safe_wrapper_ctrl_i(
    .clk_i,
    .rst_ni,

    // Bus Interface
    .reg_req_i(reg_req),
    .reg_rsp_o(reg_rsp),

    .master_core_o(master_core_s),
    .safe_mode_o         (safe_mode_s),
    .safe_configuration_o(safe_configuration_s),
    .critical_section_o(critical_section_s),
    .Initial_Sync_Master_o(Initial_Sync_Master_s),
    .Start_o              (Start_s),
    .End_sw_routine_o       (End_sw_routine_s),
    .Start_Boot_i        (Start_Boot_s),
    //.Debug_ext_req_i(debug_req_i), //Check if debug_req comes from FSM or external debug Todo: change to 1 the extenal req
    .en_ext_debug_i(en_ext_debug_s) //Todo: other more elegant solution for debugging
    );


periph_to_reg #(
      .req_t(reg_pkg::reg_req_t),
      .rsp_t(reg_pkg::reg_rsp_t),
      .IW(1)
  ) periph_to_reg_i (
      .clk_i,
      .rst_ni,
      .req_i(wrapper_csr_req_i.req),
      .add_i(wrapper_csr_req_i.addr),
      .wen_i(~wrapper_csr_req_i.we),
      .wdata_i(wrapper_csr_req_i.wdata),
      .be_i(wrapper_csr_req_i.be),
      .id_i('0),
      .gnt_o(wrapper_csr_resp_o.gnt),
      .r_rdata_o(wrapper_csr_resp_o.rdata),
      .r_opc_o(),
      .r_id_o(),
      .r_valid_o(wrapper_csr_resp_o.rvalid),
      .reg_req_o(reg_req),
      .reg_rsp_i(reg_rsp)
  );

//FSM

safe_FSM safe_FSM_i (
    // Clock and Reset
    .clk_i,
    .rst_ni,
    .tmr_critical_section_i (critical_section_s),
    .Safe_mode_i          (safe_mode_s),
    .Safe_configuration_i (safe_configuration_s),
    .Initial_Sync_Master_i(Initial_Sync_Master_s), 
    .Halt_ack_i(debug_mode_s), 
    .Hart_wfi_i(sleep_s),
    .Hart_intc_ack_i(Hart_intc_ack_s),
    .Select_wfi_core_o      (Select_wfi_core_s),
    .Master_Core_i(master_core_s),      
    .Interrupt_Sync_o(intc_sync_s),   
    .Interrupt_swResync_o(Interrupt_swResync_s),  
    .Interrupt_Halt_o(intc_halt_s),
    .Interrupt_CpyResync_o(Interrupt_CpyResync_s),
    .Interrupt_DMSH_Sync_o(Interrupt_DMSH_Sync_s),
    .tmr_error(tmr_error_s),
    .voter_id_error(tmr_errorid_s),
    .Single_Bus_o(bus_config_s),
    .Tmr_voter_enable_o(tmr_voter_enable_s),
    .Dmr_comparator_enable_o(),
    .Tmr_dmr_config_o(tmr_dmr_config_s),
    .Dual_mode_tmr_o(dual_mode_tmr_s),
    .Start_Boot_o(Start_Boot_s),
    .Start_i(Start_s),
    .End_sw_routine_i(End_sw_routine_s),
    .en_ext_debug_req_o(en_ext_debug_s)
);
      assign intr[0] = {
    12'b0, Interrupt_DMSH_Sync_s[0], Interrupt_CpyResync_s[0], intc_sync_s[0], Interrupt_swResync_s[0], 16'b0 
  };
      assign intr[1] = {
    12'b0, Interrupt_DMSH_Sync_s[1], Interrupt_CpyResync_s[1], intc_sync_s[1], Interrupt_swResync_s[1], 16'b0 
  };
      assign intr[2] = {
    12'b0, Interrupt_DMSH_Sync_s[2], Interrupt_CpyResync_s[2], intc_sync_s[2], Interrupt_swResync_s[2], 16'b0 
  };

  //Todo future posibility to debug during TMR_SYNC or DMR_IDLE_SYNC
  assign debug_req[0] = (debug_req_i && en_ext_debug_s && master_core_s[0]) || intc_halt_s[0];
  assign debug_req[1] = (debug_req_i && en_ext_debug_s && master_core_s[1]) || intc_halt_s[1];
  assign debug_req[2] = (debug_req_i && en_ext_debug_s && master_core_s[2]) || intc_halt_s[2];


//*****************Safety_Multiplexer*********************//


    always @(*) begin
        
        if (bus_config_s == 0) begin
            //Instruction
            core_instr_req_o = core_instr_req;
            core_instr_resp = core_instr_resp_i;

            //Data
            core_data_req_o[0] = xbar_core_data_req[0][0];
            core_data_req_o[1] = xbar_core_data_req[1][0];
            core_data_req_o[2] = xbar_core_data_req[2][0];
            xbar_core_data_resp[0][0] = core_data_resp_i[0];
            xbar_core_data_resp[1][0] = core_data_resp_i[1];
            xbar_core_data_resp[2][0] = core_data_resp_i[2];
        end
        else begin
                //TMR_Config_Default    //Todo Depends on FSM output
            if (tmr_voter_enable_s == 1'b1) begin
                if(dual_mode_tmr_s == 1'b0) begin
                    //Instruction
                    core_instr_req_o[0] = voted_core_instr_req_o;
                    core_instr_req_o[1] = '0;
                    core_instr_req_o[2] = '0;

                    if (Select_wfi_core_s == 3'b001) begin
                        core_instr_resp[0].rvalid = 1'b1;
                        core_instr_resp[0].gnt = 1'b1;
                        core_instr_resp[0].rdata = 32'h10500073; //wfi instruction

                        core_instr_resp[1] = core_instr_resp_i[0];
                        core_instr_resp[2] = core_instr_resp_i[0];
                    end 
                    else if (Select_wfi_core_s == 3'b010) begin
                        core_instr_resp[1].rvalid = 1'b1;
                        core_instr_resp[1].gnt = 1'b1;
                        core_instr_resp[1].rdata = 32'h10500073; //wfi instruction

                        core_instr_resp[0] = core_instr_resp_i[0];
                        core_instr_resp[2] = core_instr_resp_i[0];
                    end 
                    else if (Select_wfi_core_s == 3'b100) begin
                        core_instr_resp[2].rvalid = 1'b1;
                        core_instr_resp[2].gnt = 1'b1;
                        core_instr_resp[2].rdata = 32'h10500073; //wfi instruction

                        core_instr_resp[0] = core_instr_resp_i[0];
                        core_instr_resp[1] = core_instr_resp_i[0];
                    end 
                    else begin 
                        core_instr_resp[0] = core_instr_resp_i[0];
                        core_instr_resp[1] = core_instr_resp_i[0];
                        core_instr_resp[2] = core_instr_resp_i[0];  
                    end
                    //Data
                    core_data_req_o[0] = voted_core_data_req_o;
                    core_data_req_o[1] = '0;
                    core_data_req_o[2] = '0;
                    xbar_core_data_resp[0][0] = core_data_resp_i[0]; 
                    xbar_core_data_resp[1][0] = core_data_resp_i[0]; 
                    xbar_core_data_resp[2][0] = core_data_resp_i[0];    
                end
                else begin
                    if (tmr_dmr_config_s == 3'b011) begin   //Comparator cpu0_cpu1
                        //Instruction
                        core_instr_req_o[0] = compared_core_instr_req_o[0];
                        core_instr_req_o[1] = core_instr_req[2];
                        core_instr_req_o[2] = '0;

                        core_instr_resp[0] = core_instr_resp_i[0];
                        core_instr_resp[1] = core_instr_resp_i[0];
                        core_instr_resp[2] = core_instr_resp_i[1];
            
                        //Data
                        core_data_req_o[0] = compared_core_data_req_o[0];
                        core_data_req_o[1] = xbar_core_data_req[2][0];
                        core_data_req_o[2] = '0;
                        xbar_core_data_resp[0][0] = core_data_resp_i[0]; 
                        xbar_core_data_resp[1][0] = core_data_resp_i[0]; 
                        xbar_core_data_resp[2][0] = core_data_resp_i[1];     
                    end
                    else if (tmr_dmr_config_s == 3'b110) begin   //Comparator cpu1_cpu2
                    //Instruction
                    core_instr_req_o[0] = compared_core_instr_req_o[1];
                    core_instr_req_o[1] = core_instr_req[0];
                    core_instr_req_o[2] = '0;

                    core_instr_resp[0] = core_instr_resp_i[1];
                    core_instr_resp[1] = core_instr_resp_i[0];
                    core_instr_resp[2] = core_instr_resp_i[0];


                    //Data
                    core_data_req_o[0] = compared_core_data_req_o[1];
                    core_data_req_o[1] = xbar_core_data_req[0][0];
                    core_data_req_o[2] = '0;
                    xbar_core_data_resp[0][0] = core_data_resp_i[1];
                    xbar_core_data_resp[1][0] = core_data_resp_i[0]; 
                    xbar_core_data_resp[2][0] = core_data_resp_i[0];     
                    end
                    else begin                              //Comparator cpu0_cpu2
                        //Instruction
                        core_instr_req_o[0] = compared_core_instr_req_o[2];
                        core_instr_req_o[1] = core_instr_req[1];
                        core_instr_req_o[2] = '0;
                        core_instr_resp[0] = core_instr_resp_i[0];
                        core_instr_resp[1] = core_instr_resp_i[1];
                        core_instr_resp[2] = core_instr_resp_i[0];
            
                        //Data
                        core_data_req_o[0] = compared_core_data_req_o[2];
                        core_data_req_o[1] = xbar_core_data_req[1][0];
                        core_data_req_o[2] = '0;
                        xbar_core_data_resp[0][0] = core_data_resp_i[0]; 
                        xbar_core_data_resp[1][0] = core_data_resp_i[1]; 
                        xbar_core_data_resp[2][0] = core_data_resp_i[0];                         
                    end    
                end
            end
            else begin
                //Instruction
                core_instr_req_o[0] = compared_core_instr_req_o[0];
                core_instr_req_o[1] = '0;
                core_instr_req_o[2] = '0;
                core_instr_resp[0] = core_instr_resp_i[0];
                core_instr_resp[1] = core_instr_resp_i[0];
                core_instr_resp[2] = core_instr_resp_i[0];
                        //Data
                core_data_req_o[0] = compared_core_data_req_o[0];
                core_data_req_o[1] = '0;
                core_data_req_o[2] = '0;
                xbar_core_data_resp[0][0] = core_data_resp_i[0]; 
                xbar_core_data_resp[1][0] = core_data_resp_i[0]; 
                xbar_core_data_resp[2][0] = core_data_resp_i[0]; 
            end
        end
    end
/**********************************************************/


//*********************Safety Voter***********************//
assign xbar_core_data_req_s[0] = xbar_core_data_req[0][0];
assign xbar_core_data_req_s[1] = xbar_core_data_req[1][0];
assign xbar_core_data_req_s[2] = xbar_core_data_req[2][0];

    tmr_voter #(

    ) tmr_voter_i (
        // Instruction Bus
        .core_instr_req_i(core_instr_req),
        .voted_core_instr_req_o(voted_core_instr_req_o),
        .enable_i(tmr_voter_enable_s),
        // Data Bus
        .core_data_req_i(xbar_core_data_req_s),
        .voted_core_data_req_o(voted_core_data_req_o),
    
        .error_o(tmr_error_s),
        .error_id_o(tmr_errorid_s)
    );

//******************Safety Comparator********************//

for(genvar i=0; i<NRCOMPARATORS; i++) begin :dmr_comparator

obi_req_t  [1 : 0] dmr_core_instr_req_i;
obi_req_t  [1 : 0] dmr_core_data_req_i;

if (NHARTS == 3) begin
    if(i == 0) begin : core0_core1
        assign dmr_core_instr_req_i[0] = core_instr_req[0];   
        assign dmr_core_instr_req_i[1] = core_instr_req[1];     
        assign dmr_core_data_req_i[0] = core_data_req[0];   
        assign dmr_core_data_req_i[1] = core_data_req[1]; 
    end
    else if(i == 1) begin : core1_core2
        assign dmr_core_instr_req_i[0] = core_instr_req[1];   
        assign dmr_core_instr_req_i[1] = core_instr_req[2];     
        assign dmr_core_data_req_i[0] = core_data_req[1];   
        assign dmr_core_data_req_i[1] = core_data_req[2];    
    end
    else begin : core0_core2    
        assign dmr_core_instr_req_i[0] = core_instr_req[0];   
        assign dmr_core_instr_req_i[1] = core_instr_req[2];
        assign dmr_core_data_req_i[0] = core_data_req[0];   
        assign dmr_core_data_req_i[1] = core_data_req[2];  
    end
end
else begin : core0_core1
    assign dmr_core_instr_req_i[0] = core_instr_req[0];   
    assign dmr_core_instr_req_i[1] = core_instr_req[1];
    assign dmr_core_data_req_i[0] = core_data_req[0];   
    assign dmr_core_data_req_i[1] = core_data_req[1];          
end

    dmr_comparator #(    
                        
    ) dmr_comparator_i (
    .core_instr_req_i(dmr_core_instr_req_i),
    .compared_core_instr_req_o(compared_core_instr_req_o[i]),
    .core_data_req_i(dmr_core_data_req_i),
    .compared_core_data_req_o(compared_core_data_req_o[i]),
    .error_o()
    );


end



//*******************************************************//

// Private CPU Register
for(genvar i=0; i<NHARTS;i++) begin :priv_reg
  // ARCHITECTURE
  // ------------
  //                ,---- SLAVE[0] (System Bus)
  // CPUx <--> XBARx 
  //                `---- SLAVE[1] (Private Register)
  //

//CPU xbar
    xbar_varlat_one_to_n #(
        .XBAR_NSLAVE   (cei_mochila_pkg::CPU_XBAR_SLAVE),
        .NUM_RULES    (cei_mochila_pkg::CPU_XBAR_NRULES),
        .AGGREGATE_GNT (32'd1) // Not previous aggregate masters
    ) xbar_varlat_one_to_n_i (
        .clk_i         (clk_i),
        .rst_ni        (rst_ni),
        .addr_map_i(cei_mochila_pkg::CPU_XBAR_ADDR_RULES),
        .default_idx_i(1'b0),                   //in case of not known decoded address it's forwarded down to system bus
        .master_req_i  (core_data_req[i]),
        .master_resp_o (core_data_resp[i]),
        .slave_req_o   (xbar_core_data_req[i]),
        .slave_resp_i  (xbar_core_data_resp[i])
    );

// OBI Slave[1] -> Private Address CPU Register
    periph_to_reg #(
        .req_t(reg_pkg::reg_req_t),
        .rsp_t(reg_pkg::reg_rsp_t),
        .IW(1)
    ) cpu_periph_to_reg_i (
        .clk_i,
        .rst_ni,
        .req_i(xbar_core_data_req[i][1].req),
        .add_i(xbar_core_data_req[i][1].addr),
        .wen_i(~xbar_core_data_req[i][1].we),
        .wdata_i(xbar_core_data_req[i][1].wdata),
        .be_i(xbar_core_data_req[i][1].be),
        .id_i('0),
        .gnt_o(xbar_core_data_resp[i][1].gnt),
        .r_rdata_o(xbar_core_data_resp[i][1].rdata),
        .r_opc_o(),
        .r_id_o(),
        .r_valid_o(xbar_core_data_resp[i][1].rvalid),
        .reg_req_o(cpu_reg_req[i]),
        .reg_rsp_i(cpu_reg_rsp[i])
  );

// CPU Private Register

    cpu_private_reg#(
        .reg_req_t(reg_pkg::reg_req_t),
        .reg_rsp_t(reg_pkg::reg_rsp_t)
    )cpu_private_reg_i(
    .clk_i,
    .rst_ni,

    // Bus Interface
    .reg_req_i(cpu_reg_req[i]),
    .reg_rsp_o(cpu_reg_rsp[i]),

    .Core_id_i(Core_ID[i]), 
    .Hart_intc_ack_o(Hart_intc_ack_s[i])
    );

end

endmodule
