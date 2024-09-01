// Inicializando registradores com valores de exemplo
@100
D=A
@1              // R1 aponta para o início dos valores (endereço base)
M=D
@10
D=A
@2              // R2 contém o número de valores
M=D

// Inicializando o acumulador para a soma
@0
M=0             // R0 = 0 (para armazenar a soma)

// Inicializando contador para o loop de soma
@2
D=M             // D = R2 (número de valores)
@COUNT
M=D             // COUNT = D (inicializando contador)

// Loop para somar os valores a partir de R1
(LOOP_SUM)
@COUNT
D=M             // D = contador
@END_SUM
D;JEQ           // Se contador é 0, termina a soma

// Obter o endereço atual baseado em R1
@1
D=M             // D = R1 (endereço base)
@CURRENT_ADDRESS
M=D             // CURRENT_ADDRESS = D

// Adiciona o valor de M[CURRENT_ADDRESS] a R0
@CURRENT_ADDRESS
A=M             // A = endereço atual
D=M             // D = valor em M[endereço atual]
@0
M=D+M           // R0 = R0 + valor de M[endereço atual]

// Incrementa o endereço de R1 para o próximo valor
@1
M=M+1           // R1++

// Decrementa o contador
@COUNT
M=M-1           // COUNT--

@LOOP_SUM
0;JMP           // Repete o loop

(END_SUM)
// Realizar a divisão R0 = soma / R2

// O valor da soma já está em R0
// R2 já contém o divisor

// Inicializando o quociente R0 com 0 para a divisão
@0
M=0             // R0 = 0 (para iniciar o quociente)

// Loop de divisão
(LOOP_DIV)
@0
D=M             // D = soma (R0)
@2
D=D-M           // D = R0 - R2 (soma - divisor)

@END_DIV
D;JLT           // Se D < 0, sair do loop

// Se D >= 0, continua a subtração
@0
M=D             // R0 = D (soma - divisor)
@QUOTIENT
M=M+1           // QUOTIENT++ (incrementa o quociente)

@LOOP_DIV
0;JMP           // Repete o loop

(END_DIV)
@QUOTIENT
D=M             // D = QUOTIENT (o resultado da média)
@0
M=D             // R0 = D (quociente final)

// Fim do programa
@END
0;JMP           // Loop infinito para finalizar o programa

// Variáveis auxiliares
(CURRENT_ADDRESS)
@0              // Local para armazenar o endereço atual
(COUNT)
@0              // Contador do número de valores restantes
(QUOTIENT)
@0              // Para armazenar o quociente (média calculada)
(END)
@END
0;JMP           // Loop infinito
