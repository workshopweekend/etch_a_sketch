// Etch-a-Sketch
// based on a sketch by Trevor Shannon

import processing.serial.*;

Serial port;
String serialInterface = "/dev/tty.usbmodem-blah";
int lastX = -1;
int lastY = -1;

void setup() {
  size(512, 512);
  background(255);
  port = new Serial(this, serialInterface, 9600);  
  port.bufferUntil('\n');
}

void handleData(int x, int y) {
  if (lastX >= 0 && lastY >= 0) {
    line(x, y, lastX, lastY);
  }
  lastX = x;
  lastY = y;
}  

void draw() {
  // nothing to do here
}

void mouseClicked() {
  background(255);
}

void serialEvent(Serial p) {
  int[] parts = int(p.readString().trim().split(","));
  if (parts.length == 2) {
    int x = parts[0]/2;
    int y = parts[1]/2;

    handleData(x, y);
  }    
}
