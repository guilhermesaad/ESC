//
// Multiplexador de duas entradas (1 bit), comportamental
//
module dmux(
    input wire entrada,
    input wire sel,
    output reg o0, output reg o1    
);

    /* Nn pode fazer assim, pq?
    assign o1 = sel? entrada : 0;
    assign o2 = sel? 0 : entrada;
    */

    always @(*) begin
        o0 = 0;
        o1 = 0;

        case(sel)
            1'b0 : o0 = entrada;
            1'b1 : o1 = entrada;
        endcase
    end
endmodule