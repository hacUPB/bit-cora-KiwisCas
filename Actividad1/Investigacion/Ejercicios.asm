@200
D=M
@100
M=D

//RAM[3] = RAM[3]-15

@15 
D=A
@3
M=M-D

//RAM[2] = RAM[0] + RAM[1] + 17

@43
D=A
@0
M=D

@30
D=A
@1
M=D

//Primeramente se alojan los valores, hay que ser especcificos, sin afán

@0
D=M
@1
D=D+M
@17
D=D+A
@2
M=D