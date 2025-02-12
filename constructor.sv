`timescale 1ns / 1ps
class counter;
    int count;
    // Explicit constructor with an int argument
    function new(int initial_count = 0);
        count = initial_count; // Initialize count to the provided value
    endfunction

    // Method to load a value into count
    function void load(int value);
        count = value; // Set count to the provided value
    endfunction 

    // Method to get the current count
    function int getcount();
        return count; // Return current count
    endfunction
endclass
// // Test module to verify the counter class
 module test_counter;
     initial begin
         // Create an instance of the counter with an initial value
         counter my_counter = new(5); // Initialize count to 5

         // Display current count
         $display("Initial Count: %d", my_counter.getcount());

         // Load a new value into the counter
         my_counter.load(10);
         $display("Count after loading 10: %d", my_counter.getcount());

         // Load another value into the counter
         my_counter.load(20);
         $display("Count after loading 20: %d", my_counter.getcount());
     end
 endmodule
