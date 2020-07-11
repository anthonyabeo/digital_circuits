

class Stimulus;
    virtual EuclidGCD_BFM bfm;
    
    function new(virtual EuclidGCD_BFM b);
        bfm = b;
    endfunction: new
    
    
    protected function byte get_data();
        bit [1:0] zero_ones;
        zero_ones = $random;
        if(zero_ones == 2'b00)
            return 8'h00;
        else if(zero_ones == 2'b11)
            return 8'hFF;
        else
            return $random;
            
    endfunction: get_data
    
    
    task execute();
        byte ia, ib, result;
        
        ia = get_data();
        ib = get_data();
        
        bfm.stimulate(ia, ib, result);
        bfm.reset();
    endtask: execute
    
endclass: Stimulus