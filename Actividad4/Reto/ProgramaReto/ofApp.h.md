```cpp
#pragma once
#include "Particle.h"
#include "ofMain.h"
#include <stack>
#include <vector>

class ofApp : public ofBaseApp {
public:
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
	void mouseMoved(int x, int y);
	~ofApp(); // Destructor para liberar memoria

	std::vector<Particle *> particles; // almacena partículas activas
	std::stack<Particle *> removed; // pila para partículas eliminadas
	int maxParticles = 200;

	ofVec2f attractor; // bolita roja
	ofVec2f minBound, maxBound;
};

```