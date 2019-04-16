float x,y;

void setup() {
  size(600, 600); 
  noStroke();  
}

void draw() { 
  background(255,255,0);
  
  float targetX = mouseX;
  float targetY = mouseY;

  
  ellipse(targetX, targetY, 100, 100);
}
