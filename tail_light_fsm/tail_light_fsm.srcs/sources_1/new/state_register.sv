`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2020 01:08:41 PM
// Design Name: 
// Module Name: state_register
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


module state_register(input clk, 
                      input rst,
                      input State state_nxt, 
                      output State state_cur);
                     
    always_ff @ (posedge clk, posedge rst)
        if (rst) state_cur = S0;
        else     state_cur = state_nxt;
       
endmodule
