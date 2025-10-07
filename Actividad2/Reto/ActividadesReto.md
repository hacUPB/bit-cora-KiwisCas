# RETO

## ACTIVIDAD 1

- ¿Cómo están implementadas las variables `j` y `sum`?

    - Ambas variables están implementadas como símbolos que representan direcciones en la memoria RAM. El compilador asocia cada uno de los símbolos con una dirección libre de la memoria RAM que suele comenzar desde la RAM[16]

        - `j` representa la variable de control del ciclo
        - `sum` es el acumulador de los números
    
- ¿En qué direcciones de memoria están estas variables?

    - El ensamblador asigna a `j` en la posición RAM[16] y a sum lo asigna en la posición RAM[17]

- ¿Cómo está implementado el ciclo `while`?

    - el ciclo `while` se implementa así:
        1. Inicialmente se pone la etiqueta `(LOOP)` que indica el inicio del ciclo.
        2. Luego se realiza una comparación, se calcula `D = j - 100`.
        3. Posteriormente se realiza un salto condicional que termina en caso de que j sea mayor que 100, en este caso, el código salta al final cuando la resta realizada en la comparación sea positiva.
        4. Luego se suma el valor de `j` a `sum` para luego incrementar el valor de j en + 1 hasta llegar a 100.
        5. luego realiza un salto a `(LOOP)` en caso de que la condición no se cumpla.

- ¿Cómo se implementa la variable `j`?

    - La variable `j` representa el contador del ciclo. Se usa de la siguiente forma:
        - Inicializa: `@j M=1`
        - Lee: `@j D=M`
        - Incrementa: `@j M=M+1`
        Estas funciones se manipulan directamente desde la dirección de memoria en donde está asignada.

- ¿En qué parte de la memoria se almacena la variable `j`?

    - Como se trata de variables que se definen por el programador, el ensamblador ubica la variable en la primera posición libre de RAM la cual es `RAM[16]`

- Después de todo lo que has hecho, ¿Qué es entonces una variable?
    
    - Una variable es una especie de abstracción que representa una dirección de la memoria RAM, en la que se puede tanto guardar como modificar valores durante la ejecución del programa, o en el caso del ensamblador, es meramente una etiqueta que referencia una posición específica de la memoria

- ¿Qué es la dirección de una variable?

    - Es el número de la celda de la memoria RAM en la que está almacenada la variable. Poniendo por ejemplo la variable `j` del ejercicio, esta está almacenada en la dirección `RAM[16]`. La dirección ayuda a acceder o modificar el contenido de la variable.

- ¿Qué es el contenido de una variable?

    - Es un valor almacenado dentro de la celda de memoria que representa esa misma variable. por ejemplo en el caso de que en el código anterior en  `RAM[16]` estuviese contenido el número 42, el cóntenido dentro de la variable `j` va a ser en ese instante `42`. Cabe resaltar que el contenido cambia a medida que el programa ejecuta instrucciones por ejemplo cuando se hace `M=M+1`

## RAE2 Actividad 1


### Objetivo general
Verificar que el programa implementado en lenguaje ensamblador Hack calcule correctamente la suma de los números enteros desde 1 hasta 100, almacenando el resultado en la variable `sum`.

### Hipótesis
Si el programa inicializa correctamente las variables, evalúa la condición de término de manera precisa, acumula la suma en cada iteración y actualiza la variable de control adecuadamente, el resultado final debe ser **5050** al finalizar la ejecución.

---

### Etapa 1: Análisis de componentes

Antes de ejecutar el programa completo, se realizó una verificación por módulos para detectar posibles fallos lógicos. El proceso se desarrolló de la siguiente manera:

#### 1. Inicialización de variables (`j=1`, `sum=0`)

