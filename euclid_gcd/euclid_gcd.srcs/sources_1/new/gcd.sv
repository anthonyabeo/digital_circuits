
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2020 10:09:16 PM
// Design Name: 
// Module Name: gcd
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


module gcd(
    input logic clk, rst,
    input logic [7:0] a, b,
    output logic [7:0] result
);

    timeunit 1ns; timeprecision 1ps;
    
    logic [7:0] A, B;
    
    
    typedef enum logic [1:0] { S0, S1, S2, S3} State;
    State curState, nextState;
    
    always_ff @ (posedge clk, posedge rst)
        if(rst) begin
            curState = S0;
            A <= a; B <= b;
        end
        else begin
            if(A < B) B <= B - A;
            if(A > B) A <= A - B;
            
            curState = nextState;
        end
 
    
    always_comb begin 
        case(curState)
            S0: 
                if(A == B) nextState = S3;
                else if(A < B) nextState = S1;
                else nextState = S2;
                
            S1: begin 
                if(A == B) nextState = S3;
                else if(A < B) nextState = S1;
                else nextState = S2;
            end
            
            S2: begin
                if(A == B) nextState = S3;
                else if(A < B) nextState = S1;
                else nextState = S2;
            end
            
            S3: nextState = S3;
            
            default: nextState = S0;
           
        endcase
    end
    
            
    always_comb
        if(curState == S3)
            result <= A;
        
endmodule: gcd

