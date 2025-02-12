`timescale 1ns / 1ps 

class timer ;
//Instance variables for hours ,minutes and seconds 
upcounter hours ;
upcounter minutes;
upcounter seconds;

// The timer constructor has three arguments for the initial hour, minute and
// second counts (with default values)..

function new (int initial_hour=0 , int initial_minute=0 ,int initial_second=0 );
// upcounter instance with the appropriate initial value and sets max and min

hours = new(initial_hour ,23,0);   // timer as a clock, hours instance  max 23  min of 0.
minutes = new(initial_minute ,59 ,0); // minut max 59 and min 0
seconds =new(initial_second ,59,0);

 
endfunction
//The load method has three arguments to set the hour, minute and second counts.
function void load (int set_h,int set_mint ,int set_sec );
    hours.count = set_h;
    minutes.count = set_mint;
    seconds.count =set_sec;
    endfunction 
//The show value method displays the current hour, minute and second.
function void showval();
   $display("%02d:%02d:%02d",hours.count,minutes.count,seconds.count); 
    endfunction
// The next method increments the timer and displays the new hour, minute
function  void next();
    seconds.next(); //increment seconds 

// check for carry from seconds to minutes 
 if(seconds.carry) begin // if there is carry that means uper limts and then minuts incrmeint 
        minutes.next();
     
    if(minutes.carry) begin 
        hours.next();
    end

 end 
 showval(); //show after increment
endfunction 
endclass


// Test module
module test_timer;
    initial begin
        
        // Create instances of upcounter and downcounter
       
       timer my_time = new(12,30,45);

       my_time.showval();

       my_time.next();
       my_time.next();
       my_time.next();
       my_time.next();

        my_time.load(23,59,59);
        my_time.showval();
        my_time.next();

    end 
endmodule
