`timescale 1ns / 1ps
class counter;
    int count;
    int max;
    int min;
    // Explicit constructor with an int argument
    function new(int initial_count = 0, int max_limit , int min_limit);
        count = initial_count; // Initialize count to the provided value
        check_limit(max_limit,min_limit);
        check_set(initial_count);
    endfunction
    
    // check limit function 
    function int check_limit(int new_max ,int new_min );
    
    if (new_max > new_min) begin

        max = new_max;  // assign the grater to max
        min = new_min; // assign the lesser to min 
          
    end else begin 
            max = new_max;// assign the max to min 
            min =new_max;  //assign the min to max 
            end
        endfunction

    function int  check_set (set_count );
          if(set_count > max || set_count < min ) begin // if the set count up the linit 
            count = min; // assign the count to min  
            $display("the count assigned to min (%d) des to ;imit" ,min);
          end else begin
          count = set_count;
          end

     endfunction
    // Method to load a value into count
    function void load(int value);
        count = value; // Set count to the provided value
        check_set(value); // to ensure value within limit 
    endfunction 

    // Method to get the current count
    function int getcount();
        return count; // Return current count
    endfunction
endclass
// // Test module to verify the counter class
//  module test_counter;
//      initial begin
//          // Create an instance of the counter with an initial value
//          counter my_counter = new(5,5,1); // Initialize count to 5

//          // Display current count
//          $display("Initial Count: %d", my_counter.getcount());

//          // Load a new value into the counter
//          my_counter.load(10);
//          $display("Count after loading 10: %d", my_counter.getcount());

//          // Load another value into the counter
//          my_counter.load(5);
//          $display("Count after loading 20: %d", my_counter.getcount());
//      end
//  endmodule
