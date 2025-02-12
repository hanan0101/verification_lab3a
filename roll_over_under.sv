`timescale 1ns / 1ps

// derived class :upcounter 
class upcounter extends  counter;
//construtor for upcounter 
bit carry; // for max 
// explicit pass the argument to base class constructor
function new(int initial_count, int max_limit , int min_limit);
super.new(initial_count , max_limit ,min_limit);
carry =0;
endfunction
// increment count 
function void next ();

 count +=1;
 if (count > max) begin
    count = min ; // roll over to min
    carry =1;
 end else begin 
    carry =0; 
 end 
 $display("upcounter count %d , carry %b",count ,carry);
endfunction
endclass


class downcounter extends counter;

bit borrow ; //for min 
// construtor 

function new (int initial_count, int max_limit , int min_limit) ;
super.new(initial_count, max_limit ,min_limit);
borrow=0;
endfunction 


//decrement count 


function void next();
count -=1;
if(count < min ) begin
 count = max ; // roll under to max 
  borrow = 1;
  end else begin
    borrow =0;
  end 
$display("Downcounter count %d , and borrow",count, borrow );

endfunction
endclass

// module test_counter_up ;

//    initial begin
//     upcounter up = new (3,3,1);
//     downcounter down =new(3,3,1);


//     //test upcounter 
//     up.next();
//     up.next();
//     up.next();
//     up.next();


//     //test down 
//     down.next();
//     down.next();
//     down.next();
//     down.next();
// end 


// endmodule
