//week 5 in class challenge 3.3 avoid mouse version 2
//by Jude Zhu

float x, y; 
boolean go=false;
 
void setup() { 
  size(500, 500); 
  strokeWeight(10);
  stroke(0);
  smooth();
  rectMode(CENTER);
  newPosition();
} 
 
void draw() { 
  background(223, 227, 226);
  PVector p = new PVector( mouseX-x, mouseY-y, 0);
  p.limit(2);
  if (go && dist(mouseX, mouseY, x, y)<100) {
    x-=p.x;
    y-=p.y;
  }
  x = constrain(x,25,width-25);
  y = constrain(y,25,height-25);
  rect(x, y, 100, 100); 
  fill(210, 23, 36);
  if (mouseX>x-25 && mouseX<x+25 && mouseY>y-25 && mouseY<y+25) {
    newPosition();
  }
}
 
void mouseMoved() {
  go=true;
}
 
void newPosition() {
  x=random(width); 
  y=random(height);
}
