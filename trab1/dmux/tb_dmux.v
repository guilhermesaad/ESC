//
// Test bench para Demultiplexador de 2 entradas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "dmux.v"

module tb_dmux;
  
  // inputs
  reg in_entrada;
  reg in_sel;
  // outputs
  wire out_o0;
  wire out_o1;

  // Instancia da UUT (Unit Under Test)
  dmux uut (.entrada(in_entrada), .sel(in_sel), .o0(out_o0), .o1(out_o1));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para Demultiplexador de duas entradas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dmux);

    # 0 in_entrada = 1; in_sel = 1; 
    # 10 in_entrada = 1; in_sel = 0;
    # 10 in_entrada = 0; in_sel = 1; 
    # 10 in_entrada = 0; in_sel = 0; 

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \tentrada=%d,sel=%d,o0=%d,o1=%d \n",$time,in_entrada,in_sel,out_o0,out_o1);
  end

endmodule

