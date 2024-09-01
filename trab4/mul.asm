// Inicializando os registradores com valores
// R1 = multiplicando
@5
D=A
@1              // Usando endereço de memória 1 para R1
M=D
// R2 = multiplicador
@3
D=A
@2              // Usando endereço de memória 2 para R2
M=D

// Inicializando o acumulador R0 com 0
@0
M=0             // R0 = 0

// Inicializando o contador para o loop
@2
D=M             // D = R2 (multiplicador)
@COUNT
M=D             // COUNT = D (inicializando contador)

// Início do loop de multiplicação
(LOOP)
@COUNT
D=M             // D = contador
@END
D;JEQ           // Se o contador é 0, sai do loop

// Adiciona R1 ao acumulador R0
@1
D=M             // D = R1
@0
M=D+M           // R0 = R0 + R1

// Decrementa o contador
@COUNT
M=M-1           // COUNT--

@LOOP
0;JMP           // Repete o loop

// Fim do loop e programa
(END)
@END
0;JMP           // Loop infinito para finalizar o programa
