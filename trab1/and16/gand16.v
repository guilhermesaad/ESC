//
// Porta AND combinacional 16bit
//
module gand16(input[15:0]a, input[15:0]b, output[15:0]y);

    assign y = a & b;

endmodule
