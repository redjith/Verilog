module mux4_1_decoder_tri(input [1:0] s, input [3:0] datain, output y);
   
   wire [3:0] bufin;
    
    // Instantiation of decoder
    decoder2_4 m1(.A(s), .E(1'b1), .Y(bufin)); // Fixed instantiation and enable signal [ this is how you need to tackle the enable signals in structural modelling ]
    
    // Tri-state buffers
    bufif1 buf1(y, datain[0], bufin[0]);
    bufif1 buf2(y, datain[1], bufin[1]);
    bufif1 buf3(y, datain[2], bufin[2]); 
    bufif1 buf4(y, datain[3], bufin[3]);

endmodule
