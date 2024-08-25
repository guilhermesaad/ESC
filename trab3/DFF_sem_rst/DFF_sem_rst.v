// Sflip flop tipo D sem rst

module DFF_sem_rst(input d, input clk, output reg q, output reg qn);
  
  always @ ( posedge clk) begin
    
      q <= d;
      qn <= ~d;
    
  end

endmodule

