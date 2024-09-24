module tb_mod12_upcounter_tb();
    reg clk, rst, load;
    reg [3:0] din;
    wire [3:0] dout;

    // Instantiation of the counter module
    mod12_sync_loadable_counter dut(clk, rst, load, din, dout);

    initial begin
        clk = 0;
        rst = 0;    // Initialize reset to inactive
        load = 0;   // Initialize load to inactive
        din = 0;    // Initialize data input to 0
    end

    // Clock generation
    always begin
        #10 clk = ~clk;
    end

    // Synchronous reset task
    task reset();
    begin
        @(negedge clk)
        rst = 1'b1;
        @(negedge clk)
        rst = 1'b0; // Deactivate reset after one clock cycle
    end
    endtask

    // Task to apply inputs and load the counter
    task apply_inputs(input [3:0] count);
    begin
        @(negedge clk)
        din = count;
        load = 1'b1;   // Assert load to load the value into the counter
        @(negedge clk)
        load = 1'b0;   // Deactivate load
    end
    endtask

    initial begin
        reset();               // Reset the counter
        apply_inputs(4'b0011); // Load the value 3
        #20;                   // Wait to see counting behavior
        apply_inputs(4'b1110); // Load the value 10
        #20;                   // Wait to see counting behavior
        reset();               // Reset the counter again
        #100;                  // Wait for some clock cycles
    end

    // Monitor the inputs and outputs
    initial $monitor("Time=%0t | clk=%b, rst=%b, load=%b, din=%b | dout=%b", 
                     $time, clk, rst, load, din, dout);

    initial #500 $finish;

endmodule
