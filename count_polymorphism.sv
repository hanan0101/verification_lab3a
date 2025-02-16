
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////Bais class/////////////////////////////////////////////////////////////////////////////////////////////////////
virtual class counter;
    int count;
    int max;
    int min;
    
    virtual function  void next();
       $display("in counter class");
       endfunction
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

////////////////////////////////////////////////////////////////////////////////////////////////////////end basd class ////////////////////////////////////////////////////////////////////////
// derived class :upcounter 
class upcounter extends  counter;
//construtor for upcounter 

// explicit pass the argument to base class constructor
function new(int initial_count, int max_limit , int min_limit);
super.new(initial_count , max_limit ,min_limit);

endfunction
// increment count overriden
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

// overried next function
function void next();
count -=1;
if(count < min )
 count = max ; // roll over to max 
$display("Downcounter count %d",count );

endfunction
endclass

//Test module
module test_counter_up;
    counter c_handle;       // Declare a handle for the virtual class
    upcounter up_handle;    // Declare a handle for upcounter
    downcounter down_handle; // Declare a handle for downcounter

    initial begin
        // Create instances of upcounter and downcounter
        up_handle = new(3, 5, 1);   // Create an upcounter instance
        down_handle = new(5, 1, 0); // Create a downcounter instance

        // Assign upcounter instance to counter handle
        c_handle = up_handle;

        // Call next method from the upcounter handle
        $display("Calling next from upcounter handle:");
        up_handle.next();

        // Call next method from the counter handle
        $display("Calling next from counter handle:");
        c_handle.next(); // This will call upcounter's next due to polymorphism

        // Now cast the counter handle back to upcounter
       // upcounter casted_up_handle;
        if (!$cast(up_handle, c_handle)) begin
            $display("Casting failed!");
        end else begin
            $display("Casting succeeded!");
            // Call next from the casted handle
            $display("Calling next from casted upcounter handle:");
            up_handle.next();
        end
        
        // Call next from downcounter handle
        $display("Calling next from counter handle:");
        c_handle.next();
    end 
endmodule
