# Sesión 1

Analicemos el siguiente caso de estudio, miremos la clase particle:

```cpp
class Particle {
public:
    float x, y;
    void move(float dx, float dy) {
        x += dx;
        y += dy;
    }
};
```

## - ¿Qué representa la clase Particle?

La clase particle representa el movimiento de una partícula en un espacio bidimensional el cual tiene estados determinados por `x` y `y` y un comportamiento determinado por el método `move`.

## - ¿Cómo interactúan sus atributos y métodos?

### **Atributos**

- En la clase `Particle` si se observa el código, `x` y `y` son miembros de datos

- Cada instancia de `Particle` tiene su respectiva copia de `x` y `y`

- Se encarga de representar el estado de esa partícula en particular 

### **Comportamientos** 

- `Move()` es un método miembro: es una función que está asociada a un objeto en especifico.
---

# Explorando la memoria 

## - ¿Los atributos están almacenados de forma contigua?

Si, efectivamente, revisemos la actividad que se plantea en el Notion:

![Direcciones de atributos](../ImagenesYVideos/image.png)

Revisemos los últimos dígitos, podemos ver un `8` y una `C` recordemos que el formato en que se enumeran las direcciones de memoria se hacen bajo el formato de `base 16` donde las direcciones se enumeran de `0 al 9` y de `A a F` se supone que `p1.x` al igual que `p1.y` ocupa un total de 4 bytes, si contamos desde el `8` llegamos hasta la `B` lo que da un total de 4 bytes y si prestamos atención, después de esta `B` es que comienza el siguiente atributo en `C` por lo que podemos decir que efectivamente, los atributos se almacenan de una forma contigua.

## - ¿Qué indica el tamaño del objeto sobre su estructura interna?

Refleja la memoria necesaria para almacenar su estado interno (atributos de instancia + padding + punteros ocultos como vtables si aplica). Este **NO** incluye métodos ni atributos estáticos.

---

# Análisis de diferencias 

## - ¿Cómo afectan los tributos estáticos al tamaño de la instancia?

No lo afectan. Entendamos algo los tributos normales viven dentro de cada instancia, es decir, que cualquiera de estos afectan directamente el tamaño de la clase.

Por otro lado, los atributos estáticos están ubicados en una zona global (un segmento de datos estáticos) por lo que no forman parte del objeto.

## - ¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?


