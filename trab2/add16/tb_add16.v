
`include "add16.v"

module tb_add16;

    //inputs
    reg [15:0] in_A;    
    reg [15:0] in_B;    
    reg in_Cin;    
    //outputs
    wire [15:0] out_Sum; 
    wire out_Cout;

  

  // Instancia da UUT (Unit Under Test)
  add16 uut (.A(in_A), .B(in_B), .Cin(in_Cin), .Sum(out_Sum), .Cout(out_Cout));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para full adder 16bit");
    $dumpfile("signals.vcd");
    $dumpvars(0);

    // Test cases
    in_A = 16'b0000001000000010; in_B = 16'b0000000000000011; in_Cin = 0; #10;
    in_A = 16'b0000000000000000; in_B = 16'b0000000011111111; in_Cin = 0; #10;
    in_A = 16'b0111011100000000; in_B = 16'b1011000010110000; in_Cin = 0; #10;
    in_A = 16'b1111111111111111; in_B = 16'b1111111111111111; in_Cin = 0; #10;


        $finish;
    end

    // Monitor the changes
    initial begin
        $monitor("t=%03d: \tA=%b B=%b Cin=%b | Sum=%b Cout=%b", $time, in_A, in_B, in_Cin, out_Sum, out_Cout);
    end


endmodule

