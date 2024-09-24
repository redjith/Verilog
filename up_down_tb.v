module tb_up_down();
    reg clk, rst, load, mode_cntrl;
    reg [3:0] din;
    wire [3:0] dout;

    // Instantiation of the counter module
   up_down_sync_loadable_counter dut(clk, rst, load, mode_cntrl, din, dout);

    initial begin
        clk = 0;
        rst = 0;		// Initialize reset to inactive
 mode_cntrl = 0;
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
	
	task control(input c);
	begin
	@(negedge clk)
	mode_cntrl = c;
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
    reset();                     // Reset the counter
    control(1'b0);               // Set to down-counting mode
    apply_inputs(4'b0011);       // Load the value 3
    #40;                         // Wait to see down-counting behavior
    control(1'b1);               // Switch to up-counting mode
    apply_inputs(4'b1110);       // Load the value 14
    #40;                         // Wait to see up-counting behavior
    reset();                     // Reset the counter again
    #100;                        // Wait for some clock cycles
end


    // Monitor the inputs and outputs
    initial $monitor("Time=%0t | clk=%b, rst=%b, load=%b, din=%b, mode_cntrl=%b | dout=%b", 
                     $time, clk, rst, load, din, mode_cntrl, dout);

    initial #500 $finish;

endmodule
