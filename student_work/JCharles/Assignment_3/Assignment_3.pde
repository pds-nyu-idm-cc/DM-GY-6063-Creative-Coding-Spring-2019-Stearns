//defining the variable r
float r;

void setup(){
  size(600, 600);
  //color picker
  background(#2D7F69);
}

void draw(){
  //initializing the variable r
  r= random(255);
  noStroke();
  fill(#B7031B);
  ellipse(mouseX, mouseY, 20, 20);
}

void mousePressed(){
  //change background after clicking the mouse
  background(r);
}
