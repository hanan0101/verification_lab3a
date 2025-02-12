`timescale 1ns / 1ps

// Derived class: upcounter
class upcounter extends counter;
    static int instances_count = 0; // Count the number of instances created
    bit carry; // For max

    // Constructor for upcounter
    function new(int initial_count, int max_limit, int min_limit);
        super.new(initial_count, max_limit, min_limit);
        carry = 0;
        instances_count++; // Increment instance count
    endfunction

    // Static method to get instance count
    static function int get_instances();
        return instances_count; // Return the count of instances
    endfunction

    // Increment count
    function void next();
        count += 1;
        if (count > max) begin
            count = min; // Roll over to min
            carry = 1;
        end else begin
            carry = 0; 
        end 
        $display("Upcounter count: %d, carry: %b", count, carry);
    endfunction
endclass

// Derived class: downcounter
class downcounter extends counter;
    static int instances_count = 0; // Count the number of instances created
    bit borrow; // For min

    // Constructor for downcounter
    function new(int initial_count, int max_limit, int min_limit);
        super.new(initial_count, max_limit, min_limit);
        borrow = 0;
        instances_count++; 
    endfunction 

    // Static method to get instance count
    static function int get_instances();
        return instances_count; // Return the count of instances
    endfunction

    // Decrement count
    function void next();
        count -= 1;
        if (count < min) begin
            count = max; // Roll under to max 
            borrow = 1;
        end else begin
            borrow = 0;
        end 
        $display("Downcounter count: %d, borrow: %b", count, borrow);
    endfunction
endclass

// Test module
module test_counter_up;
    initial begin
        upcounter up = new(3, 3, 1);
        upcounter up1 = new(3, 3, 1);
        downcounter down = new(3, 3, 1);

        // Display instance counts
        $display("Total upcounter instances: %d", upcounter::get_instances());
        $display("Total downcounter instances: %d", downcounter::get_instances());
    end 
endmodule
