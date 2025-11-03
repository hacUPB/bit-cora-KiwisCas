// var = 10
@10
D=A
@var
M=D

// punt = &var
@var
D=A
@punt
M=D


// *punt = 20
@20
D=A
@punt
A=M
M=D

(END)
@END
0;JMP


