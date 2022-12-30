module behavioral(X, Fstate);

   input [1:4] X;

   output Fstate;

   wire [0:1] ANDout;
   wire [0:1] ORout;

   assign Fstate = (~X[1]|(X[2]&~X[3]))&((~X[3]|X[4])&~X[3]&X[1]);


endmodule
