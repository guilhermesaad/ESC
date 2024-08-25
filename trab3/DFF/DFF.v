// Sflip flop tipo D

module dff(input d, input clk, input rst, output reg q, output reg qn);
  
  always @ ( posedge clk or posedge rst ) begin
    if(rst == 1) begin
      q <= 0;
      qn <= 1;
    end else begin
      q <= d;
      qn <= ~d;
    end
  end

endmodule

