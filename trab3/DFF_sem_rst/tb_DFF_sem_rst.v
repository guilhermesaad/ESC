
// modulos usados
`include "DFF_sem_rst.v"

module tb_DFF_sem_rst;
  
  // clock simulado
  reg clk;

  // sinais
  reg d;
  wire q;
  wire qn;

  // Instancia da UUT (Unit Under Test)
  DFF_sem_rst uut (d,clk,q,qn);

   // Como os sinais irao variar durante a simulacao
  initial begin
    $display("DFF_sem_rst");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_DFF_sem_rst);
    clk = 0;
    d = 0;

    # 2 d = 0;  
    # 2 d = 1; 
    # 2 d = 1; 
    # 2 d = 0; 
    # 2 d = 1; 

    # 5 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor(clk,d,q,qn);
  end

 // gerador de clock com bloco always de unica linha
  always 
    #1 clk = ~clk;



endmodule

