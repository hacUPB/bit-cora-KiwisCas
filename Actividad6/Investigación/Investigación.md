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

### 4.1 Nuevo tipo de partícula: **galaxy**

Agregué un tipo de partícula más en la fábrica:

```cpp
else if (type == "galaxy"){
	particle->size = ofRandom(8, 12);
	particle->color = ofColor(255, 0, 255);
}
```

Resultado: se crean Galaxias, las cuales son las más grandes y son de color entre rosado y morado.

### 4.2 Nuevo estado: **RandomState**

Agregué un estado para que las partículas orbiten alrededor del mouse:

```cpp
void RandomState::update(Particle* particle) {
	ofVec2f randomTarget(ofRandom(ofGetWidth()), ofRandom(ofGetHeight()));

	ofVec2f direction = randomTarget - particle->position;
	direction.normalize();

	particle->velocity += direction * 0.05;
	ofClamp(particle->velocity.x, -3, 3);
	ofClamp(particle->velocity.y, -3, 3);

	particle->position += particle->velocity * 0.2;
}
```

Evento:

```cpp
else if (event == "random") {
		setState(new RandomState());
}
```

Y en `keyPressed`:

```cpp
else if (key == 'g') {
		notify("random");
}
```

Resultado: las partículas giran de forma aleatoria cuando se presiona la tecla `g`.


---

## 5. Resultados

* Al presionar **A**, las partículas se acercan al mouse.
* Al presionar **R**, se alejan.
* Al presionar **S**, se detienen.
* Al presionar **G**, se mueven al azar.

Los cambios funcionaron bien y ayudaron a entender cómo cada patrón trabaja en conjunto.

---

## 6. Conclusiones

* El patrón **Observer** permite que muchas partículas reaccionen al mismo tiempo cuando pasa algo.
* El **Factory** facilita crear distintos tipos de partículas sin repetir código.
* El **State** hace que cada partícula pueda comportarse de formas diferentes sin complicar el código.

Aprendí que los patrones de diseño ayudan a que el código sea más ordenado, fácil de entender y de modificar. También me di cuenta de que hay que tener cuidado con la memoria al usar `new` y `delete`.

---

