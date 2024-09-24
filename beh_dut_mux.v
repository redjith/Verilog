module mux4_1(a,b,c,d,s0,s1,y);
input a,b,c,d;
input s0,s1;
output reg y;

always@*
begin

case({s0,s1})
00 : y=a;
01 : y=b;
10 : y=c;
11 : y=d;
default : y=0;

endcase
end

endmodule