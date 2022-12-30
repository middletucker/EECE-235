
`timescale 1ns/1ns 	// use our own predefined timescale 

module testbench();

  // generate clock so that we can run a simulation 
  reg clk; // undefined right now

  // set-up all inputs and outputs to the modules we want to test
  reg [3:0] Xin; 	
  wire Fout; 

  // use procedural assignments
  initial begin
    clk = 1;
    Xin = -1; 		// ensure all inputs are LOW at start
  end

  always #2 clk = ~clk;  //set clk to invert every 2 units

  always @(posedge clk)  // uses positive edge to trigger sensor value change
    Xin = Xin + 1;


  // Now we set up our MUT (module under test) uncomment the one you want to test
  structural MUT1(Xin, Fout);
  //structuralNEW1 MUT3(Xin, Fout);
  behavioral MUT2(Xin, Fout);

endmodule
