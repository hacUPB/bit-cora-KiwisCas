```cpp
#include "ofApp.h"

// Definición del puntero global
Circle * globalCircle = nullptr;

//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);

	// Crear objeto en GLOBAL (pero inicializado en setup)
	globalCircle = new Circle(200, 200, 60, ofColor::red);

	// Crear objeto en HEAP
	heapCircle = new Circle(300, 200, 50, ofColor::blue);
}

//--------------------------------------------------------------
void ofApp::update() {
	// Mover el círculo del heap en horizontal
	heapCircle->move(1.0, 0);

	if (heapCircle->x > ofGetWidth()) {
		heapCircle->x = 0;
	}
}

//--------------------------------------------------------------
void ofApp::draw() {
	// Dibujar objeto en memoria GLOBAL (rojo)
	if (globalCircle != nullptr) {
		globalCircle->draw();
		ofDrawBitmapStringHighlight("Global (rojo)", globalCircle->x - 40, globalCircle->y - 60);
	}

	// Dibujar objeto en memoria HEAP (azul)
	heapCircle->draw();
	ofDrawBitmapStringHighlight("Heap (azul)", heapCircle->x - 40, heapCircle->y - 60);

	// Dibujar objeto en memoria STACK (verde)
	Circle stackCircle(ofGetMouseX(), ofGetMouseY(), 40, ofColor::green);
	stackCircle.draw();
	ofDrawBitmapStringHighlight("Stack (verde)", stackCircle.x - 40, stackCircle.y - 60);
}

//--------------------------------------------------------------
void ofApp::exit() {
	delete heapCircle;
	heapCircle = nullptr;

	delete globalCircle;
	globalCircle = nullptr;
}

```