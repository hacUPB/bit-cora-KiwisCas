# Ejercicio 11

## Programa dado en assembler

```asm
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
```


## ¿Qué hace el programa?

El programa va restando de uno en uno desde el 1000 hasta llegar a 0, a modo de cuenta regresiva, cuando el programa llega a cero se detiene el programa

## ¿Donde está almacenada i?  ¿En qué dirección de esa memoria?

i está almacenada en la RAM, al no estar definida antes, va a estar en la RAM[16] 

## ¿En qué memoria y en qué dirección de memoria está almacenado el comentario //i = 1000?

Al ser un comentrario no está alojada en ninguna memoria y dirección, estos comentarios son solamente visualizables por humanos, el sistema los omite

## ¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?

La primera intrucción es @1000, osea, ir a la posición 1000 de la RAM y además cargar el valor en A, la intrucción está en ROM[0]

## ¿Qué son CONT y LOOP?

<span style="color:yellow">CONT</span> y <span style="color:yellow">LOOP</span> son etiquetas. En lenguaje ensamblador, son nombres simbólicos utilizados para marcar ubicaciones de memoria específicas dentro del código del programa (ROM) dan una forma de referirse a una ubicaciones del código sin necesidad de conocer la direccion numéricas exacta

<span style="color:yellow">LOOP:</span> Marca el comienzo del bucle principal donde se comprueba y disminuye la variable i

<span style="color:yellow">CONT:</span> Marca el final del código inmediatamente después de que el bucle ha terminado de ejecutarse (cuando i llega a 0).

## ¿Cuál es la diferencia entre los símbolos i y CONT?

 _i_ es una variable almacenada en la RAM mientras que CONT es una etiqueta que se almacena en la ROM, CONT es una instrucción, i almacena datos