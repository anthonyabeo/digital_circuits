`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2020 01:01:41 PM
// Design Name: 
// Module Name: alu
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
import alu_pkg::*;

module alu(
    input logic [5:0]    a,
    input logic [5:0]    b,
    input AluOp          alu_op,
    output logic [6:0]   result,
    output logic         zero
);

//    logic [6:0] temp;
    
    always_comb begin
        case(alu_op)
            ADD: result = a + b; 
            SUB: result = a - b; 
            SLL: result = a << b;
            SLT: result = (a < b) ? 1 : 0;
            SLTU: result = (a < b) ? 1 : 0;
            XOR: result = a ^ b;
            SRL: result = a >> b;
            SRA: result = a >>> b;
            OR: result = a | b;
            AND: result = a & b;
        endcase
    end
    
//    seven_segment sv(temp, result);
//    assign result = temp;
    assign zero = result == 0 ? 1 : 0;
    
endmodule
