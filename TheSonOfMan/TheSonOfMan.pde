import gab.opencv.OpenCV;
import processing.video.Capture;
import java.awt.Rectangle;

Capture cam;
OpenCV faceCascade;
Rectangle[] faces;
PImage bowlerHat;

void setup() {
  size(640, 480);
  imageMode(CENTER);

  cam = new Capture(this, width, height);
  cam.start();

  faceCascade = new OpenCV(this, width, height);
  faceCascade.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  bowlerHat = loadImage("Magritte_Apple_Bowler_Hat.png");
}

void draw() {
  if (cam.available()) {
    cam.read();
  }

  faceCascade.loadImage(cam);
  faces = faceCascade.detect();

  set(0, 0, cam);

  for (Rectangle face : faces) {
    image(bowlerHat,
          face.x + face.width/2, face.y,
          face.width * 1.2, face.height * 1.2);
  }
}
