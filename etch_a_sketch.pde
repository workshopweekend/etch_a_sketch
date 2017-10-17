// Etch-a-Sketch
// based on a sketch by Trevor Shannon

import processing.serial.*;

Serial port;
String serialInterface = "/dev/cu.usbmodem-blah";
int lastX = -1;
int lastY = -1;
int x;
int y;
String nextXY;

void setup() {
  size(512, 512);
  background(255);
  port = new Serial(this, serialInterface, 9600);  
  port.bufferUntil('\n');
}

void draw() {
  String[] parts = splitTokens(nextXY);
  
  if (parts.length < 2) {
    return;
  }
  x = int(parts[0])/2;
  y = int(parts[1])/2;
  
  if (lastX >= 0 && lastY >= 0) {
    line(x, y, lastX, lastY);
  }
  lastX = x;
  lastY = y;
}

void mouseClicked() {
  background(255);
}

void serialEvent(Serial p) {
  nextXY = p.readString();
}
