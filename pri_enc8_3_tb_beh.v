module pri_enc8_3_tb();
reg [7:0]I;
wire [2:0]Y;
wire out_en;

// instantiation

pri_enc8_3 DUT(.I(I), .Y(Y), .out_en(out_en));

task initialize();
begin
I=8'b00000000;
end
endtask

task inputs(input[7:0]m);
begin
I=m;
end
endtask

initial
begin
initialize;
#10
inputs(8'b00010000);
#10
inputs (8'b01000000);
#10
inputs (8'b00001000);
end

initial
        $monitor("At time %t: I = %b, Y = %b", $time, I, Y);
		
		initial #1000 $finish;
		
endmodule

