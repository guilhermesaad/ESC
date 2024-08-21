//
// Somador completo de 16 bit 
//
`include "add4.v"

module add16(
    input [15:0] A,    
    input [15:0] B,    
    input Cin,        
    output [15:0] Sum, 
    output Cout  
);
    wire C1, C2, C3;

    add4 sum_0(
        A [3:0],    
        B [3:0] ,    
        Cin,        
        Sum [3:0], 
        C1
    );
    add4 sum_1(
        A[7:4],    
        B[7:4],    
        C1,        
        Sum [7:4], 
        C2
    );
    add4 sum_2(
        A[11:8],    
        B[11:8] ,    
        C2,        
        Sum[11:8], 
        C3
    );
    add4 sum_3(
        A[15:12] ,    
        B[15:12] ,    
        C3,        
        Sum[15:12], 
        Cout
    );


endmodule