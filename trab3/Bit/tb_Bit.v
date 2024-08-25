// módulos usados
`include "Bit.v"

module tb_Bit;
  
  // clock simulado
  reg clk;

  // sinais
  reg in1;
  reg load;
  wire out;
  
  // Instância da UUT (Unit Under Test)
  Bit uut (
    in1, 
    load, 
    clk, 
    out
  );

  // Como os sinais irão variar durante a simulação
  initial begin
    $display("Testando o módulo Bit");
    $dumpfile("signals.vcd");
    $dumpvars(0, tb_Bit);
    
    // Inicialização dos sinais
    clk = 0;
    in1 = 0;
    load = 0;

    // Sequência de teste
    #2 in1 = 1; load = 1; // Carrega '1' no registrador
    #2 load = 0;          // Desativa o carregamento
    #2 in1 = 0;           // Muda o valor de in1, mas sem carregar
    #2 load = 1;          // Carrega '0' no registrador
    #2 load = 0;
    #2 in1 = 1; load = 1; // Carrega '1' novamente
    #2 load = 0;

    #5 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("Tempo = %0t | clk = %b | load = %b | in1 = %b | out = %b", $time, clk, load, in1, out);
  end

  // Gerador de clock com bloco always de única linha
  always 
    #1 clk = ~clk;

endmodule
