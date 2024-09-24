module bi_buf(input cntrl, inout a,b);

bufif1 m1(b,a,cntrl);
bufif0 m2(a,b,cntrl);

endmodule