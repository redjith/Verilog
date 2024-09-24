// 4:1 mux using 2:1 mux

module mux_2_1(a,b,s,out);
input a,b,s;
output out;

assign out = s? b:a ;

endmodule
