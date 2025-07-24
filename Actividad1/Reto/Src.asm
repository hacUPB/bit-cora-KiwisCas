








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





