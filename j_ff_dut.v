module jk_ff #(
    parameter HOLD = 1'b0,
    parameter TOGGLE = 1'b1,
    parameter SET = 1'b1,
    parameter RESET = 1'b0
) (
    input J,
    input K,
    input clk,
    input rst_n,
    output reg Q
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Q <= RESET;
    end else begin
        case ({J, K})
            2'b00: Q <= Q;       // Hold state
            2'b01: Q <= RESET;   // Reset state
            2'b10: Q <= SET;     // Set state
            2'b11: Q <= ~Q;      // Toggle state
            default: Q <= HOLD;  // Default hold
        endcase
    end
end

endmodule
