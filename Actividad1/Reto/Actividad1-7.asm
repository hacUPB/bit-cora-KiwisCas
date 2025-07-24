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