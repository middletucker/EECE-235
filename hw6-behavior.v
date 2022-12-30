// HW6 Behavoral Code
// Question 1
//Lillian Tucker, EECE 235

module hw6_behavior(F_min, F_max, W,X,Y,Z) ;

  input W,X,Y,Z ; //HIGH if entry is open
  output F_min, F_max ; //Alarms when HIGH

  assign F_min = (Y & ~W) | (~X & ~Y) | (W & X & Z) ; //minterm

  assign F_max = ( W | ~X | Y ) & ( ~W | ~X | Z ) & ( ~W | X | ~Y ) ; //maxterm

endmodule
