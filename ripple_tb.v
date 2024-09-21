module ripp_tb();
    reg [3:0] A, B;
    reg cin;
    wire [3:0] sum;
    wire cout;

    integer i, j, k;

    // Instantiate the ripple adder module
    ripple_adder m5 (
        .A(A),
        .B(B),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Initialize signals
    initial begin
        A = 0;
        B = 0;
        cin = 0;
    end

    // Generate all possible test cases
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            A = i;
            for (j = 0; j < 16; j = j + 1) begin
                B = j;
                for (k = 0; k < 2; k = k + 1) begin
                    cin = k;
                    #10; // Wait for 10 time units to observe the output
                end
            end
        end
    end

    // Monitor the changes in signals and display them
    initial begin
        $monitor("Time=%0t | Input A=%b, B=%b, cin=%b | Output sum=%b, cout=%b", $time, A, B, cin, sum, cout);
    end

    // Finish the simulation after a sufficient amount of time
    initial #1000 $finish; // Increased time to ensure all test cases are covered

endmodule
