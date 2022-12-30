/**********************************************************************
* Alarm Example. TEST BENCH #1.  EECE 235 
* Use this code to call either the Behaviorial Description (Alarm_Behave)
* or use it to call the Structural version (Alarm_Struct)
***********************************************************************/
`timescale 1ns/1ns 	// use our own predefined timescale 

module Alarm_Testbench1();

  // generate clock so that we can run a simulation 
  reg clk; // undefined right now

  // set-up all inputs and outputs to the modules we want to test
  reg [3:0] SEN; 	// sensor values
  reg EN;	        	// on/off switch to the system, HIGH when armed 
  wire Alarm_OUT;  	// HIGH if active or alarm sounding

  // use procedural assignments
  initial begin
    clk = 1;
    SEN = -1; 		// ensure all values are LOW at start
    EN = 1;  		// system is ARMED
  end

  always #2 clk = ~clk;  //set clk to invert every 2 units

  always #100 EN = ~EN;  /* should cycle through every 64, but let's see what 
  happens when we change ENABLE */

  always @(posedge clk)  // uses positive edge to trigger sensor value change
    SEN = SEN + 1;


  // Now we set up our MUT (module under test) uncomment the one you want to test
  Alarm_Struct MUT(SEN, EN, Alarm_OUT);
 
  //Alarm_Behave MUT2(SEN, EN, Alarm_OUT);

endmodule