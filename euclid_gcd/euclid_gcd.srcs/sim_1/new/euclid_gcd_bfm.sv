`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2020 06:07:42 PM
// Design Name: 
// Module Name: euclid_gcd_bfm
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

interface EuclidGCD_BFM;
    logic clk, rst;
    logic [7:0] a, b, result;
    
    initial begin
        clk = 0;
        forever #5ns clk = ~clk;
    end
    
    ////////////////////////
    //
    ////////////////////////
    task reset();
        @ (posedge clk)
        rst = 1'b1;
    endtask: reset
    
    ///////////////////////////////////////
    //
    ///////////////////////////////////////
    task stimulate(input byte ia, ib, output byte gcd_result);
        @ (posedge clk)
        a = ia;
        b = ib;
        
        @ (posedge clk)
        result = gcd_result;
        
    endtask: stimulate
endinterface: EuclidGCD_BFM
