module RAM8(
    input  [15:0] in,
    input  [2:0]  address,
    input         load,
    input         clk,
    output reg [15:0] out 
);
    reg [15:0] ram [7:0]; // Define 8 registradores de 16 bits cada

    always @ (*) begin
        if (load) begin
            ram[address] <= in; 
        end

        out = ram[address]; 
    end
    
endmodule
