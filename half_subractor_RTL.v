

// dataflow abstraction for a half subtractor
module half_subractor (A,B,difference,borrow)
input A,B;
output difference, borrow;

assign difference = A^B;
assign borrow = !A & B;

endmodule