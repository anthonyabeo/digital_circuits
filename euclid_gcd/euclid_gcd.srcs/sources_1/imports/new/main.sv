
module main(
    input logic clk, rst, start,
    input logic [7:0] a, b,
    
    output logic [7:0] result
);  
    
    timeunit 1ns; timeprecision 1ps;
    
    logic [1:0] sign;
    logic selA, selB, wrA, wrB, ALUop;
    
    
    gcd_ctl cu(.clk, .rst, .sign, .start, .selA, .selB, .wrA, .wrB);
    
        
    gcd_datapath eg(.clk, .selA, .selB, .wrA, .wrB, .a, .b, .sign, .result);
    
endmodule: main
