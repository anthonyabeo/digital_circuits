
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2020 04:55:29 PM
// Design Name: 
// Module Name: cache
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

import cache_pkg::*;


module cache #(parameter C=4096, b=8, N=4)(
    input logic         clk, rst, rdwr, rdy,
    input logic         MemOp,
    input logic [31:0]  Address,
    inout logic [31:0]  Data
);
    
    timeunit 1ns; timeprecision 1ps;
    
    // Define current and next state variables
    State curState, nxtState;
    
    localparam B = C / b;           // Number of blocks
    localparam S = B / N;           // Number of sets
    
    logic [1:0] blkOffset = Address[3:2];
    logic [6:0]  setIndex = Address[10:4];
    logic [22:0] tag      = Address[31:11];
    
    logic  hit, hit0, hit1, hit2, hit3;
    
    Block block0, block1, block2, block3;
    logic [31:0] data;
    
    // Cache Organization
    Block way0 [S];            // Way 0
    Block way1 [S];            // Way 1
    Block way2 [S];            // Way 2
    Block way3 [S];            // Way 3
    
    always_ff @ (posedge clk or posedge rst)
        if(rst) curState = IDLE;
        else curState = nxtState;
        
    // NEXT STATE LOGIC
    always_comb begin
        case(curState)
            IDLE:
                // Waits for a valid read or write request from the processor
                // which moves the FSM to the COMPARE_TAG state;
                if (MemOp == LOAD || MemOp == STORE)
                    nxtState = COMPARE_TAG;
                    
            COMPARE_TAG: begin
                // Test to see if the requested LOAD/STORE is a hit/miss
                block0 <= way0[setIndex];
                block1 <= way1[setIndex];
                block2 <= way2[setIndex];
                block3 <= way3[setIndex];
                
                hit0 <= ((block0.tag == tag) && block0.v);
                hit1 <= ((block1.tag == tag) && block1.v);
                hit2 <= ((block2.tag == tag) && block2.v);
                hit3 <= ((block3.tag == tag) && block3.v);
                
                hit <= (hit0 | hit1 | hit2 | hit3);
                
//                if(hit && MemOp == LOAD)
//                    case({hit3, hit2, hit1, hit0})
//                        4'b0001: data <= block0.data;
//                        4'b0010: data <= block1.data;
//                        4'b0100: data <= block2.data;
//                        4'b1000: data <= block3.data;
//                    endcase
//                else if(hit && MemOp == STORE)
                
//                else if(!hit &&
//            end

        endcase
    end
    
endmodule: cache
