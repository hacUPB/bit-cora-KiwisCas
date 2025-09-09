@j
M=1
@sum
M=0
(LOOP)
    @j
    D=M
    @100
    D=D-A
    @END
    D;JGT
    @j
    D=M
    @sum
    M=D+M
    @j
    M=M+1
    @LOOP
    0;JMP
(END)


    
