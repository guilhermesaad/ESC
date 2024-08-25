`include "DFF_sem_rst.v"
`include "mux.v"

module Bit(input in1, input load, input clk, output reg out);

    wire q;
    wire qn;
    wire mux_out;

    // Instanciando o mux
    mux aux_mux(q, in1, load, mux_out);

    // Instanciando o flip-flop
    DFF_sem_rst dff(mux_out, clk, q, qn); 

    // Atualizando o valor de out
    always @ (posedge clk) begin
        out <= q;
    end

endmodule
