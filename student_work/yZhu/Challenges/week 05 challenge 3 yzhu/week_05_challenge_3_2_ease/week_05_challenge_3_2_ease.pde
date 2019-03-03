float x;
float y;
float easing = 0.05;

void setup(){
  size(500,500);
  strokeWeight(10);
  stroke(0);
}

void draw(){
  background(223, 227, 226);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  //red square
  rectMode(CENTER);
  fill(210, 23, 36);
  rect(x, y,100,100);
}
