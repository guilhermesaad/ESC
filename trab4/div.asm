// Inicializando os registradores com valores
// R1 = dividendo
@20
D=A
@1              // Usando endereço de memória 1 para R1
M=D
// R2 = divisor
@3
D=A
@2              // Usando endereço de memória 2 para R2
M=D

// Inicializando o quociente R0 com 0
@0
M=0             // R0 = 0

// Loop de divisão
(LOOP)
@1
D=M             // D = R1 (dividendo)
@2
D=D-M           // D = R1 - R2

@END
D;JLT           // Se D < 0, sair do loop

// Se D >= 0, continua a subtração
@1
M=D             // R1 = D (R1 = R1 - R2)
@0
M=M+1           // R0 = R0 + 1 (incrementa o quociente)

@LOOP
0;JMP           // Repete o loop

// Fim do loop e programa
(END)
@END
0;JMP           // Loop infinito para finalizar o programa
