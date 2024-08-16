//
// Test bench para Demultiplexador de 8 entradas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "dmux8way.v"

module tb_dmux8way;
  
  // inputs
  reg [3:0]in_entrada;
  reg [2:0]in_sel;
  // outputs
  wire out_o0;
  wire out_o1;
  wire out_o2;
  wire out_o3;
  wire out_o4;
  wire out_o5;
  wire out_o6;
  wire out_o7;

  // Instancia da UUT (Unit Under Test)
  dmux8way uut (
    .entrada(in_entrada), 
    .sel(in_sel), 
    .o0(out_o0), 
    .o1(out_o1),
    .o2(out_o2),
    .o3(out_o3),
    .o4(out_o4), 
    .o5(out_o5),
    .o6(out_o6),
    .o7(out_o7)
    );

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para Demultiplexador de duas entradas 8 way");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dmux8way);

    # 0 in_entrada = 4'b0001; in_sel = 3'b000;
    # 10 in_entrada = 4'b0001; in_sel = 3'b001; 
    # 10 in_entrada = 4'b0001; in_sel = 3'b010;
    # 10 in_entrada = 4'b0001; in_sel = 3'b011; 
    # 10 in_entrada = 4'b0001; in_sel = 3'b100;
    # 10 in_entrada = 4'b0001; in_sel = 3'b101; 
    # 10 in_entrada = 4'b0001; in_sel = 3'b110;
    # 10 in_entrada = 4'b0001; in_sel = 3'b111; 
    



    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor(
        "t=%03d: \tentrada=%d,sel=%d,o0=%d,o1=%d,o2=%d,o3=%d,o4=%d,o5=%d,o6=%d,o7=%d \n",
        $time,in_entrada,in_sel,
        out_o0,
        out_o1,
        out_o2,
        out_o3,
        out_o4,
        out_o5,
        out_o6,
        out_o7
    );
  end

endmodule

