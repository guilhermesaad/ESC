//
// Testbench para porta or combinacional 16 bit
//
`include "gor16.v"

module tb_gor16;
    reg [15:0]in_a;
    reg [15:0]in_b;
    wire [15:0]out_y;

    gor16 uut(.a(in_a), .b(in_b), .y(out_y));

    initial begin
        $display ("Testbench para OR combinacional 16 bit");
        $dumpfile ("signals.vcd");
        $dumpvars(0,tb_gor16);
        # 0 in_a = 0; in_b = 0;
        # 10 in_a = 0; in_b = 1;
        # 10 in_a = 1; in_b = 0;
        # 10 in_a = 1; in_b = 1;

        # 10 $finish;   
    end

    initial begin
    $monitor("t=%03d: \ta=%d,b=%d,y=%d\n",$time,in_a,in_b,out_y);
    end
endmodule
