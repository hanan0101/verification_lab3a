`timescale 1ns / 1ps


// derived class :upcounter 
class upcounter extends  counter;
//construtor for upcounter 

// explicit pass the argument to base class constructor
function new(int initial_count, int max_limit , int min_limit);
super.new(initial_count , max_limit ,min_limit);

endfunction
// increment count 
function void next ();

 count +=1;
 if (count > max) begin
    count = min ; // roll over to min 
 end 
 $display("upcounter count %d",count);
endfunction
endclass


class downcounter extends counter;

// construtor 

function new (int initial_count, int max_limit , int min_limit) ;
super.new(initial_count, max_limit ,min_limit);
endfunction 


//decrement count 


function void next();
count -=1;
if(count < min )
 count = max ; // roll over to max 
$display("Downcounter count %d",count );

endfunction
endclass

module test_counter_up ;

   initial begin
    upcounter up = new (3,3,1);
    downcounter down =new(3,3,1);


    //test upcounter 
    up.next();
    up.next();
    up.next();
    up.next();


    //test down 
    down.next();
    down.next();
    down.next();
    down.next();
end 


endmodule
