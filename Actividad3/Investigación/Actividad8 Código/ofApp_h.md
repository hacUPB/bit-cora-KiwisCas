```cpp
#pragma once
#include "ofMain.h"

class Circle {
public:
	float x, y, r;
	ofColor color;

	Circle(float x_, float y_, float r_, ofColor c) {
		x = x_;
		y = y_;
		r = r_;
		color = c;
	}

	void move(float dx, float dy) {
		x += dx;
		y += dy;
	}

	void draw() {
		ofSetColor(color);
		ofDrawCircle(x, y, r);
	}
};

// PUNTERO GLOBAL

extern Circle * globalCircle;

class ofApp : public ofBaseApp {
public:
	Circle * heapCircle; // objeto en el heap

	void setup();
	void update();
	void draw();
	void exit();
};
```