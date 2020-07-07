
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


module CacheDataStore (
    input logic        clk,
    input CacheRequest req,
    input Block        blkWrite,
    output Block       blkRead
);
    
    timeunit 1ns; timeprecision 1ps;
    
    Block DataStore[0:1023];        // 1024 block entries
    
    // Initialize the memory to zeros. 
    initial begin
        for(int i = 0; i < 1024; i++)
            DataStore[i] = '0;
    end
    
    always_ff @ (posedge clk) begin
        if(req.we) 
            DataStore[req.index] <= blkWrite;
    end
    
    assign blkRead = DataStore[req.index];
    
endmodule: CacheDataStore


module CacheTagStore(
    input logic         clk,
    input CacheRequest  req, 
    input TagEntry      tagWrite,
    output TagEntry     tagRead
);
    timeunit 1ns; timeprecision 1ps;
    
    TagEntry TagStore [0:1023];
    
    initial begin 
        for(int i = 0; i < 1024; ++i)
            TagStore[i] = '0;
    end
    
    always_ff @ (posedge clk) begin
        if(req.we)
            TagStore[req.index] <= tagWrite;
    end
    
    assign tagRead = TagStore[req.index];
    
endmodule: CacheTagStore