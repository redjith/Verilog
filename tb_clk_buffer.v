module tb_clk_buf();
  reg clk_in;
  wire clk_out;
  time t1, t2, t3; // Declare t1, t2, t3 as time type for time calculations

  // Instantiate the clock buffer
  clock_buffer dut (
    .clk_in(clk_in),
    .clk_out(clk_out)
  );

  // Task to initialize signals
  task initialize;
  begin
    {clk_in, t1, t2, t3} = 0;
  end
  endtask

  // Clock generation
  always begin
    #10 clk_in = ~clk_in;
  end

  // Task to measure frequency (time between two rising edges)
  task freq();
  begin
    @(posedge clk_in)
    t1 = $time; // Capture time at posedge of clk_in
    @(posedge clk_in)
    t2 = $time; // Capture time at next posedge of clk_in
    t3 = t2 - t1; // Calculate period
    $display("Clock Period: %0d ns", t3);
    $display("Clock Frequency: %0d Hz", 1000000000 / t3); // Assuming time unit is in ns
  end
  endtask

  // Task to measure phase difference between input and output clocks
  task phase();
  begin
    @(posedge clk_in)
    t1 = $time; // Capture time at posedge of clk_in
    @(posedge clk_out)
    t2 = $time; // Capture time at posedge of clk_out
    t3 = t2 - t1; // Calculate phase difference
    $display("Phase Difference: %0d ns", t3);
  end
  endtask
  
  task freq_output();
  begin
    @(posedge clk_out)
    t1 = $time; // Capture time at posedge of clk_out
    @(posedge clk_out)
    t2 = $time; // Capture time at next posedge of clk_out
    t3 = t2 - t1; // Calculate period
    $display("Output Clock Period: %0d ns", t3);
    $display("Output Clock Frequency: %0d Hz", 1000000000 / t3); // Assuming time unit is in ns
  end
  endtask


initial begin
    initialize; // Initialize signals
    #20; // Wait for a few clock cycles
    freq; // Measure input clock frequency
    #20; // Wait for a few clock cycles
    freq_output(); // Measure output clock frequency
    phase; // Measure phase difference
    #100; // Run simulation for a while
    $finish; // End simulation
end

endmodule
