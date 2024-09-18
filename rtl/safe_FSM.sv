/*
 *
 *
 *
 */

module safe_FSM
#(
    parameter NHARTS = 3
) (
    // Clock and Reset
    input logic clk_i,
    input logic rst_ni,

    input logic Safe_mode_i,
    input logic tmr_critical_section_i,
    input logic [1:0] Safe_configuration_i,
    input logic Initial_Sync_Master_i,
    input logic [NHARTS-1:0] Halt_ack_i,
    input logic [NHARTS-1:0] Hart_wfi_i,
    input logic [NHARTS-1:0] Hart_intc_ack_i,
    input logic  [NHARTS-1:0] Master_Core_i,
    output logic [NHARTS-1:0] Interrupt_Sync_o,
    output logic [NHARTS-1:0] Interrupt_swResync_o,
    output logic [NHARTS-1:0] Interrupt_CpyResync_o,
    output logic [NHARTS-1:0] Interrupt_DMSH_Sync_o,    
    output logic [NHARTS-1:0] Interrupt_Halt_o,
    output logic [NHARTS-1:0][0:0] Select_wfi_core_o,
    output logic Single_Bus_o,
    output logic [NHARTS-1:0] Tmr_dmr_config_o,
    output logic Dual_mode_tmr_o,
    output logic Tmr_voter_enable_o,
    output logic Dmr_comparator_enable_o,
    input logic [NHARTS-1:0] voter_id_error,
    input logic tmr_error,
    input logic Start_i,
    output logic Start_Boot_o,
    input logic End_sw_routine_i,
    output logic en_ext_debug_req_o
);
  // FSM state encoding
  typedef enum logic [3:0] {
    RESET, IDLE, SINGLE_MODE, TMR_MODE, DMR_MODE 
  } ctrl_safe_fsm_e;

    typedef enum logic [3:0] {
    SINGLE_RESET, SINGLE_IDLE, SINGLE_START, SINGLE_RUN, SINGLE_TO_TMR, SINGLE_SYNC_OFF
  } ctrl_single_fsm_e;

  typedef enum logic [3:0] {
    TMR_RESET, TMR_IDLE, TMR_START, TMR_BOOT, TMR_SH_HALT, 
    TMR_WAIT_SH, TMR_MS_INTRSYNC, TMR_SYNC, TMR_END_SYNC, TMR_TO_SINGLE
  } ctrl_tmr_fsm_e;

  typedef enum logic [3:0] {
    TMR_REC_RESET, TMR_REC_IDLE, TMR_REC_DMODE,TMR_REC_SHSTP, TMR_REC_SYNCINTC,
    TMR_REC_SHWFI, TMR_REC_SWSYNC, TMR_REC_DMCPY, TMR_REC_DMWAITSH, 
    TMR_REC_SH_HALT, TMR_REC_DMSH_SYNCINTC, TMR_REC_DMWFI, TMR_REC_DM_HALT_SH, TMR_REC_SH_HALTWFI
  } ctrl_tmr_recovery_fsm_e;

  ctrl_safe_fsm_e ctrl_safe_fsm_cs, ctrl_safe_fsm_ns;
  ctrl_single_fsm_e ctrl_single_fsm_cs, ctrl_single_fsm_ns;
  ctrl_tmr_fsm_e [NHARTS-1:0] ctrl_tmr_fsm_cs;
  ctrl_tmr_fsm_e [NHARTS-1:0]ctrl_tmr_fsm_ns;

  ctrl_tmr_recovery_fsm_e [NHARTS-1:0] ctrl_tmr_rec_fsm_cs;
  ctrl_tmr_recovery_fsm_e [NHARTS-1:0] ctrl_tmr_rec_fsm_ns;


