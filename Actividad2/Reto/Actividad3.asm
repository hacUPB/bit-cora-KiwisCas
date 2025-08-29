@1
    D=A
    @R0     
    M=D

    @0
    D=A
    @R1    
    M=D

    @100
    D=A
    @R2     
    M=D

(LOOP)
    @R0
    D=M
    @R2
    D=D-M
    @END
    D;JGT

    @R0
    D=M
    @R1
    M=D+M

    @R0
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP