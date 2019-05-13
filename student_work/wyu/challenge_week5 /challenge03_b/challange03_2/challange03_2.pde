float r =100;
int x;
int y;
float ease = 0.01; 


void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  rect(x, y, r, r);
  float targetX = mouseX; 
  float targetY = mouseY; 
  x += (targetX - x) * ease; 
  y += (targetY - y) * ease;
}
