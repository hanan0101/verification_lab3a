`timescale 1ns /1ps
class counter ;
  int count ;

// funtion will load the count value 
  function void load ( int value);
     count = value ;
   endfunction

// this function will return count 
   function int getcount();
     return count ;
   endfunction
endclass

// creat instance of class 

module test_counter ;

    initial begin
        // Create an instance of the counter class
    coutner count = new ();
        // Load a value into the counter
        count.load(10);

        // Retrieve and display the count
        int current_count = count.getcount();
        $display("Current Count: %0d", current_count); // Display the count
    end
endmodule    
