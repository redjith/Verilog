module tff_dff(T, clk, reset, Q);
input T, clk, reset;
output reg Q;
reg D;

always @(posedge clk or posedge reset)
begin
    if (reset) begin
        Q <= 1'b0;
    end else begin
        Q <= D;
    end
end

always @*
begin
    if (T) begin
        D = ~Q;
    end else begin
        D = Q;
    end
end

endmodule