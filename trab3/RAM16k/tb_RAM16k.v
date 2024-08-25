`include "RAM16k.v"

module tb_RAM16k;

    reg [15:0]  in;
    reg [13:0]   address;
    reg load; 
    reg clk;
    wire [15:0] out;

    RAM16k uut(in, address, load, clk, out);


    initial begin
        $display("Testando o módulo RAM16k");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_RAM16k);
        // load in data
        clk = 0;
        load = 1;
        in = 0;

        in = 16'b0000000000000000; address = 3'b000; // address 0
        #2 in = 16'b1111111111111111; address = 3'b001; // address 1
        #2 in = 16'b0000000011111111; address = 3'b010;load = 0; // address 2
        #2 in = 16'b1111111100000000; address = 3'b011;load = 1; // address 3
        #2 in = 16'b0000111100001111; address = 3'b100; // address 4
        #2 in = 16'b1111000011110000; address = 3'b101; // address 5
        #2 in = 16'b0011001100110011; address = 3'b110; // address 6
        #2 in = 16'b1100110011001100; address = 3'b111; // address 7

        #2 in = 16'b0000000000000000; address = 6'b010100; // address 20
        #2 in = 16'b1111111111111111; address = 6'b111111; // address 63
        #2 in = 16'b0000010011100111; address = 3'b010;load = 0; // address 2
        #2 in = 16'b1111100100000000; address = 3'b011;load = 1; // address 3
        #2 in = 16'b0000111100001001; address = 6'b011100; // address 28
        #2 in = 16'b1111011011110000; address = 6'b100000; // address 32
        #2 in = 16'b0011001100111011; address = 6'b101001; // address 41
        #2 in = 16'b1100110011001101; address = 6'b111000; // address 56
        #2 $finish;
    end
        // Monitora os sinais
    initial begin
        $monitor("Tempo = %0t | clk = %b | address = %b | out = %b", $time, clk, address, out);
    end

    always 
        #2 clk = ~clk;
        

endmodule