`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2020 06:55:19 PM
// Design Name: 
// Module Name: seven_segment
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

module seven_segment(input logic [3:0] D, 
                     output logic [6:0] S);
                     
      always_comb
        case(D)
            0: S = 7'b100_0000;
            1: S = 7'b111_1001;
            2: S = 7'b010_0100;
            3: S = 7'b011_0000;
            4: S = 7'b001_1001;
            5: S = 7'b001_0010;
            6: S = 7'b000_0010;
            7: S = 7'b111_1000;
            8: S = 7'b000_0000;
            9: S = 7'b001_0000;
            10: S = 7'b000_1000;
            11: S = 7'b000_0011;
            12: S = 7'b100_0110;
            13: S = 7'b010_0001;
            14: S = 7'b000_0110;
            15: S = 7'b000_1110;
            default: S = 7'b1111111;
           
        endcase
endmodule
