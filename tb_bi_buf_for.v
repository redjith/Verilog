module tb_bi_buf_for();

wire a,b;
reg cntrl;
reg temp_a, temp_b;
integer i;

// instantiation 
bi_buf m1(.cntrl(cntrl), .a(a), .b(b));

assign a = temp_a;
assign b = temp_b;

initial
begin
for (i=0; i<2**3; i=i+1)begin
{cntrl,temp_a,temp_b} = i;
#10;
end
end

initial
$monitor("time=%0t | inputs cntrl = %b, temp_a=%b, temp_b=%b | outputs a=%b b=%b" , $time, cntrl,temp_a,temp_b,a,b);

initial #1000 $finish;

endmodule
