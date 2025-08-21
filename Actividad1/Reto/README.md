
## Objetivo

El propósito de estas actividades es profundizar en el uso del lenguaje ensamblador Hack, incluyendo operaciones con registros, memoria RAM, instrucciones de control de flujo (condicionales y saltos), manejo de ciclos, lectura de teclado y dibujo en pantalla.

---

## Proceso

1. Analizar cada enunciado.
2. Realizar o convertir las instrucciones a lenguaje ensamblador Hack respetando la sintaxis aprendida.
3. Validar las soluciones en la plataforma oficial de [Nand2Tetris](https://nand2tetris.github.io/web-ide/cpu/).
4. Comparar comportamientos esperados vs observados en la RAM, pantalla o ROM.
5. Optimizar el código cuando sea posible para reducir instrucciones.
6. Realizar anotaciones sobre etiquetas, constantes, condiciones y saltos.

---

## Resultados

- Se implementaron más de 15 programas funcionales en lenguaje ensamblador Hack.
- Se tradujeron estructuras de alto nivel como `if`, `for`, `goto`, lectura de arreglos y control de flujo condicional.
- Se logró dibujar gráficos en pantalla manipulando directamente las posiciones de memoria del bitmap (`@SCREEN`) y reaccionar a eventos como presionar teclas (`@KBD`).
- Se interpretaron correctamente programas binarios en lenguaje de máquina, identificando operaciones ALU, saltos y accesos a memoria.

---

## Aprendizajes

- Comprensión profunda de los registros `A`, `D`, `M`, `PC` y cómo se combinan para acceder o modificar datos.
- Uso de instrucciones tipo `A` y tipo `C` para crear lógica condicional, bucles y estructuras de control.
- Cómo el compilador traduce variables simbólicas a posiciones físicas en memoria (ej. `i`, `sum`, `arr[0]`...).
- Estructura de un programa Hack: inicio, etiquetas, condiciones, saltos, y finalización.
- Diferencia entre memoria de datos (RAM) y de instrucciones (ROM).

---

## Dificultades y soluciones

| Dificultad | Solución |
|------------|----------|
| Errores de lógica por confusión entre `D=A`, `D=M`, `M=D` | Se hizo uso de diagramas y pruebas paso a paso en la web IDE |
| Confusión con uso de etiquetas (`(LOOP)`, `(END)`) y saltos | Se repasaron reglas de salto condicional (JEQ, JGT, JLT, etc.) y se testeó su funcionamiento en ROM |
| Dificultad para manipular memoria indirecta | Se reforzó el uso de `D=M`,  `A=D+A`, `D=M`, etc. |
| Traducción de estructuras `for` y `if-else` a ensamblador | Se analizaron ejemplos detalladamente y se reescribieron en lógica Hack |

---

## Conclusiones

Este conjunto de ejercicios permitie adquirir los conocimientos en lenguaje ensamblador Hack y entender en detalle cómo una máquina digital moderna ejecuta instrucciones simples para resolver tareas complejas. Aprender a escribir directamente en ensamblador aunque resulta inicialmente un poco complejo, ayuda a desarrollar una mentalidad estructurada y precisa para la resolución de problemas. Además, se puede empezar a realizar ideas sobre cómo operan los lenguajes de alto nivel al ser compilados o interpretados.


