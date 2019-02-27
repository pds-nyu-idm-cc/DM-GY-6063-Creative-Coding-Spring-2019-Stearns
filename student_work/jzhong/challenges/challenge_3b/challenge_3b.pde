float x,y;
float easing = 0.05;

void setup(){
  background(190);
  size(500,500);
}

void draw(){
  background(190);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  
  fill(0);
  stroke(255);
  circle(x,y,50);
  
  
}
