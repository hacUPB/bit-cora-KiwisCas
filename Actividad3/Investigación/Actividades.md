# Actividad 1

## Configuración y Prueba de OpenFrameworks

### 4. Configura tu proyecto y genera los archivos con la ayuda de la aplicación.

Para verificar que todo quedó correctamente instalado, vamos a realizar un pequeño ejercicio modificando ligeramente el archivo ofApp.cpp que se genera por defecto:

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(255);
    ofDrawCircle(ofGetMouseX(), ofGetMouseY(), 20);
}
```


- ¿Cuál es el resultado que se obtiene al ejecutar este programa?

El programa se encarga de crear un fondo negro y de crear un círculo de radio 20 que se mueve con el movimiento generado por el mouse en la ventana del programa

![Foto prueba](<Capturas/Captura de pantalla 2025-08-18 180316.png>)

# Actividad 2

De nuevo una actividad grupal en la cual escribiremos juntos nuestra primera aplicación y analizaremos las diferentes partes que la componen.

(Código utilizado)

```cpp
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

    public:
        void setup();
        void update();
        void draw();

        void mouseMoved(int x, int y );
        void mousePressed(int x, int y, int button);

    private:

        vector<ofVec2f> particles;
        ofColor particleColor;

};
```

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
    particleColor = ofColor::white;
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    for(auto &pos: particles){
        ofSetColor(particleColor);
        ofDrawCircle(pos.x, pos.y, 50);
    }
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
    particles.push_back(ofVec2f(x, y));
    if (particles.size() > 100) {
        particles.erase(particles.begin());
    }
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
    particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}
```

Analicemos juntos este código:

## ¿Qué fue lo que incluimos en el archivo .h?

En el archivo ```ofApp.h``` se definió a la **clase principal de la aplicación**, la cual hereda de ```ofBaseApp``` ya que esta es la **clase base** de OpenFrameworks que da acceso a funciones por ejemplo ```setup```, ```update``` y ```draw```.

Dentro de ella se incluye funciones publicas y privadas.

- **Funciones públicas:**
    - ```setup()```: La configuración inicial.
    - ```update```: Actualiza las variables y la lógica del programa.
    - ```draw()```: Dibuja en la pantalla.
    - ```mouseMoved()```: Responde cuando el usuario mueve el mouse.
    - ```mousePressed()```: Responde cuando se presiona clic.

- **Funciones privadas:**
    - ```vector<ofVec2f> particles;```: La configuración inicial.
    - ```ofColor particleColor;```: Actualiza las variables y la lógica del programa.

## ¿Cómo funciona la aplicación?

La aplicación crea un sistema de "partículas" sencillo que se encarga de:

1. Agregar una **"estela"** cuando el mouse se mueve.

2. Dibujar los círculos en la pantalla.

3. Estos cambian de color cuando se presiona un botón del mouse.

4. Borra partículas más viejas cuando esta pasa de un máximo de **100** en la pantalla.


## ¿Qué hace la función ```mouseMoved```?

Esta se encarga de que cada vez que el mouse se mueve: 
```cpp
particles.push_back(ofVec2f(x, y));
    if (particles.size() > 100) {
        particles.erase(particles.begin());
    }
```
- Agrega una nueva posición ```(x,y)``` al vector ```particles```
- Si ya hay más de **100** partículas, elimina la posición más antigua(la primera del vector).

## ¿Qué hace la función mousePressed?

Esta se encarga de que cuando se hace clic con alguno de los botones del mouse se asigna un color aleatorio a las partículas (a todas ya que este no se actualiza cada frame) con valores RGB aleatorios y desde ese momento los círculos se dibujan con ese color.

## ¿Qué hace la función setup?

Se ejecuta una sola vez al inicio del programa y se encarga de:
- Poner el fondo en color negro.
- Definir el color por defecto de las partículas en blanco.

## ¿Qué hace la función update?

Esta se encarga usualmente de calcular posiciones, actualizar variables y procesar animaciones o físicas.
En el código que se dió no hay una lógica dinámica aparte del movimiento del mouse por lo que no se usa.

## ¿Qué hace la función draw?

Este dibuja todas las partículas:
- Recorre todas las posiciones almacenadas en ```particles```
- Para cada una, dibuja un círculo de radio 50 en pixeles en ```(x,y)```
- El color del círculo depende del ```particleColor``` (blanco al inicio, si se hace clic cambia a un color aleatorio).

![alt text](<Capturas/Captura de pantalla 2025-08-18 182346.png>)


# Actividad 3 

## Analisis de Código

### Archivo ```ofApp.h```

```cpp
#pragma once

```
se encarga de que el archivo se incluya más de una sola vez durante su compilación.


```cpp
#include "ofMain.h

```

Incluye la librería principal de **OpenFrameworks**, la cual contiene todas las funciones y clases necesarias.

```cpp
class ofApp : public ofBaseApp{
}
```

Define la clase ```ofApp``` que hereda de ```ofBaseApp``` (Clase que da acceso a los eventos principales, es decir, ```setup```,```update```, ```Draw```, mouse, teclado entre muchos otros.)

```cpp
    public:
        void setup();
        void update();
        void draw();

        void mouseMoved(int x, int y );
        void mousePressed(int x, int y, int button);

```

Declara las funciones que se definen futuramente en ```ofApp.cpp```

```cpp
{
    private:
        vector<ofVec2f> particles;
        ofColor particleColor;
};
```

- ```particles```: es un vector que guarda las posiciones (x,y) de las partículas.
- ```particleColor```: color actual de las partículas.


### Archivo ```ofApp.cpp```


```cpp
#include "ofApp.h"

```
Se encarga de incluir la definición de la clase que se creó en el archivo ```.h```

#### ```setup()```

```cpp
void ofApp::setup(){
    ofBackground(0);
    particleColor = ofColor::white;
}
```

- ```ofBackground(0)```: Pone el fondo en Color Negro.
- ```particleColor = ofColor::white; ```: Pone el color inicial de las partículas en blanco.

**SOLO SE EJECUTA UNA SOLA VEZ Y ES AL INICIO**

#### ```update()```

```cpp
void ofApp::update(){
}
```
En este código está vacío. Normalmente se suele poner la lógica para las animaciones o el movimiento.

En este caso no se usa porque todo se maneja desde el mouse.

#### ```draw()```

```cpp
void ofApp::draw(){
    for(auto &pos: particles){
        ofSetColor(particleColor);
        ofDrawCircle(pos.x, pos.y, 50);
    }
}
```

- Se encarga de recorrer todas las posiciones del vector ```particles```.
- ```ofSetColor(particleColor)```: fija el color del dibujo.
- ```ofDrawCircle(pos.x, pos.y, 50);```: dinuja un círculo de radio **50** en la posición ```(x,y)```.

Todas las partículas se dibujan en la ventana.

#### ```mouseMoved()```

```cpp
void ofApp::mouseMoved(int x, int y ){
    particles.push_back(ofVec2f(x, y));
    if (particles.size() > 100) {
        particles.erase(particles.begin());
    }
}
```
- Se encarga de que cada vez que se mueve el mouse, agrega la posición ```(x,y)``` al vector ```particles```.
- Si hay más de 100 partículas, elimina la más antigua (la primera).

#### ```mousePressed()```

```cpp
void ofApp::mousePressed(int x, int y, int button){
    particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}
```

- Cuando se hace clic, se cambia el color de las partículas a uno aleatorio.
- ```ofRandom(255)``` genera un número entre 0 y 255


