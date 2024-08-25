module RAM64(
    input  [15:0] in,
    input  [5:0]  address,
    input         load,
    input         clk,
    output reg [15:0] out 
);
    reg [15:0] ram [2**5:0]; // Define 8 registradores de 16 bits cada

    always @ (*) begin
        if (load) begin
            ram[address] <= in; 
        end

        out = ram[address]; 
    end
    
endmodule
