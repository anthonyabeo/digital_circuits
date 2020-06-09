`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2020 04:05:19 PM
// Design Name: 
// Module Name: alu_test
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

import alu_pkg::*;


module alu_test();
    
    // inputs
    logic [5:0] a, b;
    AluOp op;
    
    // outputs
    logic [6:0] result;
    logic zero;
    
    // instantiate DUT
    alu alunit(a, b, op, result, zero);
    
    // test cases
    initial begin
        a=2; b=3; op=ADD; #10;
        assert(result==5) else $display("ERROR: Test Case 1: op=%b a=%h b=%h zero=%h", op, a, b, zero);
        assert(zero==0) else $display("ERROR: Test Case 1: op=%b a=%h b=%h zero=%h", op, a, b, zero);
        
        a=30; b=5; op=ADD; #10
        assert(result==35) else $display("ERROR: Test Case 2: op=%b a=%h b=%h. Got result=%h, expected result=35, ", op, a, b, result);
        assert(zero==0) else $display("ERROR: Test Case 2: op=%b a=%h b=%h. Got zero=%h, expected zero=0", op, a, b, zero);
        
        //////////
        // SUB
        //////////
        a=15; b=3; op=SUB; #10;
        assert(result==12) else $display("ERROR: Test Case 3: op=%b a=%h b=%h. Got result=%h, expected result=12, ", op, a, b, result);
        assert(zero==0) else $display("ERROR: Test Case 3: op=%b a=%h b=%h zero=%h", op, a, b, zero);
        
        a=30; b=5; op=SUB; #10
        assert(result==25) else $display("ERROR: Test Case 4: op=%b a=%h b=%h. Got result=%h, expected result=25, ", op, a, b, result);
        assert(zero==0) else $display("ERROR: Test Case 4: op=%b a=%h b=%h. Got zero=%h, expected zero=0", op, a, b, zero);
        
        //////////
        // SLL
        //////////
        a=2; b=1; op=SLL; #10;
        assert(result==4) else $display("ERROR: Test Case 5: op=%b a=%h b=%h. Got result=%h, expected result=4.", op, a, b, result);
        assert(zero==0) else $display("ERROR: Test Case 5: op=%b a=%h b=%h. Got zero=%h, expected zero=0", op, a, b, zero);
        
        a=4; b=1; op=SLL; #10;
        assert(result==8) else $display("ERROR: Test Case 6: op=%b a=%h b=%h. Got result=%h, expected result=8.", op, a, b, result);
        assert(zero==0) else $display("ERROR: Test Case 6: op=%b a=%h b=%h. Got zero=%h, expected zero=0", op, a, b, zero);
        
        a=0; b=0; op=SLL; #10;
        assert(result==0) else $display("ERROR: Test Case 7: op=%b a=%h b=%h. Got result=%h, expected result=0.", op, a, b, result);
        assert(zero==1) else $display("ERROR: Test Case 7: op=%b a=%h b=%h. Got zero=%h, expected zero=1", op, a, b, zero);
        
        //////////
        // SLT
        //////////
        a=2; b=4; op=SLT; #10;
        assert(result==1) else $display("ERROR: Test Case 8: op=%b a=%h b=%h. Got result=%h, expected result=1.", op, a, b, result);
        assert(zero==0) else $display("ERROR: Test Case 8: op=%b a=%h b=%h. Got zero=%h, expected zero=0", op, a, b, zero);
        
        a=5; b=1; op=SLT; #10;
        assert(result==0) else $display("ERROR: Test Case 9: op=%b a=%h b=%h. Got result=%h, expected result=0.", op, a, b, result);
        assert(zero==1) else $display("ERROR: Test Case 9: op=%b a=%h b=%h. Got zero=%h, expected zero=1", op, a, b, zero);
        
        //////////
        // AND
        //////////
        a=9; b=14; op=AND; #10;
        assert(result==8) else $display("ERROR: Test Case A: op=%b a=%h b=%h. Got result=%h, expected result=8.", op, a, b, result);
        assert(zero==0) else $display("ERROR: Test Case 8: op=%b a=%h b=%h. Got zero=%h, expected zero=0", op, a, b, zero);
        
    end
endmodule