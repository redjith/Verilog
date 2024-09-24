module tb_jk_ff;

// Parameter overrides for the testbench
parameter HOLD = 1'b0;
parameter TOGGLE = 1'b1;
parameter SET = 1'b1;
parameter RESET = 1'b0;
parameter clock = 10;

// Testbench signals
reg J, K, clk, rst_n;
wire Q;

// Instantiate the JK Flip-Flop
jk_ff #(HOLD, TOGGLE, SET, RESET) uut (
    .J(J),
    .K(K),
    .clk(clk),
    .rst_n(rst_n),
    .Q(Q)
);

// Clock generation
always 
begin
#(clock/2);
clk = 1'b0;
#(clock/2);
clk = ~clk;
end

task reset();
begin
@(negedge clk);
rst_n = 1'b1;
@(negedge clk);
rst_n = 1'b0;
end
endtask
 

// Test sequence
 /*initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    J = 0;
    K = 0;

    // Apply reset
    #10 rst_n = 1;
    
    // Test the JK Flip-Flop behavior
    // Test Hold condition (J = 0, K = 0)
    #10 J = 0; K = 0;
    
    // Test Reset condition (J = 0, K = 1)
    #10 J = 0; K = 1;
    
    // Test Set condition (J = 1, K = 0)
    #10 J = 1; K = 0;
    
    // Test Toggle condition (J = 1, K = 1)
    #10 J = 1; K = 1;
    
    // Finish simulation
    #20 $finish;
end */

task apply_inputs(input m,n);
begin
@(negedge clk);
J=m;
@(negedge clk);
K=n;
end
endtask

initial
begin
reset;
apply_inputs(0,0);
apply_inputs(0,1);
reset;
apply_inputs(1,0);
apply_inputs(1,1);
#10;
end


initial #500 $finish;

// Monitor the output
initial begin
    $monitor("At time %t, J = %b, K = %b, Q = %b", $time, J, K, Q);
end

endmodule
