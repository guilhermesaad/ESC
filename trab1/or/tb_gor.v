//
// Testbench para porta or combinacional
//
`include "gor.v"

module tb_gor;
    reg in_a;
    reg in_b;
    wire out_y;

    gor uut(.a(in_a), .b(in_b), .y(out_y));

    initial begin
        $display ("Testbench para OR combinacional");
        $dumpfile ("signals.vcd");
        $dumpvars(0,tb_gor);
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
