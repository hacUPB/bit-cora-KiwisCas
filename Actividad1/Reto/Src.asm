// Ejercicio 1
@1978
D=A

// Ejercicio 2

@69
D=A
@100
M=D

//Ejercicio 3

//Agregamos contenido a la posición 24 de la RAM

@18
D=A
@24
M=D

// Desarrollo del Ejercicio (suponiendo que empezamos en @0)

@24
D=M
@200
M=D


//Ejercicio 4

// Llenamos la posición 100 de la RAM con un valor al azar

@67
D=A
@100
M=D

// Vamos a la posición 15 y hacemos la resta

@15
D=D-A
@100
M=D

//Ejercicio 5

// Llenamos la posición 0 y 1 de la RAM

@11
D=A
@0
M=D
@67
D=A
@1
M=D

// Sumamos sus contenidos

@0
D=D+M
@69
D=D+A
@2
M=D

//Ejercicio 6
@100
D;JEQ

//Ejercicio 7

//Llenamos la posición 100 con un valor al azar

@68
D=A
@100
M=D

// Esto es un poco complejo, acá lo que hay que hacer es almacenar 100 en A y hacer una resta con lo que hay en la RAM, en este caso el 68, en caso de que el resultado de la resta sea positivo, quiere decir que lo que hay en 
//en la RAM (el contenido de la posición) es menor que 100, y en ese caso saltará a la posición 20, en caso contrario no hará nada y seguirá normal

D=D-A      // D = RAM[100] - 100
@20
D;JLT

//Ejercicio 8

@var1
D=M
@var2
D=D+M
@var3
M=D

//¿Qué hace este programa? 

// R/ el programa toma los valores que almacena el sistema en la RAM en la posición var1 y lo suma con el valor de la RAM en var2 para luego guardar el resultado en var3

// en que posición de memoria están var1, var2 y var3?

//están en la posición 16, 17 y 18 puesto que estas son variables libres y el hardware reserva los espacios del 0 al 15 para intrucciones especificas


//Ejercicio 9

i = 1
sum = 0
sum = sum + i
i = i + 1

//traducido a assembler:

// i = 1
@i
M=1
// sum = 0
@sum
M=0
// sum = sum + i
@i
D=M
@sum
M=D+M
// i = i + 1
@i
D=M+1
@i
M=D

// ¿Qué hace este programa?

//inicializa i con el valor de 1 y sum con el valor de 0, luego de esto suma i a sum (sum = 1) para luego incrementar i en 1 para que i sea igual a 2 (i = 2)

i está en RAM[16] y sum está en RAM[17]

//Optimiza esta parte del código para que use solo dos instrucciones:

// i = i + 1
@i
M=M+1

//Ejercicio 10

// Las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólico R0 a R15. Escribe un programa en lenguaje ensamblador que guarde en R1 la operación 2 * R0.

@R0
D=M
D=D+D
@R1
M=D

//Ejercicio 11

//programa dado

@1000
D=A
@i
M=D
(LOOP) //una etiqueta, vuelve acá si se vuelve a llamar
@i
D=M
@CONT
D;JEQ
@i
M=M-1
@LOOP
0;JMP
(CONT) //otra etiqueta, si se llama a cont empieza acá


// ¿Qué hace el programa?

// el programa va restando de uno en uno desde el 1000 hasta llegar a 0, a modo de cuenta regresiva, cuando el programa llega a cero se detiene el programa

// ¿Donde está almacenada i?  ¿En qué dirección de esa memoria?

// i está almacenada en la RAM, al no estar definida antes, va a estar en la RAM[16] 

// ¿En qué memoria y en qué dirección de memoria está almacenado el comentario //i = 1000?

// Al ser un comentrario no está alojada en ninguna memoria y dirección, estos comentarios son solamente visualizables por humanos, el sistema los omite

//¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?

// La primera intrucción es @1000, osea, ir a la posición 1000 de la RAM y además cargar el valor en A, la intrucción está en ROM[0]

// ¿Qué son CONT y LOOP?

//CONT y LOOP son etiquetas. En lenguaje ensamblador, son nombres simbólicos utilizados para marcar ubicaciones de memoria específicas dentro del código del programa (ROM) dan una forma de referirse a una ubicaciones del código sin necesidad de conocer la direccion numéricas exacta

// LOOP: Marca el comienzo del bucle principal donde se comprueba y disminuye la variable i

// CONT: Marca el final del código inmediatamente después de que el bucle ha terminado de ejecutarse (cuando i llega a 0).

