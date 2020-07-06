
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
    typedef enum logic [6:0] {
        LOAD = 7'b0000011,
        STORE = 7'b0100011
    } MemOpCode;
    
    
    typedef enum logic [3:0] {
        IDLE        = 4'b0001,
        COMPARE_TAG = 4'b0010,
        ALLOCATE    = 4'b0100,
        WRITE_BACK  = 4'b1000
    } State;
    
    typedef struct packed {
        logic valid, dirty;
        logic [22:0] tag;
        logic [31:0] data;
    }  Block;
    
endpackage
