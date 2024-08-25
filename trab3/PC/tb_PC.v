`include "PC.v"

module tb_PC;

    reg [15:0] in;      // Entrada de 16 bits
    reg reset;          // Sinal de reset
    reg load;           // Sinal de load
    reg inc;            // Sinal de incremento
    reg clk;          // Sinal de clock
    wire [15:0] out;    // Saída de 16 bits

    PC uut (
        .in(in),
        .reset(reset),
        .load(load),
        .inc(inc),
        .clk(clk),
        .out(out)
    );
    // Testes
    initial begin
        $display("Testando o módulo PC");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_PC);

        clk = 0;
        reset = 1; 
        load = 0; 
        inc = 0; 
        in = 16'b0;

        #10 reset = 0;

        
        #10 in = 16'hA5A5; load = 1;
        #10 load = 0;

        #10 inc = 1;
        #10 inc = 0;

        #10 reset = 1;
        #10 reset = 0;

        #10 in = 16'hFFFF; load = 1;
        #10 load = 0; inc = 1;
        #10 inc = 0;

        $finish;
    end

    
    always 
        #5 clk = ~clk;
endmodule
