// gatelevel 2:1 mux

module mux( a,b,s,y);

input a,b;

input s;

output y;

assign y = (!s&a) | (s&b);

endmodule