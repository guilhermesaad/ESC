
`include "add4.v"

module tb_add4;

    //inputs
    reg [3:0] in_A;    
    reg [3:0] in_B;    
    reg in_Cin;    
    //outputs
    wire [3:0] out_Sum; 
    wire out_Cout;

  

  // Instancia da UUT (Unit Under Test)
  add4 uut (.A(in_A), .B(in_B), .Cin(in_Cin), .Sum(out_Sum), .Cout(out_Cout));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para full adder 4bit");
    $dumpfile("signals.vcd");
    $dumpvars(0);

    // Test cases
    in_A = 4'b0000; in_B = 4'b0000; in_Cin = 0; #10;
    in_A = 4'b0001; in_B = 4'b0001; in_Cin = 0; #10;
    in_A = 4'b0010; in_B = 4'b0010; in_Cin = 0; #10;
    in_A = 4'b0011; in_B = 4'b0011; in_Cin = 0; #10;
    in_A = 4'b0100; in_B = 4'b0100; in_Cin = 0; #10;
    in_A = 4'b0101; in_B = 4'b0101; in_Cin = 0; #10;
    in_A = 4'b0110; in_B = 4'b0110; in_Cin = 0; #10;
    in_A = 4'b0111; in_B = 4'b0111; in_Cin = 0; #10;
    in_A = 4'b1000; in_B = 4'b1000; in_Cin = 0; #10;
    in_A = 4'b1001; in_B = 4'b1001; in_Cin = 0; #10;
    in_A = 4'b1010; in_B = 4'b1010; in_Cin = 0; #10;
    in_A = 4'b1011; in_B = 4'b1011; in_Cin = 0; #10;
    in_A = 4'b1100; in_B = 4'b1100; in_Cin = 0; #10;
    in_A = 4'b1101; in_B = 4'b1101; in_Cin = 0; #10;
    in_A = 4'b1110; in_B = 4'b1110; in_Cin = 0; #10;
    in_A = 4'b1111; in_B = 4'b1111; in_Cin = 0; #10;
    in_A = 4'b0000; in_B = 4'b0000; in_Cin = 1; #10;
    in_A = 4'b0001; in_B = 4'b0001; in_Cin = 1; #10;
    in_A = 4'b0010; in_B = 4'b0010; in_Cin = 1; #10;
    in_A = 4'b0011; in_B = 4'b0011; in_Cin = 1; #10;
    in_A = 4'b0100; in_B = 4'b0100; in_Cin = 1; #10;
    in_A = 4'b0101; in_B = 4'b0101; in_Cin = 1; #10;
    in_A = 4'b0110; in_B = 4'b0110; in_Cin = 1; #10;
    in_A = 4'b0111; in_B = 4'b0111; in_Cin = 1; #10;
    in_A = 4'b1000; in_B = 4'b1000; in_Cin = 1; #10;
    in_A = 4'b1001; in_B = 4'b1001; in_Cin = 1; #10;
    in_A = 4'b1010; in_B = 4'b1010; in_Cin = 1; #10;
    in_A = 4'b1011; in_B = 4'b1011; in_Cin = 1; #10;
    in_A = 4'b1100; in_B = 4'b1100; in_Cin = 1; #10;
    in_A = 4'b1101; in_B = 4'b1101; in_Cin = 1; #10;
    in_A = 4'b1110; in_B = 4'b1110; in_Cin = 1; #10;
    in_A = 4'b1111; in_B = 4'b1111; in_Cin = 1; #10;

        $finish;
    end

    // Monitor the changes
    initial begin
        $monitor("t=%03d: \tA=%b B=%b Cin=%b | Sum=%b Cout=%b", $time, in_A, in_B, in_Cin, out_Sum, out_Cout);
    end


endmodule

