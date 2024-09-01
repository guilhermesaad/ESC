// Inicializando registradores com valores
// R1 = 4
@4
D=A
@1              // Usando endereço de memória 1 para R1
M=D
// R2 = 10
@10
D=A
@2              // Usando endereço de memória 2 para R2
M=D
// R3 = 3
@3
D=A
@3              // Usando endereço de memória 3 para R3
M=D

// D = R1
@1
D=M
// D = R1 - R2
@2
D=D-M
// if R1 < R2, pula para comparar R2 e R3
@COMPARE_R2_R3
D;JLT

// Se R1 >= R2, verifica R1 com R3
@1
D=M
@3
D=D-M
// Se R1 > R3, R1 é o maior
@OUTPUT_R1
D;JGT

// Se não, R3 é o maior
@OUTPUT_R3
0;JMP

(COMPARE_R2_R3)
// D = R2
@2
D=M
// D = R2 - R3
@3
D=D-M
// Se R2 > R3, R2 é o maior
@OUTPUT_R2
D;JGT
// Se não, R3 é o maior
@OUTPUT_R3
0;JMP

(OUTPUT_R1) // R0 = R1
@1
D=M
@0              // Usando endereço de memória 0 para R0
M=D
@END
0;JMP

(OUTPUT_R2) // R0 = R2
@2
D=M
@0
M=D
@END
0;JMP

(OUTPUT_R3) // R0 = R3
@3
D=M
@0
M=D
@END
0;JMP

(END)
@END
0;JMP // Loop infinito para finalizar o programa
