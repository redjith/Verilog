module ripple_adder(A,B,cin,sum,cout);
input [3:0]A,B;
input cin;
output [3:0]sum;
output cout;

wire w1,w2,w3;

//instantiation

full_adder m1(.a(A[0]), .b(B[0]), .cin(cin), .sum(sum[0]), .cout(w1));
full_adder m2(.a(A[1]), .b(B[1]), .cin(w1), .sum(sum[1]), .cout(w2));
full_adder m3(.a(A[2]), .b(B[2]), .cin(w2), .sum(sum[2]), .cout(w3));
full_adder m4(.a(A[3]), .b(B[3]), .cin(w3), .sum(sum[3]), .cout(cout));

endmodule