- **Procedimiento:** Se analizó el segmento de código que asigna los valores iniciales. Se utilizó el simulador Hack para observar el contenido de las direcciones de memoria asignadas a `j` y `sum`.
- **Resultado esperado:** `j` debe contener el valor 1 y `sum` el valor 0 antes de ingresar al bucle.
- **Resultado observado:** Coincidió con lo esperado, lo que garantiza una base correcta para el ciclo.

#### 2. Condición de control del bucle (`j > 100`)

- **Procedimiento:** Se colocaron puntos de interrupción en la línea previa al salto condicional para verificar si el flujo de ejecución abandona el bucle en el momento preciso.
- **Resultado esperado:** El programa debe salir del bucle únicamente cuando `j` supere 100.
- **Resultado observado:** El salto hacia la etiqueta `(END)` se ejecutó correctamente cuando `j` fue igual a 101, lo que confirma que la condición es funcional.

#### 3. Acumulación progresiva (`sum = sum + j`)

- **Procedimiento:** Se ejecutó el programa en modo paso a paso para observar el incremento de `sum` en las primeras iteraciones.
- **Comprobación teórica:**
  - Iteración 1 → `sum = 0 + 1 = 1`
  - Iteración 2 → `sum = 1 + 2 = 3`
  - Iteración 3 → `sum = 3 + 3 = 6`
- **Resultado observado:** Los valores en memoria coincidieron con los resultados teóricos, validando la correcta operación de la instrucción de suma.

#### 4. Incremento de la variable de control (`j = j + 1`)

- **Procedimiento:** Se observó la variable `j` a lo largo de varias iteraciones para asegurar que avanzara en una secuencia aritmética de diferencia 1.
- **Resultado observado:** La secuencia `1, 2, 3, …` se mantuvo sin errores.

---

### Etapa 2: Validación integral del programa

Tras confirmar el correcto funcionamiento de cada bloque, se procedió a la ejecución continua sin interrupciones.

- **Condición inicial:** `j=1`, `sum=0`
- **Condición final esperada:** `sum = 5050` al llegar a `(END)`
- **Resultado observado:** El valor de `sum` al finalizar fue exactamente **5050**, lo que coincide con la fórmula teórica de la suma de una progresión aritmética:  

$$
S = \frac{n(n+1)}{2} = \frac{100 \cdot 101}{2} = 5050
$$

---

### Video de prueba

<video controls src="CapturasYVideos/Grabación de pantalla 2025-08-11 164511.mp4" title="Title"></video>


## ACTIVIDAD 2


- Transforma el programa en alto nivel anterior para que utilice un ciclo <span style="color:red">for</span> en vez de un ciclo <span style="color:red">while</span>

    el código dado fue el siguiente:

    ```cpp
    int i = 1;
    int sum = 0;
    While (i <= 100){
        sum += i;
        i++;
    }
    ```

    Haciendo el debido cambio de un ciclo `for`

    ```cpp
    int sum = 0;
    for (int j = 1; j <= 100; j++) {
        sum += j;
    }
    ```


## RAE Actividad 2

Durante esta actividad se buscó comprobar el funcionamiento de un programa que suma los números del 1 al 100, primero escrito con un ciclo while y luego transformado a un ciclo for.

En las pruebas por partes, se verificó que las variables se inicializaran correctamente (sum = 0 y j = 1), que la condición j <= 100 permitiera recorrer todo el rango, y que la operación de acumulación (sum += j) sumara correctamente en cada iteración. Para confirmar esto, se realizaron pruebas con rangos reducidos (por ejemplo, hasta 5) y se compararon los resultados con la suma manual.

En la prueba final del programa completo, se contrastó el resultado obtenido con el valor esperado según la fórmula matemática de la suma de los primeros n números naturales, obteniendo 5050 en ambos casos. Esto confirma que el cambio de estructura de control no alteró la funcionalidad del programa.

### Foto prueba programa actividad 2

![Foto prueba programa](<CapturasYVideos/Captura de pantalla 2025-08-11 170144.png>)


## ACTIVIDAD 3

