`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2020 02:05:35 PM
// Design Name: 
// Module Name: output
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
package states;
    typedef enum logic [2:0] {
        S0 = 3'b000, 
        S1 = 3'b001,
        S2 = 3'b010, 
        S3 = 3'b011, 
        S4 = 3'b100,
        S5 = 3'b101, 
        S6 = 3'b110, 
        S7 = 3'b111
    } State;
endpackage

import states::*;
    
module output_logic(State state, output logic RA, RB, RC, LA, LB, LC);
    always_comb
        case(state)
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
