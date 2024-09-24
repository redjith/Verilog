module decoder3_8_tb;

    // Step 1: Declare variables required for testbench
    reg [2:0] A;        // 3-bit input to the decoder
    wire [7:0] Y;       // 8-bit output from the decoder

    // Step 2: Instantiate the Design Under Test (DUT)
    decoder3_8 DUT (
        .a(A),
        .y(Y)
    );

    // Step 3: Declare a task to initialize inputs to the DUT
    task initialize;
        begin
            A = 3'b000; // Initialize A to 0
        end
    endtask

    // Step 4: Declare a task to apply stimulus (inputs) to the DUT
    task apply_input(input [2:0] in);
        begin
            A = in;
            #10; // Wait for 10 time units after applying the input
        end
    endtask

    // Step 5: Use the tasks in an initial block to create the test cases
    initial begin
        // Initialize the inputs
        initialize;

        // Apply stimulus for each possible value of A
        apply_input(3'b000);  // A = 000
        apply_input(3'b001);  // A = 001
        apply_input(3'b010);  // A = 010
        apply_input(3'b011);  // A = 011
        apply_input(3'b100);  // A = 100
        apply_input(3'b101);  // A = 101
        apply_input(3'b110);  // A = 110
        apply_input(3'b111);  // A = 111

        // Finish the simulation
        #10 $finish;
    end

    // Step 6: Use $monitor to display inputs and outputs during simulation
    initial
        $monitor("At time %t: A = %b, Y = %b", $time, A, Y);


endmodule
