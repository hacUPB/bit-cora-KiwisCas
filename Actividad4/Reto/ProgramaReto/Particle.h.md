```cpp
#pragma once
#include "ofMain.h"

class Particle {
public:
	ofVec2f pos, vel, acc;
	ofColor color;
	bool active;

	ofVec2f minBound, maxBound;

	Particle(ofVec2f start, ofVec2f minB, ofVec2f maxB) {
		minBound = minB;
		maxBound = maxB;
		reset(start);
	}

	void reset(ofVec2f start) {
		pos = start;
		vel.set(ofRandom(-0.5, 0.5), ofRandom(-0.5, 0.5));
		acc.set(0, 0);
		color = ofColor(ofRandom(50, 255), ofRandom(50, 255), ofRandom(50, 255));
		active = true;
	}

	void applyForce(ofVec2f force) {
		acc += force;
	}

	void update() {
		vel += acc;
		pos += vel;
		acc.set(0, 0);

		// Mantener dentro del cuadro con rebote
		if (pos.x < minBound.x) {
			pos.x = minBound.x;
			vel.x *= -0.5;
		}
		if (pos.x > maxBound.x) {
			pos.x = maxBound.x;
			vel.x *= -0.5;
		}
		if (pos.y < minBound.y) {
			pos.y = minBound.y;
			vel.y *= -0.5;
		}
		if (pos.y > maxBound.y) {
			pos.y = maxBound.y;
			vel.y *= -0.5;
		}
	}

	void draw() {
		ofSetColor(color);
		ofDrawCircle(pos, 4);
	}
};

```