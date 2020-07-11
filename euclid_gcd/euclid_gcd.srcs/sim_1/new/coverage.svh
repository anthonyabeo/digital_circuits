class Coverage;
    
    virtual EuclidGCD_BFM bfm;
    
    function new(virtual EuclidGCD_BFM b);
        bfm = b;
    endfunction: new
    
    task execute();
        $display("Coverage Pending Implementation");
    endtask;
    
endclass: Coverage