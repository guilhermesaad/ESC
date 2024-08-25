`include "DFF_sem_rst.v"
`include "mux16.v"

module Register(input [15:0] in1, input load, input clk, output reg [15:0] out);

    wire [15:0] q ;
    wire [15:0] qn ;
    wire [15:0] mux_out;

    // Instanciando o mux
    mux16 aux_mux(q, in1, load, mux_out);

    // Instanciando o flip-flop
    DFF_sem_rst dff(mux_out, clk, q, qn); 

    // Atualizando o valor de out
    always @ (posedge clk) begin
        out <= q;
    end

endmodule
