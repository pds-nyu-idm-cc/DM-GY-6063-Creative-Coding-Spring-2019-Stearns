// week 05 in class challenge 3.3 avoid mouse version 1
// by Jude Zhu

void setup(){
  size(500,500);
  strokeWeight(10);
  stroke(0);
  rectMode(CENTER);
}

void draw(){
  background(223, 227, 226);
  fill(210, 23, 36);
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);  
}
