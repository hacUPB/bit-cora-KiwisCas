```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofSetFrameRate(60);
	ofBackground(0);

	minBound.set(50, 50);
	maxBound.set(ofGetWidth() - 50, ofGetHeight() - 50);

	attractor.set(ofGetWidth() / 2, ofGetHeight() / 2);

	// Inicializar partículas
	for (int i = 0; i < maxParticles; i++) {
		ofVec2f pos(ofRandom(minBound.x, maxBound.x),
			ofRandom(minBound.y, maxBound.y));
		Particle * p = new Particle(pos, minBound, maxBound);
		particles.push_back(p);
	}
}

//--------------------------------------------------------------
void ofApp::update() {
	// Actualizar partículas (efecto imán)
	for (auto & p : particles) {
		if (p->active) {
			ofVec2f dir = attractor - p->pos;
			float distance = dir.length();
			if (distance > 0.1) {
				dir.normalize();
				float strength = 0.5;
				p->applyForce(dir * strength * 0.1);
			}
			p->update();
		}
	}
}

//--------------------------------------------------------------
void ofApp::draw() {
	// Dibujar partículas
	for (auto & p : particles) {
		if (p->active) p->draw();
	}

	// Dibujar attractor
	ofSetColor(255, 0, 0);
	ofDrawCircle(attractor, 6);

	// Dibujar cuadro límite
	ofNoFill();
	ofSetColor(255);
	ofDrawRectangle(minBound.x, minBound.y,
		maxBound.x - minBound.x, maxBound.y - minBound.y);
	ofFill();

	// Información
	ofSetColor(255);
	ofDrawBitmapString("Modo: Mouse", 20, 20);
	ofDrawBitmapString("Particulas activas: " + ofToString(particles.size()), 20, 40);
	ofDrawBitmapString("En pila (eliminadas): " + ofToString(removed.size()), 20, 60);
	ofDrawBitmapString("Agregar: '+'  Eliminar: '-'  Recuperar: 'r'", 20, 80);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == '+') {
		if (particles.size() < 500) {
			ofVec2f pos(ofRandom(minBound.x, maxBound.x),
				ofRandom(minBound.y, maxBound.y));
			Particle * p = new Particle(pos, minBound, maxBound);
			particles.push_back(p);
		}
	}

	if (key == '-') {
		if (!particles.empty()) {
			// Mover partícula eliminada a la pila
			removed.push(particles.back());
			particles.pop_back();
		}
	}

	if (key == 'r') {
		// Recuperar última partícula eliminada (desde la pila)
		if (!removed.empty()) {
			particles.push_back(removed.top());
			removed.pop();
		}
	}
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {
	attractor.set(x, y);
}

//--------------------------------------------------------------
ofApp::~ofApp() {
	// Liberar memoria de todas las partículas activas
	for (auto & p : particles) {
		delete p;
	}
	particles.clear();

	// Liberar memoria de todas las partículas en la pila
	while (!removed.empty()) {
		delete removed.top();
		removed.pop();
	}
}


```