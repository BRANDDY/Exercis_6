import processing.video.*;

Capture capture;
int videoWidth = 320;
int videoHeight = 240;
int videoFps = 30;
PGraphics pg;

void setupCapture(int which camera) {
  String[] cameraNames = capture.list();//this way is not working on my computer
  for (String cameraName : cameraNames) {
    capture = new Capture(this, cameraNames[whichCamera]);  
  }
  //search from google,that one working but I don't know why
  //capture = new Capture(this, videoWidth ,videoHeight,"pipeline:autovideosrc"); 
  pg = createGraphics(videoWidth, videoHeight, P3D);
  capture.start();
}

void captureEvent(Capture c) {
  c.read();
  armUpdateOpenCV = true;
}

