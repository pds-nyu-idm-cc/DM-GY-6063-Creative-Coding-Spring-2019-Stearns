float x,y;

void setup(){
  background(190);
  size(500,500);
}

void draw(){
  background(190);
  fill(0);
  stroke(255);
  circle(x,y,50);
  x = mouseX; y = mouseY;
  
}
