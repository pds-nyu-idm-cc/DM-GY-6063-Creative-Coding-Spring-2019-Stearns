void setup(){
  size(500,500);
  strokeWeight(10);
  stroke(0);
}

void draw(){
  background(223, 227, 226);
  
  //red square
  rectMode(CENTER);
  fill(210, 23, 36);
  rect(mouseX, mouseY,100,100);
}
