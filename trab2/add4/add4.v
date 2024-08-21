//
// Somador completo de 4 bit reusando o fulladder
//

`include "fulladder.v"

module add4 (
    input [3:0] A,    
    input [3:0] B,    
    input Cin,        
    output [3:0] Sum, 
    output Cout       
);

    wire C1, C2, C3;


    fulladder fa0 (
        A[0],
        B[0],
        Cin,
        Sum[0],
        C1
    );

    fulladder fa1 (
        A[1],
        B[1],
        C1,
        Sum[1],
        C2
    );

    fulladder fa2 (
        A[2],
        B[2],
        C2,
        Sum[2],
        C3
    );

    fulladder fa3 (
        A[3],
        B[3],
        C3,
        Sum[3],
        Cout
    );

endmodule