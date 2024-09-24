
module mux_4_1(x,s0,s1,out2);

input [3:0]x;
input s1,s0;

output out2;

wire w1,w2;

// instantiation 

mux_2_1 m1(.a(x[0]), .b(x[1]), .s(s0), .out(w1));
mux_2_1 m12(.a(x[2]), .b(x[3]), .s(s0), .out(w2));
mux_2_1 m13(.a(x[w1]), .b(x[w2]), .s(s1), .out(out2));

endmodule