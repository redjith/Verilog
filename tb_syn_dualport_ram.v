module tb_syn_dual_portram();

    parameter WIDTH = 8;
    parameter DEPTH = 16;
    parameter ADDR_SIZE = 4;
    parameter CYCLE = 10;

    reg clk, we, re, reset;                
    reg [ADDR_SIZE-1:0] we_addr, rd_addr;   // Address bus
    reg [WIDTH-1:0] din;   // Data input bus
    wire [WIDTH-1:0] dout;
    integer k;

    // Instantiation
    dual_port_ram_syn DUT(clk, we, re, reset, we_addr, rd_addr, din, dout);

    // Clock generation
    always begin
        #(CYCLE/2) clk = 1'b0;
        #(CYCLE/2) clk = 1'b1;
    end

    task initialize();
    begin
        {we, re, we_addr, rd_addr, din, reset} = 0;
    end
    endtask

    task reset_t();
    begin
        @(negedge clk)
        reset = 1'b1;
        @(negedge clk)
        reset = 1'b0;
    end
    endtask

    task write(input [WIDTH-1:0] data, input [ADDR_SIZE-1:0] addr);
    begin
        @(negedge clk)
        we = 1'b1;
        re = 1'b0;
        din = data;
        we_addr = addr;
    end
    endtask

    task read(input [ADDR_SIZE-1:0] addr);
    begin
        @(negedge clk)
        we = 1'b0;
        re = 1'b1; 
	   rd_addr = addr;
    end
    endtask

    task delay(input integer cycles);
    begin
        repeat(cycles) @(negedge clk);
    end
    endtask

    initial begin
        initialize;
        reset_t;
        delay(1);

        // Write operation
        for (k = 0; k < DEPTH; k = k + 1) begin
            write(k, k);
            delay(1); // Wait a clock cycle to simulate realistic timing
        end
        we_addr = 4'h0;
        // Read operation
        for (k = 0; k < DEPTH; k = k + 1) begin
            read(k);
            delay(1); // Wait a clock cycle to simulate realistic timing
        end
    end
	
	initial #500 $finish;

    initial $monitor("Time=%0t | clk=%b, we=%b, re=%b, reset=%b, rd_addr=%b, we_addr=%b, din=%b, dout = %b", 
                      $time, clk, we, re, reset, rd_addr, we_addr, din, dout);

endmodule
