
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2020 06:02:12 PM
// Design Name: 
// Module Name: top
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

//`include "testbench.svh"


module top;
    timeunit 1ns / 1ps;
    
    
    gcd DUT(.clk(bfm.clk), .rst(bfm.rst), .a(bfm.a), .b(bfm.b), .result(bfm.result));
    
    
    EuclidGCD_BFM bfm();
    
    Testbench testbench_h;
    
    initial begin
        testbench_h = new(bfm);
        testbench_h.execute();
    end
endmodule
