/**********************************************************************
* Alarm Example. TEST BENCH #2.  EECE 235 
* Use this code to call either the Behaviorial Description (Alarm_Behave)
* or use it to call the Structural version (Alarm_Struct)
***********************************************************************/
`timescale 1ns/1ns 	// use our own predefined timescale 

module Alarm_Testbench2();

  // generate clock so that we can run a simulation 
  reg clk; // undefined right now

  // set-up all inputs and outputs to the modules we want to test
  reg [4:0] SEN; 	// sensor values are in SEN[3:0] and SEN[4] is the on/off for the system
  wire Alarm_OUT;  	// HIGH if active or alarm sounding


  // use procedural assignments to initalize reg variables
  initial begin
    clk = 1;		// set clk high to start
    SEN = -1; 		// ensure all values are LOW at start
  end

  always #2 clk = ~clk;  //set clk to invert every 2 units (so each clock pulse lasts 4 units)

  always @(posedge clk)  // uses positive edge to trigger sensor value change
    SEN = SEN + 1;


  // Now we set up our MUT (module under test) ... uncomment the one you want to test

  Alarm_Struct MUT(SEN[3:0], SEN[4], Alarm_OUT);
 
  //Alarm_Behave MUT2(SEN, EN, Alarm_OUT);



  // Now display output to the console
  initial begin
   $display("Output from Simulation");
   $display("  ENABLE   SEN[3]  SEN[2]  SEN[1]  SEN[0]");
   $monitor(" \t%b \t%b \t%b \t%b \t%b", SEN[4], SEN[3], SEN[2], SEN[1], SEN[0]);
  end



endmodule