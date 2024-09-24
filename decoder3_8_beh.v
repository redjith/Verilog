module decoder3_8 (
    input[2:0] a,  // 3-bit input
    output reg  [7:0] y   // 8-bit output
);

    // Behavioral description using an always block
    always @(*) begin
        // Initialize all outputs to 0
        y = 8'b00000000;
        
        // Decode the input and set the corresponding output bit
        case (a)
            3'b000: y[0] = 1;  // When a = 000, y0 = 1
            3'b001: y[1] = 1;  // When a = 001, y1 = 1
            3'b010: y[2] = 1;  // When a = 010, y2 = 1
            3'b011: y[3] = 1;  // When a = 011, y3 = 1
            3'b100: y[4] = 1;  // When a = 100, y4 = 1
            3'b101: y[5] = 1;  // When a = 101, y5 = 1
            3'b110: y[6] = 1;  // When a = 110, y6 = 1
            3'b111: y[7] = 1;  // When a = 111, y7 = 1
            default: y = 8'b00000000;  // Default case (should not occur)
        endcase
    end

endmodule
