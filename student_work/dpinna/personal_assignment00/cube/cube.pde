float bounds = 200;
float angle1;

void setup() {
  size(800, 800, P3D);
}


void draw() {
  background(255);
  drawCube ( width/2, 600, -100, angle1 );
}

void drawCube ( float x, float y, float z, float angle) {

  pushMatrix();
  translate(x, y, z);
  
  fill(0);
  if (keyCode== RIGHT) {
    angle1+=.01;
  } else if (keyCode== LEFT) {
      angle1-=.01;
  }
  println(angle1);
  rotateY(angle);
  stroke(255);
  box(bounds);
  popMatrix();
}
