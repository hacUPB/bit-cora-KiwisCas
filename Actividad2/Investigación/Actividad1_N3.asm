// Bucle principal
(START)
    @KBD
    D=M
    @START
    D;JEQ       // Si no hay tecla, repetir

    @R0
    M=D         // Guardar tecla en R0

    @R0
    D=M
    @97         // ASCII de 'a'
    D=D-A
    @DRAW
    D;JEQ       // Si 'a' → dibuja

    @R0
    D=M
    @98         // ASCII de 'b'
    D=D-A
    @CLEAR
    D;JEQ       // Si 'b' → borra

    @START
    0;JMP

// Dibuja una línea blanca
(DRAW)
    @SCREEN
    D=A
    @R1
    M=D

    @10
    D=A
    @R2
    M=D       // Dibujamos 10 líneas

(DRAW_LOOP)
    @R2
    D=M
    @START
    D;JEQ

    @R1
    A=M
    M=-1      // Encender 16 píxeles

    @R1
    M=M+1     // Siguiente celda pantalla

    @R2
    M=M-1     // Contador --

    @DRAW_LOOP
    0;JMP

// Borra la pantalla
(CLEAR)
    @SCREEN
    D=A
    @R3
    M=D

    @8192
    D=A
    @R4
    M=D

(CLEAR_LOOP)
    @R4
    D=M
    @START
    D;JEQ

    @R3
    A=M
    M=0

    @R3
    M=M+1

    @R4
    M=M-1

    @CLEAR_LOOP
    0;JMP
