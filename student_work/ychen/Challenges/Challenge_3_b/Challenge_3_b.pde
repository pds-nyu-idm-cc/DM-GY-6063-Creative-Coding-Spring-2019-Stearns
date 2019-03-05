float x, y;
float easing = 1.2;

void setup(){
  size (300,300);
}

void draw(){
  background (255);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x = dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y = dy * easing;
  
  
  
  fill(0);
  noStroke();
  ellipse(mouseX, mouseY, 50, 50);
}
