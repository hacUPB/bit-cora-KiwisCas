//Actividad 12

// Implemente en ensamblador:

//R4 = R1 + R2 + 69

@R1
D=M        // D = R1
@R2
D=D+M      // D = R1 + R2
@69
D=D+A      // D = R1 + R2 + 69
@R4
M=D        // R4 = D

//Actividad 13

//Implementa en ensamblador:
//if R0 >= 0 then R1 = 1
//else R1 = –1

//(LOOP)
//goto LOOP

//Desarrollo


@R0
D=M
@POS
D;JGE        // Si R0 >= 0 salta a POS
@R1
M=-1         // else: R1 = -1
@CONT
0;JMP        // Salta a CONT

(POS)
@R1
M=1          // then: R1 = 1

(CONT)
(LOOP)
@LOOP
0;JMP        // Bucle infinito


//Actividad 14

//Implementa en ensamblador:

//R4 = RAM[R1]


@R1
A=M          // A va a guardar el valor de la dirección de R1
D=M          // D = RAM[R1]
@R4
M=D          // R4 = RAM[R1]


//Actividad 15 

//Implementa en ensamblador el siguiente problema. En la posición R0 está almacenada la dirección inicial de una región de memoria. En la posición R1 está almacenado el tamaño de la región de memoria. Almacena un -1 en esa región de memoria.

@R0
D=M
@addr
M=D         // addr = R0 (inicio de región)

@R1
D=M
@count
M=D         // count = R1 (cantidad de posiciones)

(LOOP)
@count
D=M
@END
D;JEQ       // Si count == 0, salta a END

@addr
A=M
M=-1        // RAM[addr] = -1

@addr
M=M+1       // addr++

@count
M=M-1       // count--

@LOOP
0;JMP

(END)
