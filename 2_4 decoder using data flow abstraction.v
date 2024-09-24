// 2:4 decodering modelling using dataflow abstraction

module decoder ( input [1:0]x, output [3:0]y);

assign y[0] = !x[0]& !x[1];
assign y[1] = !x[0]& x[1];
assign y[2] = x[0]& !x[1];
assign y[2] = x[0]& x[1];

endmodule 

[ x0  x1 ]
  0    0
  0    1
  1    0
  1    1