`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2020 07:02:34 PM
// Design Name: 
// Module Name: sev_seg_driver
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


module sev_seg_driver(input logic [3:0] a, b,
                      output logic [6:0] D,
                      output logic O);
    
//    logic [6:0] D;
    logic [4:0] S;
    
//    logic O;
    
    four_bit_adder adder(a, b, S);
    seven_segment display(S[3:0], D);
    
    assign O = S[4];
    
endmodule
