`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2020 01:16:47 PM
// Design Name: 
// Module Name: fsm_tail_light
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fsm_tail_light(input logic L, R, clk, rst,
                      output logic RA, RB, RC, LA, LB, LC);
    
    import states::*;
         
    logic clk_en;        
    State [2:0]state_cur, state_nxt;
    
    clk_div c_div(clk, rst, clk_en);
    
//    state_register s_reg(clk, rst, state_nxt, state_cur);
    always_ff @ (posedge clk_en, posedge rst)
        if (rst) state_cur = S0;
        else     state_cur = state_nxt;
        
//    next_state_logic nsl(L, R, state_cur, state_nxt);
    always_comb
        case(state_cur)
            S0: if(~L && ~R)     state_nxt = S0;
                else if(~L && R) state_nxt = S4;
                else if(L && ~R) state_nxt = S1;
                else             state_nxt = S7;
            S1: state_nxt = S2;
            S2: state_nxt = S3;
            S3: state_nxt = S0;
            S4: state_nxt = S5;
            S5: state_nxt = S6;
            S6: state_nxt = S0;
            S7: state_nxt = S0;
            default: state_nxt = S0;
        endcase
        
//    output_logic out(state_cur, RA, RB, RC, LA, LB, LC);
      always_comb
        case(state_cur)
            S0: begin
                    RA <= 1'b0;
                    RB <= 1'b0;
                    RC <= 1'b0;
                    LA <= 1'b0;
                    LB <= 1'b0;
                    LC <= 1'b0;
                end                
            S1: begin
                    RA <= 1'b0;
                    RB <= 1'b0;
                    RC <= 1'b0;
                    LA <= 1'b1;
                    LB <= 1'b0;
                    LC <= 1'b0;
                end                
            S2: begin
                    RA <= 1'b0;
                    RB <= 1'b0;
                    RC <= 1'b0;
                    LA <= 1'b1;
                    LB <= 1'b1;
                    LC <= 1'b0;
                end                
            S3: begin
                    RA <= 1'b0;
                    RB <= 1'b0;
                    RC <= 1'b0;
                    LA <= 1'b1;
                    LB <= 1'b1;
                    LC <= 1'b1;
                end               
            S4: begin
                    RA <= 1'b1;
                    RB <= 1'b0;
                    RC <= 1'b0;
                    LA <= 1'b0;
                    LB <= 1'b0;
                    LC <= 1'b0;
                end             
            S5: begin
                    RA <= 1'b1;
                    RB <= 1'b1;
                    RC <= 1'b0;
                    LA <= 1'b0;
                    LB <= 1'b0;
                    LC <= 1'b0;
                end            
            S6: begin
                    RA <= 1'b1;
                    RB <= 1'b1;
                    RC <= 1'b1;
                    LA <= 1'b0;
                    LB <= 1'b0;
                    LC <= 1'b0;
                end     
            S7: begin
                    RA <= 1'b1;
                    RB <= 1'b1;
                    RC <= 1'b1;
                    LA <= 1'b1;
                    LB <= 1'b1;
                    LC <= 1'b1;
                end
            default: begin 
                    RA <= 1'b0;
                    RB <= 1'b0;
                    RC <= 1'b0;
                    LA <= 1'b0;
                    LB <= 1'b0;
                    LC <= 1'b0;
               end
        endcase
endmodule
