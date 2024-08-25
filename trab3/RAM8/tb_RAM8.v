`include "RAM8.v"

module tb_RAM8;

    reg [15:0]  in;
    reg [2:0]   address;
    reg load; 
    reg clk;
    wire [15:0] out;

    RAM8 uut(in, address, load, clk, out);


    initial begin
        $display("Testando o módulo RAM8");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_RAM8);
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
        #5 $finish;
    end
        // Monitora os sinais
    initial begin
        $monitor("Tempo = %0t | clk = %b | address = %b | out = %b", $time, clk, address, out);
    end

    always 
        #2 clk = ~clk;
        

endmodule