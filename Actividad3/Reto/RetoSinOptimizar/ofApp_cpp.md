```cpp
#include "ofApp.h"

void ofApp::setup() {
	ofBackground(0);
	cam.setDistance(600);

	gridWidth = ofGetWidth();
	gridHeight = ofGetHeight();

	generateSpheres();
}

void ofApp::generateSpheres() {
	spherePositions.clear();
	for (int x = -gridWidth / 2; x < gridWidth / 2; x += xStep) {
		for (int y = -gridHeight / 2; y < gridHeight / 2; y += yStep) {
			float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
			spherePositions.push_back(glm::vec3(x, y, z));
		}
	}
}

void ofApp::draw() {
	cam.begin();

	for (auto& pos : spherePositions) {
		if (sphereSelected && pos == selectedSpherePos) {
			ofSetColor(255, 0, 0);
		}
		else {
			ofSetColor(255);
		}
		ofDrawSphere(pos, 5.0);
	}

	cam.end();

	if (sphereSelected) {
		ofSetColor(255);
		ofDrawBitmapString("Esfera seleccionada: (" +
			ofToString(selectedSpherePos.x) + ", " +
			ofToString(selectedSpherePos.y) + ", " +
			ofToString(selectedSpherePos.z) + ")", 20, 20);
	}
}

void ofApp::mousePressed(int x, int y, int button) {
	glm::vec3 rayStart, rayEnd;
	convertMouseToRay(x, y, rayStart, rayEnd);

	sphereSelected = false;
	for (auto& pos : spherePositions) {
		glm::vec3 intersectionPoint;
		if (rayIntersectsSphere(rayStart, rayEnd - rayStart, pos, 5.0, intersectionPoint)) {
			selectedSpherePos = pos;
			sphereSelected = true;
			break;
		}
	}
}

void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd) {
	glm::mat4 modelview = cam.getModelViewMatrix();
	glm::mat4 projection = cam.getProjectionMatrix();
	ofRectangle viewport = ofGetCurrentViewport();

	float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
	float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

	glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f);
	glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);

	glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
	glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

	rayStartWorld /= rayStartWorld.w;
	rayEndWorld /= rayEndWorld.w;

	rayStart = glm::vec3(rayStartWorld);
	rayEnd = glm::vec3(rayEndWorld);
}

bool ofApp::rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint) {
	glm::vec3 oc = rayStart - sphereCenter;

	float a = glm::dot(rayDir, rayDir);
	float b = 2.0f * glm::dot(oc, rayDir);
	float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

	float discriminant = b * b - 4 * a * c;

	if (discriminant < 0) {
		return false;
	}
	else {
		float t = (-b - sqrt(discriminant)) / (2.0f * a);
		intersectionPoint = rayStart + t * rayDir;
		return true;
	}
}

void ofApp::keyPressed(int key) {
	switch (key) {
	case OF_KEY_UP:
		amplitud += 10;
		break;
	case OF_KEY_DOWN:
		amplitud -= 10;
		break;
	case OF_KEY_RIGHT:
		distDiv += 10;
		break;
	case OF_KEY_LEFT:
		distDiv -= 10;
		break;
	case '+':
		xStep += 5;
		yStep += 5;
		break;
	case '-':
		xStep = max(5, xStep - 5);
		yStep = max(5, yStep - 5);
		break;
	}

	generateSpheres();
}

```