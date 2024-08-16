//
// Test bench para multiplexador de 8 entradas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "mux8way16.v"

module tb_mux8way16;
    reg [15:0] in_i0, in_i1, in_i2, in_i3, in_i4, in_i5, in_i6, in_i7;
    reg [2:0] sel;
    wire [15:0] out;
    
    // Instancia o mux4way16
    mux8way16 uut (
        .i0(in_i0),
        .i1(in_i1),
        .i2(in_i2),
        .i3(in_i3),
        .i4(in_i4),
        .i5(in_i5),
        .i6(in_i6),
        .i7(in_i7),
        .sel(sel),
        .out(out)
    );
    
    initial begin
        $display("Testbench para multiplexador de 8 entradas 16bit");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_mux8way16);
        // Inicializa as entradas
        in_i0 = 16'hAAAA;
        in_i1 = 16'hBBBB;
        in_i2 = 16'hCCCC;
        in_i3 = 16'hDDDD;
        in_i4 = 16'h0001;
        in_i5 = 16'h0010;
        in_i6 = 16'h0100;
        in_i7 = 16'h1000;

        sel = 3'b000;

        #10 sel = 3'b001;
        #10 sel = 3'b010;
        #10 sel = 3'b011;
        #10 sel = 3'b100;
        #10 sel = 3'b101;
        #10 sel = 3'b110;
        #10 sel = 3'b111;
        
        // Finaliza a simulação
        #10 $finish;
    end
    
    initial begin
        $monitor("t= %03d, sel = %b, out = %h", $time, sel, out);
    end
endmodule
