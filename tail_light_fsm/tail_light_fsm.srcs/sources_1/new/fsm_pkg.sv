`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2020 10:29:01 PM
// Design Name: 
// Module Name: fsm_pkg
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