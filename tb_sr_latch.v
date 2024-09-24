module tb_sr_latch();
reg S,R;
wire Q,Qb;
integer i;
// instantiation
SR_latch DUT(S,R,Q,Qb);

initial
begin
{S,R}=0;
end

initial
begin
for (i=0;i<4;i=i+1)
begin
{S,R}=i;
#10;
end
end

initial $monitor ("time=%0t| inputs S=%b, R=%b | outputs Q=%b, Qb=%b", $time,S,R,Q,Qb);

initial #500 $finish;

endmodule