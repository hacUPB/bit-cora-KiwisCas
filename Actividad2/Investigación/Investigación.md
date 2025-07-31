# <span style ="color:orange">Actividad 2</span>

## ¿Qué es la entrada-salida mapeada a memoria?

La entrada-salida mapeada a memoria es una técnica en la cual los dispositivos de entrada y salida como por ejemplo el teclado y la pantalla, se comunican con el procesador mediante direcciones específicas de la memoria.

> Es decir, que en lugar de usar intrucciones especiales de entrada y/o salida, el procesador lee o escribe en ciertas direcciones de la memoria RAM para poder interactuar con los periféricos. 

Pongamos por ejemplo  

| Dispositivo         | Dirección de memoria asignada      | ¿Qué hace?                                    |
| ------------------- | ---------------------------------- | --------------------------------------------- |
| Pantalla (`SCREEN`) | desde `16384` hasta `16384 + 8191` | Cada palabra representa 16 píxeles            |
| Teclado (`KBD`)     | `24576`                            | Guarda el código ASCII de la tecla presionada |



## ¿Cómo se implementa en la plataforma Hack?

Por medio del dispositivo de entrada que es el teclado en la dirección (`@KBD`) o en posición (`24576`) ya que si una tecla es presionada, en esta dirección se guardará su valor ASCII, en caso de que no se esté presionando nada contendrá 0.

Y el dispositivo de salida que es la pantalla cuya dirección inicial está dada por la abreviación (`@SCREEN`) o en la posición (`@16384`), dicho de cierta forma, cada "palabra" de 16 bits representa una fila de 16 pixeles en blanco o negro y estos valores se encienden por medio de valores binarios asignados a cada posición de la RAM


## Investiga el funcionamiento del programa con el simulador.

El programa hace que:

- El valor leído desde @KBD se compara con ASCII 'a' (97) o 'b' (98).

- Si coincide, el programa salta a DRAW o CLEAR.

- Al escribir en @SCREEN, la pantalla cambia.

- Todo esto es posible gracias a que el teclado y la pantalla están mapeados a direcciones de memoria.