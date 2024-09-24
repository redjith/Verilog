module muxtb4_1();
reg a,b,c,d,s0,s1;
wire y;

integer i,j;

// instantiation
mux4_1 DUT(a,b,c,d,s0,s1,y);

task initialize();
begin
{a,b,c,d,s0,s1} = 0;
end
endtask

task inputs(m,n,o,p);
begin
a=m;
b=n;
c=o;
d=p;
end
endtask

task select(q,r);
begin
s0=q;
s1=r;
end
endtask

task delay();
begin
#10
end
endtask

initial
begin
initialize;
for (i=0;i<16;i=i+1)
begin
for (j=0;j<4;j=j+1)
begin
inputs(i);
select(j);
delay;
end
end
end

 initial 
      $monitor("Input a=%b, b=%b, c=%b,d=%b, s0=%b, s1=%b Output y=%b",a,b,c,d,s0,s1,y);
	  
	  initial
	  #1000
	  $finish
	  
	  endmodule