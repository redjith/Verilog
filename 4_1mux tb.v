module muxtb_4_1();
reg [3:0]x;
reg s0,s1;
wire out3;
integer i,j,k;

// instantiation

mux_4_1 m1( .x(x), .s0(s0), .s1(s1), .out2(out3) );

initial
begin 
x=0;
s0=0;
s1=0;
end

initial
begin
for (i=0; i<16; i=i+1)
begin
x=i;
for (j=0; j<2; j=j+1)
begin
s0=j;
for (k=0; k<2; k=k+1)
begin
s1=k;
#10;
end
end
end
end

initial
$monitor ("time=%0t | inputs x=%b, s0=%b, s1=%b| outputs out3 = %b", $time, x,s0,s1,out3);

initial #1000 $finish;


endmodule


