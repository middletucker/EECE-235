

module structural(X, Fstate);

   input [1:4] X;

   output Fstate;

   wire [0:1] ANDout;
   wire [0:1] ORout;

   and(ANDout[0], X[2], ~X[3]);
   or(ORout[0], ~X[3], X[4]);
   or(ORout[1], ~X[1], ANDout[0]);
   and(ANDout[1], X[1], ~X[3], ORout[0]);
   and(Fstate, ORout[1], ANDout[1]);




endmodule