El codigo suma los numeros del 1 al 100, este mismo se ejecuta en la ROM para que el resultado sea guardado en la RAM[1], donde en la RAM[0] se muestran los numeros del 1 hacia adelante y en la RAM[2] se pone el numero limite que es el 100. Este codigo fue probado en el CPU emulator de nand2tetris, y puedo afirmar que funciona correctamente, al llegar al resultado 5050 el programa se detiene.

## RAE2 Actividad 3

En esta actividad se analizó y probó una traducción a lenguaje ensamblador de un ciclo `for` que recorre un rango de valores, acumulando resultados en un registro.

### Pruebas por partes

1. **Inicialización**:  
   - `R0` se configuró con el valor inicial del contador (`1`).
   - `R1` se usó como acumulador, inicializado en `0`.
   - `R2` se estableció como límite superior (`100`).
2. **Condición del ciclo**:  
   - Se comprobó que la instrucción `D=D-M` y el salto `D;JGT` evaluaran correctamente si el contador había sobrepasado el límite.
3. **Cuerpo del ciclo**:  
   - Se verificó que `M=D+M` en `@R1` sumara el valor del contador al acumulador.
4. **Incremento**:  
   - Se validó que `M=M+1` en `@R0` incrementara el contador en cada iteración.

### Prueba del programa completo
Se ejecutó la rutina completa y se observó que:
- El ciclo se repetía mientras `R0 <= R2`.
- El acumulador `R1` contenía al final la suma de los números del 1 al 100.
- El programa terminaba en la etiqueta `(END)` sin errores.

**Resultado:** El comportamiento replicó de forma correcta la lógica de un ciclo `for` en lenguaje ensamblador, acumulando el resultado esperado.

### Foto prueba programa actividad 3

![RAE2 Actividad 3](<CapturasYVideos/Captura de pantalla 2025-08-11 181642.png>)


## ACTIVIDAD 4 (no se hace¿)

Se realizó el debido analisis

## ACTIVIDAD 5 

Traduce el siguiente programa a Ensamblador

```cpp
int var = 10; // este código crea un valor entero llamado var y lo inicializa con 10
int *punt; // este es el puntero
punt = &var; // acá lo que hace es que de cierta forma dice "el puntero mira en dirección a donde está la variable ..."
*punt = 20; // posteriormente acá de cierta forma dice "Lo que está dentro de la variable que está mirando el puntero va a ser igual a... "
```

## RAE Actividad 5

En esta actividad se probó un programa en lenguaje ensamblador que trabaja con direcciones y punteros simulados.  
El objetivo fue asignar un valor inicial a una variable, guardar su dirección en un puntero y luego modificar su contenido usando ese puntero.

### Pruebas por partes
1. Se verificó que `var` recibiera el valor **10** directamente.
2. Se comprobó que `punt` almacenara correctamente la **dirección** de `var`.
3. Se validó que, accediendo a través de `punt`, se pudiera cambiar el valor de `var` a **20**.

### Prueba del programa completo
Se observó la ejecución paso a paso para confirmar que al final del programa la variable `var` quedara con el valor **20**,  
y que el flujo terminara correctamente en la etiqueta `(END)`.

**Resultado:** El comportamiento coincidió con lo esperado, demostrando que la manipulación mediante punteros funciona según lo diseñado.

### Foto prueba programa actividad 5

![Actividad 5](<CapturasYVideos/Captura de pantalla 2025-08-11 173025.png>)


## ACTIVIDAD 6 (no se hace¿)

Se realizó el debido analisis

## ACTIVIDAD 7

Traduce el siguiente programa a Ensamblador

```cpp
int var = 10;
int bis = 5;
int *p_var;
p_var = &var;
bis = *p_var;
```

## RAE Actividad 7

En esta actividad se probó un programa en ensamblador que realiza asignaciones directas y manipulación básica de variables y direcciones en memoria.

### Pruebas por partes
1. **Asignación de valores**:  
   - `@10` y `M=D` establecieron la variable `var` en **10**.  
   - `@5` y `M=D` asignaron **5** a la variable `bis`.
