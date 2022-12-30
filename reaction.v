module reaction(Clock, state, FLAG, LEDn, Digit1, Digit0);
  input Clock;
  input [1:0] state;
  output reg FLAG;
  output wire [9:0] LEDn;
  output wire [6:0] Digit1, Digit0;
  
  reg [9:0] LED;
  reg [3:0] BCD1, BCD0;
  reg [9:0] myRand;
  reg [9:0] k;
  
  always @(posedge Clock)
    begin
	   if (state == 0) // idle state, clear values on HEX and LEDs are off
			begin
			  LED[9:0] <= 10'b0000000000;
			  BCD1 <= 0;
			  BCD0 <= 0;
			  FLAG <= 0;
			  k <= 0;
			  myRand <= myRand + 11;
			  
			end
	 
      else if (state == 1) // delay state
		   begin 
				LED[9:0] <= 10'b1000000000;
			   BCD1 <= 0;
			   BCD0 <= 0;
				myRand <= myRand;
				k <= k + 1;
				
				if (k > myRand%400) // gives a max 4 seconds
				   FLAG <= 1;
				else 
				   FLAG <= 0;
				
			end

      else if (state == 2) // timing state
		   begin
			  LED[9:0] <= 10'b1111111111;
			  k <= 0;
			  myRand <= myRand;
			  FLAG <= 0;
			  
			  if (BCD0 == 4'b1001) // if it is 9??
			    begin
				   BCD0 <= 0;
					
					if (BCD1 == 4'b1001) // if it is 9??
					  BCD1 <= 0;
					else 
					  BCD1 <= BCD1 + 1;
				  end
				
				else
				  BCD0 <= BCD0 + 1;
					 
			
			end

      else if (state == 3) // display state
		   begin
			  LED[9:0] <= 10'b1010101010;
			  BCD0 <= BCD0;
			  BCD1 <= BCD1;
			  k <= 0;
			  myRand <= myRand;
			  FLAG <= 0;
			end

      else // used to identify a wrong state
		   begin
			  LED[9:0] <= 10'b1100000011;
			  BCD0 <= 4'b1000;
			  BCD1 <= 4'b1000;
			  k <= 0;
			  myRand <= myRand;
			  FLAG <= 0;
			end
		
	 end
	 
	 

  assign LEDn = LED;
  // get values for updating 7 seg display and use wires to send out
  seg7 seg1(BCD1, Digit1);
  seg7 seg0(BCD0, Digit0);

endmodule 