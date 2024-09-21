module shift_register_logical (
    input wire clk,          // Clock input
    input wire reset,        // Asynchronous reset input
    input wire serial_in,    // Serial data input
    output wire serial_out   // Serial data output
);

    reg [3:0] shift_reg;     // 4-bit shift register

    // Assign the serial output as the LSB of the shift register
    assign serial_out = shift_reg[0];

    // Always block for sequential logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;  // Clear the shift register on reset
        end else begin
            shift_reg <= {serial_in, shift_reg[3:1]}; // Right shift and insert serial_in at MSB
            // shift_reg <= shift_reg >> 1; // Logical right shift (alternate method)
            // shift_reg[3] <= serial_in;    // Assign serial_in to MSB
        end
    end

endmodule


/* module shift_register_nonblocking (
    input wire clk,          // Clock input
    input wire reset,        // Asynchronous reset input
    input wire serial_in,    // Serial data input
    output wire serial_out   // Serial data output
);

    reg [3:0] shift_reg;     // 4-bit shift register

    // Assign the serial output as the LSB of the shift register
    assign serial_out = shift_reg[0];

    // Always block for sequential logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;  // Clear the shift register on reset
        end else begin
            shift_reg[0] <= shift_reg[1]; // Shift LSB
            shift_reg[1] <= shift_reg[2]; // Shift next bit
            shift_reg[2] <= shift_reg[3]; // Shift next bit
            shift_reg[3] <= serial_in;    // Insert serial_in at MSB
        end
    end

endmodule */


