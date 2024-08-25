// Sflip flop tipo D sem rst

module DFF_sem_rst(input [15:0]d, input clk, output reg [15:0]q, output reg [15:0] qn);
  
  always @ ( posedge clk) begin
    
      q <= d;
      qn <= ~d;
    
  end

endmodule

