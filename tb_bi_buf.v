module tb_bi_buf();

wire a,b;
reg cntrl;
reg temp_a, temp_b;

// instantiation 
bi_buf m1(.cntrl(cntrl), .a(a), .b(b));

assign a = temp_a;
assign b = temp_b;

initial
begin
cntrl = 1'b1; temp_a=1'b1; temp_b=1'bz;
#10
cntrl = 1'b0; temp_b=1'b1; temp_a=1'bz;
end

endmodule



