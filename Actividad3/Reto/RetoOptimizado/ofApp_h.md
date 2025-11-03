```cpp
#pragma once
#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
	void setup();
	void draw();
	void keyPressed(int key);
	void mousePressed(int x, int y, int button);

	void convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd);
	bool rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir,
		const glm::vec3 & sphereCenter, float sphereRadius,
		glm::vec3 & intersectionPoint);
	void generateSpheres();

	// Datos de instanciado
	ofVboMesh sphereMesh;
	vector<glm::mat4> instanceMatrices;
	vector<ofFloatColor> instanceColors;

	vector<glm::vec3> spherePositions;
	ofEasyCam cam;

	int xStep = 50;
	int yStep = 50;
	float distDiv = 100.0;
	float amplitud = 100.0;

	int gridWidth, gridHeight;
	glm::vec3 selectedSpherePos;
	bool sphereSelected = false;
};

```