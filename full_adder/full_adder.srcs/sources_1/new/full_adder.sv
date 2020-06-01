`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2020 04:47:46 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(input logic a, b, cin,
                  output logic s, cout);
                  
     assign s = cin & ((~a&~b) | (a&b)) |
                ~cin & ((~a&b) | (a&~b));
                
     assign cout = a&b | cin & ((~a&b) | (a&~b));
endmodule


module four_bit_adder(input logic [3:0] a, b, 
                      output logic [4:0] s);
                      
     logic s0, c0, 
           s1, c1,
           s2, c2,
           s3, c3;
     
     full_adder(a[0], b[0], 2'b0, s0, c0);
     full_adder(a[1], b[1], c0, s1, c1);
     full_adder(a[2], b[2], c1, s2, c2);
     full_adder(a[3], b[3], c2, s3, c3);
     
     assign s = {c3, s3, s2, s1, s0};
                       
endmodule