PShape s;

int x1, y1, x2, y2, x3, y3, x4, y4;

void setup() {
  size(800, 800);
  smooth();
  s = createShape();
  s.beginShape();
  s.fill(220);
  s.noStroke();
  s.vertex(0, 0);
  s.vertex(200, 0);
  s.vertex(200, 25);
  s.vertex(113, 25);
  s.vertex(113, 70);
  s.vertex(88, 70);
  s.vertex(88, 25);
  s.vertex(0, 25);
  s.endShape(CLOSE);
}

void draw() {
  background(51);

  // move the center of rotation to the center of the sketch and then re-draw
  //https://gist.github.com/atduskgreg/1516424
  //translate(96, 96);
  //rotate(radians(-45));
  //shape(s, 0, 0);


  /*
 transform="translate(96.000000, 96.000000) 
   rotate(-45.000000) translate(-96.000000, -96.000000)"
   */

  //// working without rectMode(CENTER);
  //translate(width/2, height/2);
  //rotate(radians(frameCount));
  connector(100, 100, -45, -100, 200);
  connector(500, 100, 45, 0, -365);
  connector(100, 100, -135, 180, 583);
  connector(500, 100, 135, 845, 20);

  //t_shape(0, 0, 0);
}
void t_shape() {
  //rotate(radians(deg));
}

void connector(int x, int y, int deg, int tr_x, int tr_y) {
  pushMatrix();
  translate(tr_x, tr_y);
  fill(220);
  noStroke();
  rotate(radians(deg));
  rect(x, y, 200, 25);
  rect(x, y+24, 25, 45);
  rect(x+175, y+24, 25, 45);
  rect(x+175, y+24, 25, 45);
  popMatrix();
}
