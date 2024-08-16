//
// Test bench para multiplexador de 4 entradas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "mux4way16.v"

module tb_mux4way16;
    reg [15:0] i0, i1, i2, i3;
    reg [1:0] sel;
    wire [15:0] out;
    
    mux4way16 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .sel(sel),
        .out(out)
    );
    
    initial begin
        $display("Testbench para multiplexador de 4 entradas 16bit");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_mux4way16);
        
        i0 = 16'hAAAA;
        i1 = 16'hBBBB;
        i2 = 16'hCCCC;
        i3 = 16'hDDDD;
        sel = 2'b00;

        #10 sel = 2'b01;
        #10 sel = 2'b10;
        #10 sel = 2'b11;
        #10 sel = 2'b00;
        
        
        #10 $finish;
    end
    
    initial begin
        $monitor("t= %03d, sel = %b, out = %h", $time, sel, out);
    end
endmodule
