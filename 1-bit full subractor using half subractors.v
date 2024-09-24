// RTL for a 1bit full subtactor using half subractor

module fl-sub(A,B,C,BR,DIFF);

input A,B,C;
output BR,DIFF;
wire w1,w2,w3;

// INSTANTIATION

half_sub s1(.a(A), .b(B), .d(w1), .b(w2));
half_sub s2(.a(w1), .b(c), .d(DIFF), .b(w3));
or ( BR,w2,w3);

 endmodule
 
 module half_sub(a,b,d,b);
 
 input a,b;
 output d,b;
 
 assign d = a^b;
 assign b = ~a&b;
 
 endmodule