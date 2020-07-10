
//`include "stimulus.svh"
//`include "checker.svh"
//`include "coverage.svh"


class Testbench;

    virtual EuclidGCD_BFM bfm;
    
    Stimulus stimulus_h;
    Coverage coverage_h;
    Checker checker_h;
    
    function new(virtual EuclidGCD_BFM b);
        bfm = b;
    endfunction: new
    
    task execute();
        stimulus_h = new(bfm);
        coverage_h = new(bfm);
        checker_h = new(bfm);
        
        fork 
            stimulus_h.execute();
            coverage_h.execute();
            checker_h.execute();
        join_none
    endtask: execute
    
endclass: Testbench