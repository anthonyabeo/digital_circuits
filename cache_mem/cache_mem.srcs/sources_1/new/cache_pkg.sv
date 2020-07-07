
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2020 04:58:36 PM
// Design Name: 
// Module Name: cache_pkg
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


package cache_pkg;
    
    /////////////////////////////////////
    // Structure for tag and data tables 
    /////////////////////////////////////
    parameter int TAG_MSB = 31;
    parameter int TAG_LSB = 14;
    
    // Entry into the cache tag table.
    typedef struct packed {
        logic                   valid;  // valid bit
        logic                   dirty;  // dirty bit
        logic [TAG_MSB:TAG_LSB] tag;    // Tag bits
    } TagEntry;    
    
    // structre for cache memory request
    typedef struct {
        logic [9:0] index;      // 10-bit write indx
        logic       we;         // write-enable
    } CacheRequest;
    
    // 4-word (128-bit) block/line data.
    typedef logic [127:0] Block;
    
    ////////////////////////////////////////////////////////
    // Structures for the CPU <-> Cache Controler interface.
    ////////////////////////////////////////////////////////
    
    // CPU Reqest (CPU->cache controller)
    typedef struct {
        logic [31:0] addr;      // 32-bit request addr
        logic [31:0] data;      // 32-bit request data (used for STORE commands)
        logic        rw;        // command type: 0 => read. 1 => write
        logic        valid;     // request is valid       
    } CPURequest;
    
    // Cache result(cache controller->cpu)
    typedef struct {
        logic [31:0] data;      // 32-bit data
        logic        ready;     // result is ready
    } CPUResult;
     
     
     ///////////////////////////////////////////////////////
     // Structres for cache controller <-> Memory interface
     ///////////////////////////////////////////////////////
     
     // Memory request (cache controller -> memory)
     typedef struct {
        logic [31:0]   addr;    // request address
        logic [127:0]  data;    // 128-bit data (used STORE commands)
        logic          rw;      // command type: 0 => read. 1 => write
        logic          valid;   // request is valid
     } MemRequest;
     
     // Memory controller response (memory -> cache controller)
     typedef struct {
        Block data;     // 128-bit read back data
        logic ready;    // data is ready
     } MemResponse;
     
     ///////////////////////////////////////////
     // FSM Controller specific structures
     ///////////////////////////////////////////
     
    // One-Hot Encoding for states in FSM
    typedef enum logic [3:0] {
        IDLE        = 4'b0001,
        COMPARE_TAG = 4'b0010,
        ALLOCATE    = 4'b0100,
        WRITE_BACK  = 4'b1000
    } State;
  
    
endpackage: cache_pkg
