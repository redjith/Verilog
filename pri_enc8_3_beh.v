module pri_enc8_3(I, Y, out_en);
input [7:0] I;
output reg [2:0] Y;
output reg out_en;

always @* 
begin
    Y = 3'b000;        // Default value
    out_en = 1'b0;     // Default value

    if (I[7] == 1'b1) 
	begin
        Y = 3'b111;
        out_en = 1'b1;
    end
    else if (I[6] == 1'b1)
	begin
        Y = 3'b110;
        out_en = 1'b1;
    end
    else if (I[5] == 1'b1)
	begin
        Y = 3'b101;
        out_en = 1'b1;
    end
    else if (I[4] == 1'b1) 
	begin
        Y = 3'b100;
        out_en = 1'b1;
    end
    else if (I[3] == 1'b1) 
	begin
        Y = 3'b011;
        out_en = 1'b1;
    end
    else if (I[2] == 1'b1) 
	begin
        Y = 3'b010;
        out_en = 1'b1;
    end
    else if (I[1] == 1'b1)
	begin
        Y = 3'b001;
        out_en = 1'b1;
    end
    else if (I[0] == 1'b1) 
	begin
        Y = 3'b000;
        out_en = 1'b1;
    end
    else 
	begin
        Y = 3'bzzz;    // High impedance when no input is active
        out_en = 1'b0;
    end
end

endmodule
