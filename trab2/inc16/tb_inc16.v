`include "inc16.v"

module tb_inc16;

    // Sinais de entrada e saída
    reg [15:0] in_in;
    wire [15:0] out_out;

    // Instancia o módulo incrementer_16bit
    inc16 uut (.in(in_in), .out(out_out));

    // Inicialização dos sinais
    initial begin

        $display("Testbench para inc 16 bit");
        $dumpfile("signals.vcd");
        $dumpvars(0);
        
        in_in = 16'b0000_0000_0000_0000; #10;
        in_in = 16'b1111_1111_1111_1111; #10;
        in_in = 16'b0000_0001_0000_0000; #10;
        in_in = 16'b1001_0110_1100_0011; #10;

        // Finaliza a simulação
        $finish;
    end

    initial begin
        $monitor("t=%03d: \t in = %b B = %b out = %b", $time, in_in, out_out);
    end

endmodule
