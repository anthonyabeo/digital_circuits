

module gcd_datapath(
    input logic clk, selA, selB, wrA, wrB,
    input logic [7:0] a, b,
    
    output logic [1:0] sign,
    output logic [7:0] result
);
    timeunit 1ns; timeprecision 1ns;
    
    logic [7:0] A, B;
    
    always_ff @ (posedge clk) begin
        if(wrA) A = selA ? a : result;
        if(wrB) B = selB ? b : result;
    end
    
    always_comb begin
        if(A == B) begin
            sign = 2'b00;
            result = A;
        end
        
        else if(A > B) begin
            sign = 2'b01;
            result = A - B;
        end
        
        else begin 
            sign = 2'b10;
            result = B - A;
        end
    end
    
endmodule: gcd_datapath
