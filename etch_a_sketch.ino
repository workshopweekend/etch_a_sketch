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
  while (port.available() > 10) {
    String s = port.readStringUntil('\n');

    if (s != null) {
      int index = s.indexOf(",");
      if (index >= 0) {

        x = int(s.substring(0, index))/2;
        y = int(s.substring(index+1, s.length()-2))/2;
        
        handleData(x, y);
      }
    }
  }
}

