module mux8way16 (
    input [15:0] i0, 
    input [15:0] i1, 
    input [15:0] i2, 
    input [15:0] i3,
    input [15:0] i4, 
    input [15:0] i5, 
    input [15:0] i6,
    input [15:0] i7,
    input [2:0] sel,  
    output reg [15:0] out 
);

    always @(*) begin
        case(sel)
            3'b000: out = i0; 
            3'b001: out = i1;
            3'b010: out = i2; 
            3'b011: out = i3;
            3'b100: out = i4; 
            3'b101: out = i5;
            3'b110: out = i6; 
            3'b111: out = i7; 
            default: out = 16'b0;
        endcase
    end
endmodule
