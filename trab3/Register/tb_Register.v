// módulos usados
`include "Register.v"

module tb_Register;
  
  // clock simulado
  reg clk;

  // sinais
  reg [15:0] in1;
  reg load;
  wire [15:0] out;
  
  // Instância da UUT (Unit Under Test)
  Register uut (
    in1, 
    load, 
    clk, 
    out
  );

  // Como os sinais irão variar durante a simulação
  initial begin
    $display("Testando o módulo Register");
    $dumpfile("signals.vcd");
    $dumpvars(0, tb_Register);
    
    // Inicialização dos sinais
    clk = 0;
    in1 = 0;
    load = 0;

    // Sequência de teste
    #2 in1 = 16'b0000000000000001;  load = 1;// Carrega '1' no registrador
    #2 load = 0;                             // Desativa o carregamento
    #2 in1 = 16'b0000000000000010;           // Muda o valor de in1, mas sem carregar
    #2 load = 1;                             // Carrega '2' no registrador
    #2 load = 0;
    #2 in1 = 16'hFFFF; load = 1; // Carrega '1' novamente
    #2 load = 0;

    #5 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("Tempo = %0t | clk = %b | load = %b | in1 = %b | out = %b", $time, clk, load, in1, out);
  end

  // Gerador de clock
  always 
    #1 clk = ~clk;

endmodule
