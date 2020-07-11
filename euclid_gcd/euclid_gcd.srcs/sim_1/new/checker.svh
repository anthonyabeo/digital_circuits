
class Checker;

    virtual EuclidGCD_BFM bfm;
    
    function new(virtual EuclidGCD_BFM b);
        bfm = b;
    endfunction: new
    
    task execute();
        byte expected_result = 8'h0A;
        if(expected_result !== bfm.result)
            $error("Expected %h, Got %h", expected_result, bfm.result);
    endtask: execute;
    
endclass: Checker