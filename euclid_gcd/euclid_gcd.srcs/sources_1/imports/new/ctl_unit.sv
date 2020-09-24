

module gcd_ctl(
    input logic clk, rst, start,
    input logic [7:0] a, b,
    input logic [1:0] sign,
    
    output logic selA, selB, wrA, wrB,
    output logic [7:0] result
);

    timeunit 1ns; timeprecision 1ps;
   
    ////////////////////////////////
    // DECLARATIONS
    ///////////////////////////////
    typedef enum logic [2:0] { 
        IDLE, 
        INIT, 
        LOAD_A, 
        LOAD_B, 
        WAITT, 
        DONE 
    } State;
    
    State curState, nxtState;
    
    ////////////////////////////////
    // STATE LOGIC
    ////////////////////////////////
    always_ff @ (posedge clk, posedge rst)
        if(rst) curState = IDLE;
        else curState = nxtState;
        
    //////////////////////////////////
    // NEXT STATE LOGIC
    //////////////////////////////////
    always_comb begin
        case(curState)
            IDLE: begin       
                selA <= 1'bx;
                selB <= 1'bx;
                wrA <= 1'b0;
                wrB <= 1'b0;
                       
                if(!start) nxtState = IDLE;
                else nxtState = INIT;
            end
            
            INIT: begin
                selA <= 1'b1;
                selB <= 1'b1;
                wrA <= 1'b1;
                wrB <= 1'b1;
                
                nxtState = WAITT;
            end
            
            WAITT: begin
                selA <= 1'bx;
                selB <= 1'bx;
                wrA <= 1'b0;
                wrB <= 1'b0;
                
                if(sign == 0) nxtState = DONE;
                else if(sign == 1) nxtState = LOAD_A;
                else nxtState = LOAD_B;
            end
            
            LOAD_A: begin
                selA <= 1'b0;
                selB <= 1'bx;
                wrA <= 1'b1;
                wrB <= 1'b0;
                
                nxtState = WAITT;
            end
            
            LOAD_B: begin
                selA <= 1'bx;
                selB <= 1'b0;
                wrA <= 1'b0;
                wrB <= 1'b1;
                
                nxtState = WAITT;
            end
            
            DONE: begin
                nxtState = IDLE;
            end
            
            default: 
                nxtState = IDLE;
        endcase
    end
    
endmodule: gcd_ctl
