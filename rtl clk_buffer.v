module clock_buffer(
    input wire clk_in,   // Input clock signal
    output wire clk_out  // Buffered output clock signal
);

    // Using the Verilog buffer primitive
    buf buffer_inst (
        clk_out,  // Output port
        clk_in    // Input port
    );

endmodule
