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
  background(77, 91, 114);
  
  float tr_x=mouseX, tr_y=mouseY;
  
  //noStroke();
  //pushMatrix();
  //fill(220);
  //translate(100, 150);
  //rotate(radians(-45));  
  //rect(0, 0, 200, 25);
  //rect(0, 24, 25, 45);
  //rect(175, 24, 25, 45);
  //rect(175, 24, 25, 45);
  //popMatrix();
  
  //pushMatrix();
  //fill(220);
  //translate(350, 10);
  //rotate(radians(45));  
  //rect(0, 0, 200, 25);
  //rect(0, 24, 25, 45);
  //rect(175, 24, 25, 45);
  //rect(175, 24, 25, 45);
  //popMatrix();
  
  //  pushMatrix();
  //fill(220);
  //translate(350, 10);
  //rotate(radians(0));  
  //rect(0, 0, 200, 25);
  //rect(0, 24, 25, 45);
  //rect(175, 24, 25, 45);
  //rect(175, 24, 25, 45);
  //popMatrix();
  
  //pushMatrix();
  //translate(10, 10);
  //rotate(radians(0));
  stroke(178, 164, 140);
  strokeWeight(5);
  fill(77, 91, 114);
  rect(120, 120, 45, 45);
  //fill(230);
  //rect(50, 50, 50, 50);
  
  //popMatrix();
}
void t_shape() {
  //rotate(radians(deg));
}

//void drawConnector(int x, int y, int deg) {
//  noStroke();
//  pushMatrix();
//  fill(220);
//  translate(tr_x, tr_y);
//  rotate(radians(deg));
//  rect(0, 0, 200, 25);
//  rect(0, 24, 25, 45);
//  rect(175, 24, 25, 45);
//  rect(175, 24, 25, 45);
//  popMatrix();
//}
