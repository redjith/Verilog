module tb_mux4_1_decoder_tri();
    reg [1:0] A;
    reg [3:0] B;
    wire Y;

    integer i, j;

    // Instantiation
    mux4_1_decoder_tri m1(.s(A), .datain(B), .y(Y)); // Fixed instantiation

    initial begin
        A = 0;
        B = 0;
    end

    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            A = i;
            for (j = 0; j < 16; j = j + 1) begin 
                B = j;
                #10;
            end
        end
    end

    initial $monitor("time=%0t | inputs A=%b, B=%b | output Y=%b", $time, A, B, Y);

    initial #1000 $finish;

endmodule
