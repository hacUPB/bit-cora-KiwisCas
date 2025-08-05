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

### RAE2


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

## ACTIVIDAD 3 (PENDIENTE, NO ENTENDÍ)

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

## ACTIVIDAD 7

Traduce el siguiente programa a Ensamblador

```cpp
int var = 10;
int bis = 5;
int *p_var;
p_var = &var;
bis = *p_var;
```

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




