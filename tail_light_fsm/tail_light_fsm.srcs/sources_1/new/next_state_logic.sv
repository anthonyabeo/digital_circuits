`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2020 01:38:55 PM
// Design Name: 
// Module Name: next_state_logic
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


module next_state_logic(input logic L, R,
                        input State state_cur,
                        output State state_nxt);
                        
    always_comb
        case(state_cur)
            S0: if(~L && ~R)     state_nxt = S0;
                else if(~L && R) state_nxt = S4;
                else if(L && ~R) state_nxt = S1;
                else            state_nxt = S7;
            S1: state_nxt = S2;
            S2: state_nxt = S3;
            S3: state_nxt = S0;
            S4: state_nxt = S5;
            S5: state_nxt = S6;
            S6: state_nxt = S0;
            S7: state_nxt = S0;
            default: state_nxt = S0;
        endcase
        
endmodule
