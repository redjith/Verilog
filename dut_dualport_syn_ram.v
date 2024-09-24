module dual_port_ram_syn(clk_in, we, re, reset, we_addr, rd_addr, din, dout);
    
     parameter WIDTH = 8;
     parameter DEPTH = 16;
     parameter ADDR_SIZE = 4;

     input clk_in, we, re, reset;                
     input  [ADDR_SIZE-1:0] we_addr, rd_addr;  
     input  [WIDTH-1:0] din;  
     output reg [WIDTH-1:0] dout;

     reg [WIDTH-1:0] mem [DEPTH-1:0];  
     reg clk_gated;
	 integer i;

     // Simple clock gating
     always @(posedge clk_in) begin
         if (reset) begin
             clk_gated <= 0;
         end else begin
             clk_gated <= we | re; // Enable clock only when reading or writing
         end
     end

     // Synchronous read and write operations
     always @(posedge clk_gated) begin
         if (reset) begin
             dout <= 8'h00;
             for (i = 0; i < DEPTH; i = i + 1) begin
                 mem[i] <= 0;
             end
         end else begin
             if (we && ~re) begin
                 mem[we_addr] <= din;
             end 
             if (re && ~we) begin
                 dout <= mem[rd_addr];
             end
         end
     end
endmodule
