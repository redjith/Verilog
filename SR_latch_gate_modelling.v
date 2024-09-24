module SR_latch(S,R,Q,Qb);
input S,R;
output Q,Qb;

wire w1,w2;

nor m1(Q,R,w1);
nor m2(Qb,S,w2);

assign w1=Qb;
assign w2=Q;

endmodule