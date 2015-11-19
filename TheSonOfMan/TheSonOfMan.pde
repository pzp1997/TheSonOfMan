import gab.opencv.OpenCV;
import processing.video.Capture;
import java.awt.Rectangle;

Capture cam;
OpenCV opencv;
Rectangle[] faces;
PImage bowlerHat;

void setup() {
  size(640, 480);
  
  cam = new Capture(this, width, height);
  cam.start();
  
  opencv = new OpenCV(this, width, height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  bowlerHat = loadImage("Magritte_Apple_Bowler_Hat.png");
}

void draw() {
  if (cam.available()) {
    cam.read();
  }
  
  opencv.loadImage(cam);
  faces = opencv.detect();

  set(0, 0, cam);

  for (int i = 0; i < faces.length; i++) {
    image(bowlerHat, faces[i].x, faces[i].y-faces[i].width/2, faces[i].width, faces[i].height);
  }
}
