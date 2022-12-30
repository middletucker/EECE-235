module structuralNEW1(X, Fstate);

   input [1:4] X;

   output Fstate;

   
   

   and(Fstate, X[1], X[2], ~X[3]);
  




endmodule
