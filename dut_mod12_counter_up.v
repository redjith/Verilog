module mod12_sync_loadable_counter(
    input clk,          // Clock signal
    input reset,        // Synchronous reset signal
    input load,         // Load enable signal
    input [3:0] data,   // 4-bit data input for loading
    output reg [3:0] Q  // 4-bit counter output
);

// Always block triggered on the rising edge of the clock
always @(posedge clk)
begin
    if (reset) begin
        Q <= 4'b0000;  // Synchronous reset, sets counter to 0
    end
    else if (load) begin
        Q <= data;     // Load operation, load the input data into the counter
    end
    else begin
	if (Q >= 12) begin
	Q = 4'b0000;
	end
	else begin
      Q <= Q + 1;    // Up-count operation, increment the counter by 1
    end
	end
end



endmodule
