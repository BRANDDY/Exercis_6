//how to play
//the target will be eaten when the face very closes to it
//distance: -10 to 10

PVector cameraPos;
PVector targetPos;
PVector facePos;

int targetSize;

void setup() {
  size(640, 480, P3D);
  cameraPos = new PVector(width, 0, 100);
  setTarget();
  setupCapture();
  setupOpenCV();
}

void draw() {
  scale(2);
  background(0);
  updateOpenCV();
  image(pg, 0, 0);
  setFace();
  eatEven();
}

void setFace(){
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
    
  for (int i = 0; i < faces.length; i++) {
    Rectangle face = faces[i];
    if (i == 0) {
      cameraPos.x = face.x - width / 2;   
    }
    rect(face.x, face.y, face.width, face.height);
    facePos=new PVector(face.x,face.y);
  }
  
  updateTarget();  
  pushMatrix();   
  camera(cameraPos.x, cameraPos.y, cameraPos.z, 0, 0, 0, 0, -1, 0);
  noStroke();
  popMatrix();
}

void eatEven(){
  if (facePos!=null){
    if (facePos.x+10>targetPos.x&&facePos.x-10<targetPos.x&&facePos.y+10>targetPos.y&&facePos.y-10<targetPos.y){
    setTarget();
    }
  }
}

void setTarget() {
  targetSize=int (random(40,60));
  targetPos = new PVector(int(random(40, 150)),int(random(40, 150)),0);
  println(targetPos);
}

void updateTarget(){
  fill(#C14444);
  noStroke();
  rect(targetPos.x,targetPos.y,targetSize,targetSize);
}