2. **Trabajo con direcciones**:  
   - Se usó `D=A` sobre `@var` para obtener su dirección y guardarla en `pvar`.
   - Posteriormente, se sobrescribió `bis` con la misma dirección, confirmando que podía almacenar referencias en lugar de valores.

### Prueba del programa completo
Al ejecutar el flujo completo, se verificó que:
- `var` quedara con valor **10**.
- `bis` terminara almacenando la dirección de `var` (sobrescribiendo el valor 5 inicial).
- `pvar` también contuviera la dirección de `var`.

**Resultado:** Las pruebas confirmaron que las instrucciones asignaban correctamente valores y direcciones, cumpliendo el comportamiento esperado de manipulación básica de variables y punteros simulados.

### Foto prueba programa actividad 7

![RAE Actividad 7](<CapturasYVideos/Captura de pantalla 2025-08-11 184218.png>)


## Actividad 8

- ¿Qué hace esto `int *pvar;`?

    - Ese es el puntero, en este momento solo está referenciado pero posteriormente este se encarga de que cuando se desee enviar un valor para que se ocupe dentro de una variable, lo que este va a hacer es que va a servir de receptor para luego enviarlo.

- ¿Qué hace esto `pvar = var;`?

    - Lo que hace esta parte es que la posición que ocupa `var` se va a almacenar dentro de `pvar`

- ¿Qué hace esto `var2 = *pvar`?

    - Lo que hace esta parte es que el valor que está dentro de `var2` ser va a igualar a lo que hay dentro de `*pvar` por ejemplo si dentro de `*pvar` (el puntero) está almacenado por ejemplo `20` dentro de `var2` se va a almacenar `20`.

- ¿Qué hace esto `pvar = &var3`?

    - Suponiendo que antes de eso se declaró a `pvar` como un puntero, entonces lo que hace la linea de código descrit anteriormente es que `pvar` va a apuntar a la dirección de `var3` y la va a almacenar.


## Actividad 9

Considera que el punto de entrada del siguiente programa es la función main, es decir, el programa inicia llamando la función main. Vas a proponer una posible traducción a lenguaje ensamblador de la función suma, cómo llamar a suma y cómo regresar a std::cout << "El valor de c es: " << c << std::endl; una vez suma termine.

- Programa sugerido:

```cpp
#include <iostream>

int suma(int a, int b) {
   int var = a + b;
   return var;
}


int main() {
   int c = suma(6, 9);
   std::cout << "El valor de c es: " << c << std::endl;
   return 0;
}
```

## RAE 2 Actividad 9

En esta actividad se realizó una traducción parcial a lenguaje ensamblador del programa en C++ que define una función `suma` y la llama desde `main` para mostrar el resultado.

### Pruebas por partes
1. **Carga de valores**: Se verificó que `@6` y `@9` cargaran correctamente los operandos en registros y que la instrucción `D=D+A` realizara la suma.
2. **Almacenamiento**: Se confirmó que el resultado de la suma se guardara en la variable `var` mediante `M=D`.
3. **Recuperación del valor**: Se comprobó que `D=M` obtuviera el valor almacenado en `var`.
4. **Simulación de salida**: Se validó que asignar `M=D` en la dirección `@SCREEN` simulase el envío del resultado a salida (en lugar de `std::cout`).

### Prueba del programa completo
Se ejecutó el flujo completo, confirmando que la suma de 6 y 9 producía el valor **15**, que se guardaba y luego se enviaba a la dirección de salida simulada. El programa finalizó correctamente en la etiqueta `(END)`.

**Resultado:** El comportamiento coincidió con la lógica esperada del programa en C++, demostrando que la conversión a ensamblador preservó la funcionalidad principal.

### Foto prueba programa actividad 9

![RAE 2 Actividad 9](<CapturasYVideos/Captura de pantalla 2025-08-11 174311.png>)






