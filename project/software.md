1. Download [Processing](http://processing.org/download/?processing), an easy-to-use graphics programming development environment.

2. Upload the following code to your Arduino:
    <%= xy_test.ino =%>
3. Verify that your Arduino is sending frequent X and Y coordinates by clicking on the __Serial Monitor__ button in the Arduino window.

4. Close the Serial Monitor and open Processing.

5. Copy the following code into a new Processing sketch:
    <%= etch_a_sketch.ino =%>
6. Replace the string:
    <%= string.ino =%>
with the serial port that appears in the lower-right of your Arduino window.

7. Run the Processing sketch, and rotate the potentiometers!