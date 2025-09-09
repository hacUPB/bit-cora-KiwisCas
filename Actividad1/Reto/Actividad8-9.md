# Ejercicio 8

```asm
@var1
D=M
@var2
D=D+M
@var3
M=D
```

## ¿Qué hace este programa?

el programa toma los valores que almacena el sistema en la RAM en la posición var1 y lo suma con el valor de la RAM en var2 para luego guardar el resultado en var3

## ¿En que posición de memoria están var1, var2 y var3?

Están en la posición 16, 17 y 18 puesto que estas son variables libres y el hardware reserva los espacios del 0 al 15 para intrucciones especificas


# Ejercicio 9

```cpp
i = 1
sum = 0
sum = sum + i
i = i + 1
```

## Traducido a assembler:

```asm
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
```
## ¿Qué hace este programa?

Inicializa i con el valor de 1 y sum con el valor de 0, luego de esto suma i a sum (sum = 1) para luego incrementar i en 1 para que i sea igual a 2 (i = 2)

## ¿En qué parte de la memoria RAM está la variable i y sum? ¿Por qué en esas posiciones?

i está en RAM[16] y sum está en RAM[17], puesto que son variables libres que están disponibles que están disponibles despues de las variables reservadas.

### Optimiza esta parte del código para que use solo dos instrucciones:

Este es el código antes de los cambios

```asm
// i = i + 1
@i
D=M+1
@i
M=D
```

El siguiente código es el código optimizado

```asm
// i = i + 1
@i
M=M+1
```

