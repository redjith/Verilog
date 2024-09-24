module test();

int k, q[$] = '{1,2,3,4,5,6};

initial

begin 
foreach (q[i])
begin
k = q.pop_back();

$display ("%d",k);
end
$display ("%p",q);
end 

endmodule