module strings()
reg [8*30:0]string;

initial
begin
string = "hello verilog world";

$display = ("%s\n", string)

end
endmodule