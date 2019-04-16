float x,y;
float ballease = 0.05;

void setup() {
  size(600, 600); 
  noStroke();  
}

void draw() { 
  background(255,255,0);
  
  float targetX = mouseX;
  float tempx = targetX - x;
  x += tempx * ballease;
  float targetY = mouseY;
  float tempy = targetY - y;
  y += tempy * ballease;
  
  ellipse(x, y, 100, 100);
}
