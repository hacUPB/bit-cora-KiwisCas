# Actividad 16

## Implementa en lenguaje ensamblador el siguiente programa:

```cpp
    int[] arr = new int[10];
    int sum = 0;
    for (int j = 0; j < 10; j++) {
        sum = sum + arr[j];
    }
```

### Implementado a assembler

```asm
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

```
### ¿Qué hace este programa?

Suma los primeros 10 elementos del arreglo arr y almacena el resultado en sum.


### ¿Cuál es la dirección base de arr en la memoria RAM?
Van desde la <span style="color:yellow">RAM[16]</span> a <span style="color:yellow">RAM[25]</span> puesto que son las variables asignadas automáticamente

### ¿Cuál es la dirección base de sum en la memoria RAM y por qué?

Va en la <span style="color:yellow">RAM[26]</span> puesto que es la siguiente variable libre despues de _arr_

### ¿Cuál es la dirección base de j en la memoria RAM y por qué?

Va en la <span style="color:yellow">RAM[27]</span> puesto que es la siguiente variable libre despues de sum


# Actividad 17


## Implementa en lenguaje ensamblador:

```cpp
if ( (D - 7) == 0) goto a la instrucción en ROM[69]
```


### Tranformado a assembler

```asm
@7
D=D-A     // D = D - 7
@69
D;JEQ     // Si D == 0, salta a ROM[69]
```