// Etch-a-Sketch
// based on a sketch by Trevor Shannon

import processing.serial.*;

Serial port;
String serialInterface = "/dev/tty.usbmodel-blah";
int lastX = -1;
int lastY = -1;

void setup() {
  size(512, 512);
  background(255);
  port = new Serial(this, serialInterface, 9600);  
}

void handleData(int x, int y) {
  if (lastX >= 0 && lastY >= 0) {
    line(x, y, lastX, lastY);
  }
  lastX = x;
  lastY = y;
}  

void draw() {
  readSerial();
}

void mouseClicked() {
  background(255);
}

void readSerial() {  
  int x; int y;
  String s;
  while ((s = port.readStringUntil('\n')) != null) {
    String[] parts = s.substring(0, s.length()-2).split(",");
    if (parts.length == 2) {

      x = int(parts[0])/2;
      y = int(parts[1])/2;
      
      handleData(x, y);
    }
  }
}