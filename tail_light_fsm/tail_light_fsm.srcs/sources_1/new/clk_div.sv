`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2020 06:29:38 PM
// Design Name: 
// Module Name: clk_div
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


module clk_div(input clk, input rst, output clk_en);
    logic[24:0] clk_count;
    
    always @ (posedge clk)
        begin
            if(rst)
                clk_count <= 0;
            else
                clk_count <= clk_count + 1;
        end
        
    assign clk_en = &clk_count;
endmodule
