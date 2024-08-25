module PC(
    input [15:0] in,      
    input        reset,   
    input        load,    
    input        inc,     
    input        clk,   
    output reg [15:0] out      
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            out <= 16'b0;               // Reseta o contador para 0
        end else if (load) begin
            out <= in;                  // Carrega o valor da entrada 'in'
        end else if (inc) begin
            out <= out + 16'b1;         // Incrementa o contador
        end
    end

endmodule
