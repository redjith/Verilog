module tb_tff();
reg clk, rst, T;
wire Q;

// Instantiate the T Flip-Flop module
tff_dff DUT(T, clk, rst, Q);

initial begin
    clk = 0;
    rst = 1;
end

always
begin
    #10 clk = ~clk;
end

task reset();
begin
    @(negedge clk)
    rst = 1'b0;
    @(negedge clk)
    rst = 1'b1;
end
endtask

task apply_inputs(input t);
begin
    @(negedge clk)
    T = t;
end
endtask

initial
begin
    reset;
    apply_inputs(1'b1);
    apply_inputs(1'b0);
    apply_inputs(1'b1);
    reset;
    apply_inputs(1'b0);
    apply_inputs(1'b1);
    #20;  // Add some delay before finishing simulation
end

initial $monitor("Time=%0t | clk=%b, rst=%b, T=%b | Q=%b", $time, clk, rst, T, Q);

initial #1000 $finish;
endmodule
