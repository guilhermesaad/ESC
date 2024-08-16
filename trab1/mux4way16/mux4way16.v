//
// Multiplexador de 4 entradas (16 bit), comportamental
//

module mux4way16 (
    input [15:0] i0, 
    input [15:0] i1, 
    input [15:0] i2, 
    input [15:0] i3, 
    input [1:0] sel,  
    output reg [15:0] out 
);

    always @(*) begin
        case(sel)
            2'b00: out = i0; 
            2'b01: out = i1;
            2'b10: out = i2; 
            2'b11: out = i3; 
            default: out = 16'b0;
        endcase
    end
endmodule
