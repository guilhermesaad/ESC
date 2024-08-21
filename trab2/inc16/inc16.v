//
// Incremento de uma unidade de um número de 16bits
//

module inc16 (
    input [15:0] in,
    output [15:0] out
);

    assign out = in + 1;

endmodule
