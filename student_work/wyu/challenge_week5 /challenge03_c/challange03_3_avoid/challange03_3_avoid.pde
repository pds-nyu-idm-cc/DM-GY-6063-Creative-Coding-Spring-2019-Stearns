float r =100;
int x;
int y;
float d;
float ease = 0.01; 
boolean mouseOverRec = false;


void setup() {
  x= width/2;
  y=height/2;
  size(500, 500);
}
void draw() {
  background(255);
  overRect();
  PVector avoid = new PVector( mouseX-x, mouseY-y, 0);
  d = dist(mouseX, mouseY, x, y);
  if (mouseOverRec) {
    x-=avoid.x;
    y-=avoid.y;
  }
  //x += (x - mouseX) * ease; 
  //y += (y - mouseY) * ease;
  x = constrain(x, 10, width-10);
  y = constrain(y, 10, height-10);
  rect(x, y, r, r);
  // y += (targetY - y) * ease;
  //float targetX = mouseX; 
  //float targetY = mouseY;
  //x += (targetX - x) * ease; 
  // y += (targetY - y) * ease;
}
void overRect() {
  if (mouseX >= x && mouseX<= x+r || (mouseY <= y+r && mouseY>=y)){
    mouseOverRec = true;
  }
}
