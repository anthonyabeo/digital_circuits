
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2020 02:21:12 PM
// Design Name: 
// Module Name: cache_ctl
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


module cache_ctl(
    input logic clk, rst,
    input CPURequest cpuReq,
    input MemResponse memResp,
    output MemRequest memReq,
    output CPUResponse cpuResp
);
    timeunit 1ns; timeprecision 1ps;
    
    State curState, nxtState;           // FSM current and next states
    
    // Interface signals to Tag memory
    TagEntry tagRead;                   // tag read reslt
    TagEntry tagWrite;                  // tag write data
    CacheRequest tagReq;                // tag request
    
    // Interface signals to Block memory
    Block blkRead;                      // cache block read data
    Block blkWrite;                     // cache block write data
    CacheRequest blkReq;                // block data request
    
    // temporary variable for memory controller request
    MemRequest vMemReq;
    
    // temporary variable for cache controller request
    CPUResponse vCPUResp;
    
    assign memReq = vMemReq;        // connec to output ports
    assign cpuResp = vCPUResp;
    
    always_comb begin
        //--------------Initial all signals to default values-------------
        
        // No state change
        nxtState = curState;
        vCPUResp = '{0, 0}; tagWrite = '{0, 0, 0};
        
        tagReq.we = '0;                      // read tag by default
        tagReq.index = cpuReq.addr[13:4];    // direct mapped index for tag
        
        blkReq.we = '0;                      // read current cache line by default
        blkReq.index = cpuReq.addr[13:4];    // direct mapped index for data
        
        
        blkWrite = blkRead;
        case(cpuReq.addr[3:2])
            2'b00: blkWrite[31:0] = cpuReq.data;
            2'b01: blkWrite[63:32] = cpuReq.data;
            2'b10: blkWrite[95:64] = cpuReq.data;
            2'b11: blkWrite[127:96] = cpuReq.data;
        endcase
        
        // read out correct word from cache to CPU
        case(cpuReq.addr[3:2])
            2'b00: vCPUResp.data = blkRead[31:0];
            2'b01: vCPUResp.data = blkRead[63:32];
            2'b10: vCPUResp.data = blkRead[95:64];
            2'b11: vCPUResp.data = blkRead[127:96];
        endcase
        
        
        // memory request address (sampled from CPU request
        vMemReq.addr = cpuReq.addr;
        
        // memory request data (used in write)
        vMemReq.data = blkRead;
        vMemReq.rw = '0;
        
        //---------------------Cache FSM----------------------------------
        case(curState)
            IDLE: begin
                if(cpuReq.valid)
                    nxtState = COMPARE_TAG;
            end
               
            COMPARE_TAG: begin
                // cache hit (tag match and cache entry is valid)
                if(cpuReq.addr[TAG_MSB:TAG_LSB] == tagRead.tag && tagRead.valid) begin
                    vCPUResp.ready = '1;
                    
                    // write hit
                    if(cpuReq.rw) begin
                        // read/modify cache line
                        tagReq.we = '1; 
                        blkReq.we = '1;
                        
                        // no change in tag
                        tagWrite.tag = tagRead.tag;
                        tagWrite.valid = '1;
                        
                        // cache line is dirty
                        tagWrite.dirty = '1;
                    end
                    
                    nxtState = IDLE;
                end  
                
                // cache miss
                else begin
                    // generate new tag
                    tagReq.we = '1;
                    tagWrite.valid = '1;
                    
                    // new tag
                    tagWrite.tag = cpuReq.addr[TAG_MSB: TAG_LSB];
                    
                    // cache line is dirty of write
                    tagWrite.dirty = cpuReq.rw;
                    
                    // generate memory request on miss
                    vMemReq.valid = '1;
                    
                    // compulsory miss or miss with clean block
                    if(tagRead.valid == 1'b0 || tagRead.dirty == 1'b0)
                        // wait till a new block is allocated
                        nxtState = ALLOCATE;
                    else begin // miss with dirty line
                        // write back address
                        vMemReq.addr = {tagRead.tag, cpuReq.addr[TAG_LSB-1:0]};
                        vMemReq.rw = '1;
                        
                        // wait till write is completed
                        nxtState = WRITE_BACK;
                    end
                end
            end
            
            // wait for allocating a new cache line
            ALLOCATE: begin
                // memory controller has responsed
                if(memResp.ready) begin
                    // re-compare tag for write miss (need modify correct word)
                    nxtState = COMPARE_TAG;
                    blkWrite = memResp.data;
                    
                    // update cache line data
                    blkReq.we = '1;
                end
            end
            
            // wait for writing back dirty cache line
            WRITE_BACK: begin
                // write back is completed
                if(memResp.ready) begin
                    // issue new memory request (allocating a new block)
                    vMemReq.valid = '1;
                    vMemReq.rw = 0;
                    
                    nxtState = ALLOCATE;
                end
            end
                 
        endcase
              
    end
    
    
    always_ff @ (posedge clk) begin
        if(rst) curState = IDLE;
        else curState = nxtState;
    end
    
    // connect cache tag/data memory
    CacheTagStore tagStore(.*);
    CacheDataStore dataStore(.*);
    
endmodule: cache_ctl