// ¿Cuál es la diferencia entre los símbolos i y CONT?

// i es una variable almacenada en la RAM mientras que CONT es una etiqueta que se almacena en la ROM, CONT es una instrucción, i almacena datos


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

//Actividad 16

//16. Implementa en lenguaje ensamblador el siguiente programa:

    //int[] arr = new int[10];
    //int sum = 0;
    //for (int j = 0; j < 10; j++) {
        //sum = sum + arr[j];
    //}

//implementado a assembler

// sum = 0
@26
M=0

// j = 0
@27
M=0

(LOOP)
@27
D=M
@10
D=D-A
@END
D;JGE          // Si j >= 10, termina

// D = arr[j]
@27
D=M
@16
A=D+A
D=M

// sum += arr[j]
@26
M=D+M

// j++
@27
M=M+1

@LOOP
0;JMP

(END)


    
    //- ¿Qué hace este programa?
    //Suma los primeros 10 elementos del arreglo arr y almacena el resultado en sum.


    //- ¿Cuál es la dirección base de arr en la memoria RAM?
    // van desde la RAM[16] a RAM[25] puesto que son las variables asignadas automáticamente

    //- ¿Cuál es la dirección base de sum en la memoria RAM y por qué?
    // va en la RAM[26] puesto que es la siguiente variable libre despues de arr

    //- ¿Cuál es la dirección base de j en la memoria RAM y por qué?
    //va en la RAM[27] puesto que es la siguiente variable libre despues de sum


// Actividad 17


//Implementa en lenguaje ensamblador:
//if ( (D - 7) == 0) goto a la instrucción en ROM[69]


// a assembler

@7
D=D-A     // D = D - 7
@69
D;JEQ     // Si D == 0, salta a ROM[69]


// Actividad 18

//Revisar la Captura de pantalla de la Actividad18
// Para ver el resultado del código en Nand2Tetris revisar la captura de "Actividad18Nand2Tetris"

//código en assembler

@SCREEN
	D=A
	@R12
	AD=D+M
	@2016 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@7704 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@15900 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@31758 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@31206 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@31759 
	D=D+A 
	A=D-A 
	M=A-D 
	D=A 
	@32
	AD=D+A
	@19471 
	D=D+A 
	A=D-A 
	M=A-D 
	D=A 
	@32
	AD=D+A
	@1037 
	D=D+A 
	A=D-A 
	M=A-D 
	D=A 
	@32
	AD=D+A
	@1561 
	D=D+A 
	A=D-A 
	M=A-D 
	D=A 
	@32
	AD=D+A
	@20473 
	D=D+A 
	A=D-A 
	M=A-D 
	D=A 
	@32
	AD=D+A
	@28685 
	D=D+A 
	A=D-A 
	M=A-D 
	D=A 
	@32
	AD=D+A
	@29262 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@8772 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@8196 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@4104 
	D=D+A 
	A=D-A 
	M=D-A 
	D=A 
	@32
	AD=D+A
	@4080 
	D=D+A 
	A=D-A 
	M=D-A 
	@R13
	A=M
	D;JMP

//Actividad 19

// el código dado fue el siguiente:

0100000000000000
1110110000010000
0000000000010000
1110001100001000
0110000000000000
1111110000010000
0000000000010011
1110001100000101
0000000000010000
1111110000010000
0100000000000000
1110010011010000
0000000000000100
1110001100000110
0000000000010000
1111110010101000
1110101010001000
0000000000000100
1110101010000111
0000000000010000
1111110000010000
0110000000000000
1110010011010000
0000000000000100
1110001100000011
0000000000010000
1111110000100000
1110111010001000
0000000000010000
1111110111001000
0000000000000100
1110101010000111

// este código está en formato .hack por lo que para poderlo comprender se tuvo que hacer una conversión a assembler y el código quedó de la siguiente manera

@16384 
D=A 
@16 
M=D
@24576
D=M
@19
D;JNE
@16
D=M
@16384
D=D-A
@4 
D;JLE 
@16 
AM=M-1 
M=0 
@4 
0;JMP 
@16 
D=M 
@24576 
D=D-A 
@4 
D;JGE 
@16 
A=M 
M=-1 
@16 
M=M+1 
@4 
0;JMP 

// este código se encarga de que en caso de que se detecte cualquier entrada del teclado presionada y mantenida (letras y así) hará que se dibujen lineas negras en la pantalla a modo de rellenar, pero en caso de que se deje de recibir señal de entrada, esta linea retrocederá

//Actividad 20

//revisa el documento del reto con la actividad20.asm





