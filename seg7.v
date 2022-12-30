

module seg7(bcd, leds);
  input [5:0] bcd;
  output reg [6:0] leds;
  
  always @(bcd)
    begin
	    case (bcd) //assumes active high
			0: leds = 7'b0001000;//a-r
			1: leds = 7'b0000001;//d
			2: leds = 7'b0110000;//e
			3: leds = 7'b0111110;//f
			4: leds = 7'b0100000;//g
			5: leds = 7'b0011000;//h		
			6: leds = 7'b0110000;//i
			7: leds = 7'b1110001;//l
			8: leds = 7'b0111001;//t
			9: leds = 7'b0010010;//z
			default: leds = 7'bx;
		 endcase 
     end

endmodule 