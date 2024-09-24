module decoder2_4(input [1:0] A, input E, output [3:0] Y);
    
	assign Y[0] = E & (~A[0] & ~A[1]);
    assign Y[1] = E & (~A[0] & A[1]);
    assign Y[2] = E & (A[0] & ~A[1]);
    assign Y[3] = E & (A[0] & A[1]);

endmodule
