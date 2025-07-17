# Actividad 1
## ¿Qué es un computador Digital Moderno? 

Es una máquina electronica capaz de procesar información mediante una serie de instrucciones programadas las cuales se encuentran almacenados en su memoria (ROM) y este mismo puede ejecutar una gran cantidad de programas y tareas haciendo uso del mismo hardware

## ¿Cuales son sus partes?

Se puede partir por la "Unidad de Procesamiento Central" mejor conocido como CPU se podría considerar como el cerebro de la computadora, es el responsable de ejecutar las instrucciones que están almacenadas en la memoria, se encuentra conformada por la ALU (Aritmetic-Logic Unit) la cual es la encargada de realizar operaciones matemáticas (sumas, restas, multiplicaciones, entre otros.) y operaciones lógicas (AND, OR, NOT).
tambien la confroman internamente los registros A, D y se podrían incluir las instrucciones

luego de esto podemos seguir con los dispositivos de almacenamiento (RAM Y ROM). el dispositivo de almacenamiento RAM (Random Access Memories) es un dispositivo de lectura y escritura usado para almacenar datos *temporales*, es una memoria dinámica y puede cambiar de forma constante durante la ejecución del programa y se puede acceder mediante el registro *A*. Luego está ROM (Read Only Memory) la cual es la encargada de almacenar el programa (osea, el conjunto de instrucciones) que va a ejecutarse, de forma importante es un programa de solo lectura, por lo que no puede modificarse en medio de la ejecución.

Finalmente encontramos los dispositivos de entrada (Teclado, mouse, sensores, microfonos, etc.) los cuales son los encargados de escribir las instrucciones de ejecución del programa y los dispositivos de salida (Pantalla, Impresora, Parlantes, etc) que muestran los resultados de salida de la ejecución del programa.

# Actividad 2

## ¿Qué es entonces un programa?

Es una secuencia de instrucciones almacenadas en la memoria, actualmente existen lenguajes de alto nivel que ayudan a facilitar la forma en la que suelen escribirse estas instrucciones pero, anteriormente se solían escribir en un lenguaje de máquina (Código binario) o en un lenguaje ensamblador (Lenguaje de bajo nivel) tambien es importante resaltar que un computador puede tratar las instrucciones como datos, lo que permite ejecutar cualquier secuencia de órdenes con el mismo hardware.

## ¿Qué es un lenguaje Ensamblador?

Es un lenguaje de programación de bajo nivel que corresponde directamente al uso de simbolos y abreviaciones que son legibles por humanos para representar instrucciones de la maquina. Es importate resaltar que las instrucciones en ensamblador corresponden directamente a una instrucción binaria (Lenguaje de máquina).

Este lenguaje necesita se traducido a lenguaje máquina mediante un programa llamado ensamblador (Ensambler)

## ¿Qué es lenguaje de máquina?

Es el languaje de programación que entiende directamente la máquina, son instrucciones en código binario que se ejecutan directamente por la CPU de la computadora, es un sistema compuesto por una secuencia de bits (ceros y unos) a modo de instrucción las cuales indican a la CPU que operación debe realizar y sobre que registos, datos o memoria debe actuar.

es el lenguaje de programación más bajo, osea el más cercano al hardware en la jerarquía de los lenguajes de programación y es específico de la arquitectura del procesador, osea que el lenguaje de máquina de un tipo de CPU no es necesariamente igual a otro.

# Actividad 3

## ¿Qué son PC, D y A?

PC (Program Counter) es un registro especial de la CPU que se encarga de almacenar la dirección de la siguiente instrucción que debe de ejecutarse desde la ROM, este se incrementa de forma automática despues de realizar una instrucción, con la excepción de que la instrucción indique saltos.

D (Data Register) se encarga de almacenar valores temporales que puede utilizar la ALU para realizar cálculos, D puede cargarse directamente con un número, puede copiar desde la memoria y recibir resultados de operaciones.

A (Address Register) es el registro de direcciones, aunque también puede comportarse como un segundo registro de datos, se puede usar para guardar una dirección de memoria que se quiere leer o escribir y se usa también para contener valores para operaciones, por ejemplo constantes

## ¿Para qué los usa la CPU?

"PC" ayuda a llevar el control de que instrucción es la que debe de ejecutarse, esta se actualiza de forma automática o mediante instrucciones de salto, "A" ayuda a señalar la dirección en la memoria RAM para operaciones de lectura y(o) escritura, este tambien puede actuar como un espacio de almacenamiento temporal dentro de la CPU para guardar cualquier valor necesario en un momento dado (numeros, datos, constantes, etc.) y "D" se encarga de almacenar valores intermedios o resultados de operaciones, este es uno de los registros que utiliza directamente la ALU.

# Actividad 4

## Ejercicio

Considera el siguiente fragmento de código en lenguaje ensamblador:

```bash
@16384
D = A
@16
M = D
```

El resultado de este programa es que guarda en la posición 16 de la RAM el valor 16384. Ahora escribe un programa en lenguaje ensamblador que guarde en la posición 32 de la RAM un 100.

## Desarrollo

La mejor solución que pude encontrar fue la siguiente y siguiendo el ejemplo anterior:

```bash
@100
D = A
@32
M = D
``` 

### Nota 

Esto en más para mi facilidad y entendimiento para cuando se tenga que programar en ensambler :D

*A* es la posición que se escribió anteriormente, por ejemplo:

```bash 
@50
A = 50
#En el momento que se escribe el @50 *A* es igual a la posición del valor numérico que hay despues del arroba, en este caso 50
```

*D* Es una forma de guardar temporalmente los datos en una variable que se puede usar más adelante, pero segun tengo entendido, no puede almacenar más de uno a la vez

```bash
# si digo 
@50
D = A
D = 5O
#En este ejemplo, D va a guardar de forma temporal el valor que se encuentra en A, osea, 50
 ```

 Finalmente *M* va a guardar EN LA POSICIÓN QUE SE ENCUENTRE EL PROGRAMA EN ESE MOMENTO un valor que se le asigne desde D y este va a quedar en la RAM

```bash
@100
D = A
@32
M = D
#Tomando de ejemplo el ejercicio, al final cuando M = D quiere decir que en la posición que se encuentra en ese momento por el @ Va a guardar el dato que estaba almacenado en D para escribirlo en la RAM
``` 


# Actividad 5

*En caso de notas futuras las dejaré acá :D*








