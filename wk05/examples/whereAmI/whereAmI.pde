void setup(){
  size(500,500);
  
}

void draw(){
  background(255);
  if(mousePressed)showPosition();
}

void showPosition(){
  strokeWeight(0);
  stroke(127);
  fill(127);
  text(mouseX+", "+mouseY, mouseX, mouseY);
  line(0,mouseY,width,mouseY);
  line(mouseX,0,mouseX,height);
}
