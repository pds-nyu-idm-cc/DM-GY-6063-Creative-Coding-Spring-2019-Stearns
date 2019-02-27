float bounds = 200;
float angle1;
float angle2;

void setup() {
  size(800, 800, P3D);
  lights();
}


void draw() {
  background(50);
  spotLight(255, 255, 255, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  drawCube ( width/2, height/2, -100, angle1, angle2 );
}

void drawCube ( float x, float y, float z, float angle, float angleB) {

  pushMatrix();
  translate(x, y, z);

  fill(0);
  if (keyCode== RIGHT) {
    angle1+=.01;
  } else if (keyCode== LEFT) {
    angle1-=.01;
  } else if (keyCode== UP) {
    angle2+=.01;
  } else if (keyCode== DOWN) {
    angle2-=.01;
  }

  rotateX(angleB);
  rotateY(angle);
  
  fill(240);
  noStroke();
  box(bounds);
  popMatrix();
}
