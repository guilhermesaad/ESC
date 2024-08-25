`include "RAM512.v"

module tb_RAM512;

    reg [15:0]  in;
    reg [13:0]   address;
    reg load; 
    reg clk;
    wire [15:0] out;

    RAM512 uut(in, address, load, clk, out);


    initial begin
        $display("Testando o módulo RAM512");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_RAM512);
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

        #2 in = 16'b0000000000000000; address = 9'b111110100; // address 500
        #2 in = 16'b1111111111111111; address = 3'b111111111; // address 511
        #2 in = 16'b0000000011111111; address = 3'b010;load = 0; // address 2
        #2 in = 16'b1111111100000000; address = 3'b011;load = 1; // address 3
        #2 in = 16'b0000111100001111; address = 9'b001100100; // address 100
        #2 in = 16'b1111000011110000; address = 9'b100000000; // address 256
        #2 in = 16'b0011001100110011; address = 9'b010000001; // address 129
        #2 in = 16'b1100110011001100; address = 9'b011111010; // address 7
        #5 $finish;
    end
        // Monitora os sinais
    initial begin
        $monitor("Tempo = %0t | clk = %b | address = %b | out = %b", $time, clk, address, out);
    end

    always 
        #2 clk = ~clk;
        

endmodule