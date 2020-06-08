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

    logic [6:0] temp;
    
    always_comb begin
        case(alu_op)
            ADD: temp = a + b; 
            SUB: temp = a - b; 
            SLL: temp = a << b;
            SLT: temp = (a < b) ? 1 : 0;
            SLTU: temp = (a < b) ? 1 : 0;
            XOR: temp = a ^ b;
            SRL: temp = a >> b;
            SRA: temp = a >>> b;
            OR: temp = a | b;
            AND: temp = a & b;
        endcase
    end
    
    seven_segment sv(temp, result);
    assign zero = result == 0 ? 1 : 0;
    
endmodule
