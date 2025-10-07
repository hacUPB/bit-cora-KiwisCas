# Bitácora — Sistema de partículas con patrones de diseño



## 1. Objetivo

En esta actividad se analiza un proyecto en openFrameworks que usa tres patrones de diseño: **Observer**, **Factory** y **State**. La idea es entender qué hace cada uno, probar el código y hacerle algunas modificaciones para ver cómo cambia el comportamiento de las partículas.

---

## 2. Descripción general

El programa crea un montón de partículas que se mueven en la pantalla. Cuando se presionan teclas como `a`, `r`, `s` o `n`, las partículas cambian su forma de moverse (se atraen, se repelen, se detienen o vuelven a lo normal).

Cada partícula tiene un estado que define cómo se comporta, y el programa principal (`ofApp`) les avisa a todas cuando hay un cambio.

---

## 3. Qué hace cada patrón

### 3.1 Patrón **Observer**

Este patrón sirve para que unas clases (observadores) se enteren cuando pasa algo en otra (el sujeto).
En este caso, `ofApp` es el sujeto y las `Particle` son los observadores.

* Cuando se presiona una tecla, `ofApp` usa `notify("evento")` para avisar a todas las partículas.
* Cada partícula recibe ese evento en `onNotify()` y cambia su estado dependiendo del evento.

**Ejemplo:** si se presiona `a`, el evento es `"attract"` y las partículas cambian al estado `AttractState`.

**En resumen:** el patrón Observer permite que todas las partículas reaccionen al mismo tiempo sin que el programa principal tenga que controlarlas una por una.

### 3.2 Patrón **Factory**

Este patrón sirve para crear objetos sin tener que escribir todo el código de creación cada vez.

En este programa hay una clase `ParticleFactory` que tiene un método `createParticle(type)`.

Dependiendo del tipo que se pase, crea partículas diferentes:

* **"star"**: pequeña y blanca.
* **"shooting_star"**: más rápida y verde.
* **"planet"**: más grande y azul.

Esto hace más fácil crear distintos tipos sin repetir código.

**Ejemplo:**

```cpp
Particle* p = ParticleFactory::createParticle("star");
```

### 3.3 Patrón **State**

Este patrón permite cambiar el comportamiento de un objeto dependiendo de su estado.

Cada partícula tiene un puntero `state` que puede apuntar a diferentes estados:

* `NormalState`: se mueve libremente.
* `AttractState`: se acerca al mouse.
* `RepelState`: se aleja del mouse.
* `StopState`: se detiene.

Cuando llega un evento (por ejemplo, `"attract"`), la partícula cambia de estado y empieza a comportarse distinto.

**En resumen:** el patrón State ayuda a cambiar el comportamiento de las partículas sin usar muchos `if` o `switch` dentro de `update()`.

---

## 4. Cambios realizados y experimentos

### 4.1 Nuevo tipo de partícula: **comet**

Agregué un tipo de partícula más en la fábrica:

```cpp
else if (type == "comet") {
    particle->size = ofRandom(3, 6);
    particle->color = ofColor(255, 200, 0);
    particle->velocity *= 6;
}
```

Resultado: los cometas son más rápidos y de color amarillo/naranja, se ven muy bien cuando se mueven por la pantalla.

### 4.2 Nuevo estado: **OrbitState**

Agregué un estado para que las partículas orbiten alrededor del mouse:

```cpp
class OrbitState : public State {
public:
    void update(Particle* p) override {
        ofVec2f center(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
        ofVec2f dir = p->position - center;
        float angle = atan2(dir.y, dir.x);
        angle += 0.08f;
        float r = dir.length();
        p->position = center + ofVec2f(cos(angle), sin(angle)) * r;
    }
};
```

Evento:

```cpp
else if (event == "orbit") {
    setState(new OrbitState());
}
```

Y en `keyPressed`:

```cpp
else if (key == 'o') {
    notify("orbit");
}
```

Resultado: las partículas giran alrededor del mouse cuando se presiona la tecla `o`.

### 4.3 Nuevo estado: **ExplodeState**

Hice un estado para que las partículas exploten desde el mouse:

```cpp
class ExplodeState : public State {
public:
    void onEnter(Particle* p) override {
        ofVec2f center(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
        ofVec2f dir = p->position - center;
        dir.normalize();
        p->velocity = dir * ofRandom(3, 6);
        p->color = ofColor::fromHsb(ofRandom(255), 200, 255);
    }
    void update(Particle* p) override {
        p->position += p->velocity;
        p->velocity *= 0.98f;
    }
};
```

Evento y tecla:

```cpp
else if (event == "explode") {
    setState(new ExplodeState());
}
// tecla e
```

Resultado: las partículas salen disparadas y cambian de color, se ve como una explosión.

---

## 5. Resultados

* Al presionar **A**, las partículas se acercan al mouse.
* Al presionar **R**, se alejan.
* Al presionar **S**, se detienen.
* Al presionar **O**, orbitan.
* Al presionar **E**, explotan.

Los cambios funcionaron bien y ayudaron a entender cómo cada patrón trabaja en conjunto.

---

## 6. Conclusiones

* El patrón **Observer** permite que muchas partículas reaccionen al mismo tiempo cuando pasa algo.
* El **Factory** facilita crear distintos tipos de partículas sin repetir código.
* El **State** hace que cada partícula pueda comportarse de formas diferentes sin complicar el código.

Aprendí que los patrones de diseño ayudan a que el código sea más ordenado, fácil de entender y de modificar. También me di cuenta de que hay que tener cuidado con la memoria al usar `new` y `delete`.

---

## 7. Ideas para mejorar

* Usar punteros inteligentes (`unique_ptr`) para no tener que borrar manualmente los objetos.
* Crear más estados con comportamientos raros (por ejemplo, que sigan trayectorias curvas o cambien de color lentamente).
* Agregar una interfaz con botones en vez de usar solo teclas.
* Mostrar texto en pantalla con el estado actual o el número de partículas.

---

**Fin de la bitácora**
