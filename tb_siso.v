module tb_siso();
    reg clk, rst;
    reg [3:0] s_in_array; // Array to hold the 4-bit input sequence
    reg s_in;
    wire s_out;

    integer i; // Loop variable

    // Instantiate the DUT (Device Under Test)
    shift_register_logical dut(clk, rst, s_in, s_out); // Assuming this is a 4-bit SISO shift register

    // Clock generation: toggles every 10 time units
    always begin
        #10 clk = ~clk;
    end

    // Task to initialize signals
    task initialize();
    begin
        clk = 0;
        rst = 0;
        s_in = 0;
        s_in_array = 4'b1010; // Example input sequence
    end
    endtask

    // Task to apply reset
    task reset();
    begin
        @(negedge clk); // Wait for a negative edge of the clock
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0; // Clear reset on the next clock edge
    end
    endtask

    // Task to apply serial input
    task apply_input(input [3:0] sin_array);
    begin
        for (i = 3; i >= 0; i = i - 1) begin
            @(negedge clk); // Wait for a negative edge of the clock
            s_in = sin_array[i];
            $display("Applying bit %b to SISO at time = %0t", sin_array[i], $time); // Show which bit is applied
        end
    end
    endtask

    // Initial block to run the simulation
    initial begin
        initialize();      // Initialize the signals
        reset();           // Apply reset
        apply_input(s_in_array); // Apply the entire 4-bit sequence
        #50;               // Wait to observe the outputs
    end

    // Monitor signals
    initial begin
        $monitor("time = %0t | clk = %b | rst = %b | s_in = %b | s_out = %b", 
                  $time, clk, rst, s_in, s_out);
    end

    // End the simulation after 200 time units
    initial #200 $finish;

endmodule