//  logic [NHARTS-1:0] enable_interrupt_halt_s;
  logic [NHARTS-1:0] enable_interrupt_tmr_halt_s;
  logic [NHARTS-1:0] enable_interrupt_tmr_SHhalt_s;

  logic [NHARTS-1:0] Switch_SingletoTMR_s; 
  logic [NHARTS-1:0] Switch_TMRtoSingle_s;
  logic Enable_Switch_s;


  //################################MOMENTANEO

  logic  halt_req_s;
  logic Single_Boot_s;
  logic [NHARTS-1:0] TMR_Boot_s;
  logic en_safe_ext_debug_req_s, en_single_ext_debug_req_s;
  logic [NHARTS-1:0] dbg_halt_req_s;
  logic [NHARTS-1:0] dbg_halt_req_tmr_s;
  logic [NHARTS-1:0] dbg_halt_req_general_s;
  logic [NHARTS-1:0] Single_Halt_request_s;
  logic [NHARTS-1:0] single_bus_s;
  logic [NHARTS-1:0] tmr_voter_enable_s;
  logic [NHARTS-1:0] dmr_comparator_enable_s;
  logic [NHARTS-1:0] dual_mode_tmr_s;
  logic [NHARTS-1:0] DMR_Mode_SHWFI_s;

      always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
          ctrl_safe_fsm_cs <= RESET;
        end else begin
          ctrl_safe_fsm_cs <= ctrl_safe_fsm_ns;
        end
      end
  //////////////////////////////////////////////////////////////////////////////////////////////
  //SAFE FSM    
  //////////////////////////////////////////////////////////////////////////////////////////////
      always_comb begin
        
        ctrl_safe_fsm_ns = ctrl_safe_fsm_cs;
        
        unique case (ctrl_safe_fsm_cs)

          RESET:
          begin
            ctrl_safe_fsm_ns = IDLE;
          end
          IDLE:
          begin
            if(Safe_mode_i==1'b1 && Safe_configuration_i==2'b01 && Start_i == 1'b1)
              ctrl_safe_fsm_ns = TMR_MODE;  
            else if(Safe_mode_i==1'b1 && Safe_configuration_i==2'b10 && Start_i == 1'b1)
              ctrl_safe_fsm_ns = DMR_MODE;
            else if(Safe_mode_i==1'b0 && Safe_configuration_i==2'b00 && Start_i == 1'b1)
              ctrl_safe_fsm_ns = SINGLE_MODE;
            else
              ctrl_safe_fsm_ns = IDLE;
          end
          SINGLE_MODE:
          begin
            if(Start_i == 1'b0 && ctrl_single_fsm_cs == SINGLE_IDLE)
              ctrl_safe_fsm_ns = IDLE;
            else if(Safe_mode_i==1'b1 && Safe_configuration_i==2'b01)
              ctrl_safe_fsm_ns = TMR_MODE;             
            else if(Safe_mode_i==1'b1 && Safe_configuration_i==2'b10)
              ctrl_safe_fsm_ns = DMR_MODE;
            else
              ctrl_safe_fsm_ns = SINGLE_MODE;
          end
          TMR_MODE:
          begin
            if(ctrl_tmr_fsm_cs[0] == TMR_IDLE
                && ctrl_tmr_fsm_cs[1] == TMR_IDLE && ctrl_tmr_fsm_cs[2] == TMR_IDLE && Start_i == 1'b0)
              ctrl_safe_fsm_ns = IDLE;
            else if (Switch_TMRtoSingle_s[0] == 1'b1 || Switch_TMRtoSingle_s[1] == 1'b1 || Switch_TMRtoSingle_s[2] == 1'b1)
              ctrl_safe_fsm_ns = SINGLE_MODE;                
            else
              ctrl_safe_fsm_ns = TMR_MODE;
          end
          DMR_MODE:
          begin
            if(Safe_mode_i==1'b0)
              ctrl_safe_fsm_ns = IDLE;
            else
              ctrl_safe_fsm_ns = DMR_MODE;
          end

          default: begin
            ctrl_safe_fsm_ns = IDLE;
          end
        endcase
      end

      always_comb begin
        en_safe_ext_debug_req_s = 1'b0;
        Single_Boot_s = 1'b0;
        unique case (ctrl_safe_fsm_cs)  
          IDLE:
          begin
            en_safe_ext_debug_req_s = 1'b1;          
          end
          SINGLE_MODE: 
          begin
            Single_Boot_s = 1'b1;
          end
          default: begin
            en_safe_ext_debug_req_s = 1'b0;     
          end
        endcase  
      end

  //////////////////////////////////////////////////////////////////////////////////////////////
  //SINGLE FSM    
  //////////////////////////////////////////////////////////////////////////////////////////////

      always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
          ctrl_single_fsm_cs <= SINGLE_RESET;
        end else begin
          ctrl_single_fsm_cs <= ctrl_single_fsm_ns;
        end
      end

      always_comb begin
        
        ctrl_single_fsm_ns = ctrl_single_fsm_cs;
        
        unique case (ctrl_single_fsm_cs)

          SINGLE_RESET:
          begin
            ctrl_single_fsm_ns = SINGLE_IDLE;           
          end
          SINGLE_IDLE:
          begin
            if(ctrl_safe_fsm_cs == SINGLE_MODE && Start_i == 1'b1 && End_sw_routine_i == 1'b0 && Switch_TMRtoSingle_s[0] == 1'b0 
              && Switch_TMRtoSingle_s[1] == 1'b0 && Switch_TMRtoSingle_s[2] == 1'b0)
              ctrl_single_fsm_ns = SINGLE_START;
            else if (ctrl_safe_fsm_cs == SINGLE_MODE && Start_i == 1'b1 && End_sw_routine_i == 1'b0 && (Switch_TMRtoSingle_s[0] == 1'b1 
              || Switch_TMRtoSingle_s[1] == 1'b1 || Switch_TMRtoSingle_s[2] == 1'b1))
              ctrl_single_fsm_ns = SINGLE_RUN;              
            else
              ctrl_single_fsm_ns = SINGLE_IDLE;
          end
          SINGLE_START:
          begin
            if(Halt_ack_i == Master_Core_i)
              ctrl_single_fsm_ns = SINGLE_RUN;
            else
              ctrl_single_fsm_ns = SINGLE_START;
          end
          SINGLE_RUN:
          begin
            if (End_sw_routine_i == 1'b1 && Hart_wfi_i == 3'b111) //SW STOP
              ctrl_single_fsm_ns = SINGLE_IDLE;  
            else if (Start_i == 1'b0 && Halt_ack_i == 3'b000 && End_sw_routine_i == 1'b0) //External STOP
              ctrl_single_fsm_ns = SINGLE_SYNC_OFF;
            else if(Halt_ack_i == 3'b000 && Safe_configuration_i == 2'b01) //Switch to others mode
              ctrl_single_fsm_ns = SINGLE_TO_TMR;
            else
              ctrl_single_fsm_ns = SINGLE_RUN;
          end
          SINGLE_TO_TMR:
          begin
            if (Switch_SingletoTMR_s[0] && Switch_SingletoTMR_s[1] && Switch_SingletoTMR_s[2])
            ctrl_single_fsm_ns = SINGLE_IDLE;
            else
            ctrl_single_fsm_ns = SINGLE_TO_TMR;
          end
          SINGLE_SYNC_OFF:
          begin
            if (Hart_wfi_i == 3'b000)
              ctrl_single_fsm_ns = SINGLE_IDLE;              
            else
              ctrl_single_fsm_ns = SINGLE_SYNC_OFF;
          end
          default: begin
            ctrl_single_fsm_ns = SINGLE_IDLE;
          end
        endcase
      end


    //Outputs Todo: Outputs for outside stops operation
    always_comb begin
      Single_Halt_request_s = 3'b000;
      en_single_ext_debug_req_s = 1'b0;
      Enable_Switch_s = 1'b0;
      unique case (ctrl_single_fsm_cs)  
        SINGLE_START:
        begin
          Single_Halt_request_s = Master_Core_i;          
        end
        SINGLE_RUN:
        begin
          en_single_ext_debug_req_s = 1'b0;          
        end
        SINGLE_TO_TMR:
        begin
          Enable_Switch_s = 1'b1;          
        end
        default: begin
          Single_Halt_request_s = 3'b000;
          en_single_ext_debug_req_s = 1'b0;
          Enable_Switch_s = 1'b0;          
        end
      endcase  
    end


  //////////////////////////////////////////////////////////////////////////////////////////////
  //TMR FSM    
  //////////////////////////////////////////////////////////////////////////////////////////////
// Mealy FSM depending on Master Core for different outputs behavior

  for(genvar i=0; i<NHARTS;i++) begin : TMR_FSM_NormalBehaviour

      always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
          ctrl_tmr_fsm_cs[i]  <= TMR_RESET;
        end else begin
          ctrl_tmr_fsm_cs[i]  <= ctrl_tmr_fsm_ns[i];
        end
      end

      always_comb begin
    
        ctrl_tmr_fsm_ns[i] = ctrl_tmr_fsm_cs[i];
    
        unique case (ctrl_tmr_fsm_cs[i])
  
          TMR_RESET:
          begin
            ctrl_tmr_fsm_ns[i] = TMR_IDLE;
          end
  
          TMR_IDLE:
          begin
            if (ctrl_safe_fsm_cs == TMR_MODE && Safe_mode_i == 1'b1 && Start_i == 1'b1 && Enable_Switch_s == 1'b0)
                ctrl_tmr_fsm_ns[i] = TMR_START;              
            else if (ctrl_safe_fsm_cs == TMR_MODE && Safe_mode_i == 1'b1 && Start_i == 1'b1 && Enable_Switch_s == 1'b1) begin
              if (Master_Core_i[i] == 1'b1 && Initial_Sync_Master_i == 1'b1 && Start_i == 1'b1)
                ctrl_tmr_fsm_ns[i] = TMR_SH_HALT;
              else if (Master_Core_i[i] == 1'b0 && (halt_req_s) == 1'b1 && Start_i == 1'b1)
                ctrl_tmr_fsm_ns[i] = TMR_SH_HALT; 
              else                   
                ctrl_tmr_fsm_ns[i] = TMR_IDLE;
            end              
            else begin 
              ctrl_tmr_fsm_ns[i] = TMR_IDLE;      
            end          
          end

          TMR_START:
          begin
            if (Halt_ack_i[i] == 1'b1) 
              ctrl_tmr_fsm_ns[i] = TMR_BOOT;
            else
              ctrl_tmr_fsm_ns[i] = TMR_START;
          end

          TMR_BOOT:
          begin
            if (Halt_ack_i[i] == 1'b0) 
              ctrl_tmr_fsm_ns[i] = TMR_SYNC;
            else
              ctrl_tmr_fsm_ns[i] = TMR_BOOT;
          end

          TMR_SH_HALT:
          begin
            if (Master_Core_i[i] == 1'b1 && ((Halt_ack_i[0] && Halt_ack_i[1]) || (Halt_ack_i[1] && Halt_ack_i[2]) 
                || (Halt_ack_i[0] && Halt_ack_i[2])) == 1'b1)
            ctrl_tmr_fsm_ns[i] = TMR_WAIT_SH;
            else if (Master_Core_i[i] == 1'b0 && Halt_ack_i[i] == 1'b1)
            ctrl_tmr_fsm_ns[i] = TMR_WAIT_SH;
            else
            ctrl_tmr_fsm_ns[i] = TMR_SH_HALT;
          end
  
          TMR_WAIT_SH:
          begin
            if (Hart_wfi_i[0] == 1'b1 && Hart_wfi_i[1] == 1'b1 && Hart_wfi_i[2] == 1'b1)
              ctrl_tmr_fsm_ns[i] = TMR_MS_INTRSYNC;
            else
              ctrl_tmr_fsm_ns[i] = TMR_WAIT_SH;               
          end
  
          TMR_MS_INTRSYNC:
          begin
            if ((Hart_intc_ack_i[0] && Hart_intc_ack_i[1] && Hart_intc_ack_i[2]) == 1'b1)
              ctrl_tmr_fsm_ns[i] = TMR_SYNC;
            else
              ctrl_tmr_fsm_ns[i] = TMR_MS_INTRSYNC;
          end

          TMR_SYNC:
          begin
            if (((Hart_wfi_i[0] == 1'b1 && Hart_wfi_i[1] == 1'b1 && Hart_wfi_i[2])) && End_sw_routine_i ==1'b1)
              ctrl_tmr_fsm_ns[i] = TMR_IDLE;
            else if ((Hart_wfi_i[0] == 1'b1 && Hart_wfi_i[1] == 1'b1 && Hart_wfi_i[2]) == 1'b1 && Safe_mode_i==1'b0)
              ctrl_tmr_fsm_ns[i] = TMR_END_SYNC;
            else
              ctrl_tmr_fsm_ns[i] = TMR_SYNC;
          end

          TMR_END_SYNC:
          begin
            if(Hart_intc_ack_i[i]==1'b1 && Master_Core_i[i]==1'b1) //Master
              ctrl_tmr_fsm_ns[i] = TMR_IDLE;
            else if(Hart_wfi_i[i] == 1'b1 && Master_Core_i[i]==1'b0) //Non Masters
              ctrl_tmr_fsm_ns[i] = TMR_IDLE;
            else
              ctrl_tmr_fsm_ns[i] = TMR_END_SYNC;
          end

          default: begin
            ctrl_tmr_fsm_ns[i] = TMR_IDLE;
          end     
        endcase 
      end


      always_comb begin
        dbg_halt_req_general_s[i] = 1'b0;
//        enable_interrupt_halt_s[i] = 1'b0;
        Interrupt_Sync_o[i] = 1'b0;
        single_bus_s[i]     = 1'b0;
        dbg_halt_req_s[i]   = 1'b0;
        tmr_voter_enable_s[i] = 1'b0;
        TMR_Boot_s[i] = 1'b0;
        Switch_SingletoTMR_s[i] = 1'b0;
        Switch_TMRtoSingle_s[i] = 1'b0;
        unique case (ctrl_tmr_fsm_cs[i])
  
          TMR_START:
          begin
            dbg_halt_req_general_s[i] = 1'b1;
            single_bus_s[i]  = 1'b1;
            tmr_voter_enable_s[i] = 1'b1;
            TMR_Boot_s[i] = 1'b1;
          end

          TMR_BOOT:
          begin
            single_bus_s[i]  = 1'b1;
            tmr_voter_enable_s[i] = 1'b1;
            TMR_Boot_s[i] = 1'b1;
          end

          TMR_SH_HALT:
          begin
              Switch_SingletoTMR_s[i] = 1'b1;
            if (Master_Core_i[i] == 1'b1) begin
              dbg_halt_req_s[i] = 1'b1;
              dbg_halt_req_general_s[i] = 1'b0;
            end
            else
              dbg_halt_req_general_s[i] = 1'b1;         
          end        
  
          TMR_MS_INTRSYNC:
          begin
            Interrupt_Sync_o[i] = 1'b1;
            single_bus_s[i]  = 1'b1;
            tmr_voter_enable_s[i] = 1'b1;
          end 

          TMR_SYNC:
          begin
            single_bus_s[i]  = 1'b1;
            tmr_voter_enable_s[i] = 1'b1;
          end

          TMR_END_SYNC:
          begin
            if (Master_Core_i[i] == 1'b1) begin
              Interrupt_Sync_o[i] = 1'b1; 
              Switch_TMRtoSingle_s[i] = 1'b1;       
            end
          end
          default: begin  end 
        
        endcase
      end

  end

//****************************************************************//
//***********************TMR Recovery FSM*************************//
//****************************************************************//
//****************************************************************//
  for(genvar i=0; i<NHARTS;i++) begin : TMR_FSM_Recovery

      always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
          ctrl_tmr_rec_fsm_cs[i] <= TMR_REC_RESET;
        end else begin
          ctrl_tmr_rec_fsm_cs[i] <= ctrl_tmr_rec_fsm_ns[i];
        end
      end

// Safe FSM 

      always_comb begin
        
        ctrl_tmr_rec_fsm_ns[i] = ctrl_tmr_rec_fsm_cs[i];
        
        unique case (ctrl_tmr_rec_fsm_cs[i])

          TMR_REC_RESET:
          begin
            ctrl_tmr_rec_fsm_ns[i] = TMR_REC_IDLE;           
          end

          TMR_REC_IDLE:
          begin
            if( tmr_error == 1'b1 && ctrl_tmr_fsm_cs[i] == TMR_SYNC && End_sw_routine_i == 1'b0) begin
              if (tmr_critical_section_i == 1'b0)
                ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SYNCINTC;                
              else begin
                if(voter_id_error[i] == 1'b0) 
                  ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMODE;
                else
                  ctrl_tmr_rec_fsm_ns[i]= TMR_REC_SHWFI;
              end
            end
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_IDLE;
          end
          //SW TMR Recovery//
          TMR_REC_SYNCINTC:
          begin
            if (Hart_intc_ack_i[0] && Hart_intc_ack_i[1] && Hart_intc_ack_i[2])
              ctrl_tmr_rec_fsm_ns[i]= TMR_REC_SWSYNC; 
            else
              ctrl_tmr_rec_fsm_ns[i]= TMR_REC_SYNCINTC;               
          end
          TMR_REC_SWSYNC:
          begin
            if(~Hart_intc_ack_i[0] && ~Hart_intc_ack_i[1] && ~Hart_intc_ack_i[2] /*&& tmr_error == 1'b0*/)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_IDLE;
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SWSYNC;
          end
          //***************//
          //HW TMR Recovery//
          TMR_REC_SHWFI:
          begin
            if (Hart_wfi_i[i] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SHSTP;         
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SHWFI;               
          end
          TMR_REC_SHSTP:
          begin
            if (Hart_wfi_i[i] == 1'b0)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SH_HALT;        
            else if(End_sw_routine_i == 1'b1 && Hart_wfi_i[i] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_IDLE;  
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SHSTP;
          end
          TMR_REC_SH_HALT:
          begin
            if (Halt_ack_i[i] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SH_HALTWFI;
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SH_HALT;
          end
          TMR_REC_SH_HALTWFI:
          begin
            if (Hart_wfi_i[i] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMSH_SYNCINTC;
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_SH_HALTWFI;
          end


          TMR_REC_DMODE:
          begin
            if (tmr_critical_section_i == 1'b0)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMCPY;
            else if(End_sw_routine_i == 1'b1 && Hart_wfi_i[i] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_IDLE;
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMODE;              
          end
          TMR_REC_DMCPY:
          begin
            if (Hart_intc_ack_i[i] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMWFI;
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMCPY;              
          end
          TMR_REC_DMWFI:
          begin
            if (Hart_wfi_i[i] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DM_HALT_SH;
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMWFI;              
          end
          TMR_REC_DM_HALT_SH:
          begin
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMWAITSH;             
          end
          TMR_REC_DMWAITSH:
          begin
            if (Hart_wfi_i[0] == 1'b1 && Hart_wfi_i[1] == 1'b1 && Hart_wfi_i[2] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMSH_SYNCINTC;
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMWAITSH;
          end
          TMR_REC_DMSH_SYNCINTC:
          begin
            if (Hart_intc_ack_i[0] == 1'b1 && Hart_intc_ack_i[1] == 1'b1 && Hart_intc_ack_i[2] == 1'b1)
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_IDLE;
            else
              ctrl_tmr_rec_fsm_ns[i] = TMR_REC_DMSH_SYNCINTC;
          end         


          default: begin
            ctrl_tmr_rec_fsm_ns[i] = TMR_REC_IDLE;
          end
        endcase
      end

    always_comb begin
      dmr_comparator_enable_s[i] = 1'b0;
      enable_interrupt_tmr_halt_s[i] = 1'b0;
      enable_interrupt_tmr_SHhalt_s[i] = 1'b0;
      Tmr_dmr_config_o[i] = 1'b0;
      dual_mode_tmr_s[i] = 1'b0;
      DMR_Mode_SHWFI_s[i] = 1'b0;
      Select_wfi_core_o[i] = 1'b0;
      Interrupt_swResync_o[i] = 1'b0;
      Interrupt_CpyResync_o[i] = 1'b0;
      Interrupt_DMSH_Sync_o[i] = 1'b0;
      dbg_halt_req_tmr_s[i] = 1'b0;
      unique case (ctrl_tmr_rec_fsm_cs[i])

        TMR_REC_DMODE:
        begin
            dmr_comparator_enable_s[i] = 1'b1;  
            Tmr_dmr_config_o[i] = 1'b1;
            dual_mode_tmr_s[i] = 1'b1;       
        end
        TMR_REC_SHSTP:
        begin
          DMR_Mode_SHWFI_s[i] = 1'b1;
        end 

        TMR_REC_SHWFI:
        begin
          Select_wfi_core_o[i] = 1'b1;
        end

        TMR_REC_DMCPY:
        begin
          Interrupt_CpyResync_o[i] = 1'b1;
          DMR_Mode_SHWFI_s[i] = 1'b1; 
          dmr_comparator_enable_s[i] = 1'b1;  
          Tmr_dmr_config_o[i] = 1'b1;
          dual_mode_tmr_s[i] = 1'b1;              
        end



        TMR_REC_DMWFI:
        begin
          DMR_Mode_SHWFI_s[i] = 1'b1; 
          dmr_comparator_enable_s[i] = 1'b1;  
          Tmr_dmr_config_o[i] = 1'b1;
          dual_mode_tmr_s[i] = 1'b1;              
        end

        TMR_REC_DM_HALT_SH:
        begin
          enable_interrupt_tmr_halt_s[i] = 1'b1;
          DMR_Mode_SHWFI_s[i] = 1'b1; 
          dmr_comparator_enable_s[i] = 1'b1;  
          Tmr_dmr_config_o[i] = 1'b1;
          dual_mode_tmr_s[i] = 1'b1;  
        end

        TMR_REC_DMSH_SYNCINTC:
        begin
          Interrupt_DMSH_Sync_o[i] = 1'b1; 
        end


        TMR_REC_DMWAITSH:
        begin
          DMR_Mode_SHWFI_s[i] = 1'b1; 
          dmr_comparator_enable_s[i] = 1'b1;  
          Tmr_dmr_config_o[i] = 1'b1;
          dual_mode_tmr_s[i] = 1'b1;            
        end

        TMR_REC_SH_HALT:
        begin
          enable_interrupt_tmr_SHhalt_s[i] = 1'b1;      
        end


        //Software
        TMR_REC_SYNCINTC:
        begin
          Interrupt_swResync_o[i] = 1'b1;
        end


        default: begin  end 
        
        endcase
      end

  end

//  logic Switch_SingletoTMR_ff;
//  logic Clear_Switch_s/
//  logic Enable_Switch_s
/*
  assign Clear_Switch_s = Clear_Switch_ss[0] || Clear_Switch_ss[1] || Clear_Switch_ss[2];

    always_ff @(posedge clk_i or negedge rst_ni) begin
      if (!rst_ni) begin
        Switch_SingletoTMR_ff <= 1'b0;
      end else begin
        if (Clear_Switch_s == 1'b1) 
          Switch_SingletoTMR_ff <= 1'b0;
        else if (Enable_Switch_s == 1'b1)
          Switch_SingletoTMR_ff <= 1'b1;
      end
    end
*/










// Inter-FSM Signals operation
assign halt_req_s = dbg_halt_req_s[0] || dbg_halt_req_s[1] || dbg_halt_req_s[2];

// In-Out FSM Signals operation
assign Single_Bus_o = single_bus_s[0] || single_bus_s[1] || single_bus_s[2];
assign Tmr_voter_enable_o = (tmr_voter_enable_s[0] || tmr_voter_enable_s[1] || tmr_voter_enable_s[2]);
assign Dmr_comparator_enable_o = (dmr_comparator_enable_s[0] || dmr_comparator_enable_s[1] || dmr_comparator_enable_s[2]) && (DMR_Mode_SHWFI_s[0] || DMR_Mode_SHWFI_s[1] || DMR_Mode_SHWFI_s[2]);
assign Dual_mode_tmr_o = (dual_mode_tmr_s[0] || dual_mode_tmr_s[1] || dual_mode_tmr_s[2]) && (DMR_Mode_SHWFI_s[0] || DMR_Mode_SHWFI_s[1] || DMR_Mode_SHWFI_s[2]);

/*
always_comb begin
  dbg_halt_req_general_s = '0;
  if (enable_interrupt_halt_s[0] == 1'b1 || enable_interrupt_halt_s[1] == 1'b1 || enable_interrupt_halt_s[2] == 1'b1) begin
    dbg_halt_req_general_s= ~Master_Core_i;
  end
end
*/
always_comb begin
  dbg_halt_req_tmr_s = '0;
  if (enable_interrupt_tmr_halt_s[0] == 1'b1 || enable_interrupt_tmr_halt_s[1] == 1'b1 || enable_interrupt_tmr_halt_s[2] == 1'b1) begin
    dbg_halt_req_tmr_s= ~enable_interrupt_tmr_halt_s;
  end
end

assign Interrupt_Halt_o = dbg_halt_req_general_s | dbg_halt_req_tmr_s |  enable_interrupt_tmr_SHhalt_s 
                          | Single_Halt_request_s;

assign en_ext_debug_req_o = en_safe_ext_debug_req_s | en_single_ext_debug_req_s;

assign Start_Boot_o = Single_Boot_s | TMR_Boot_s[0] | TMR_Boot_s[1] | TMR_Boot_s[2];
endmodule


