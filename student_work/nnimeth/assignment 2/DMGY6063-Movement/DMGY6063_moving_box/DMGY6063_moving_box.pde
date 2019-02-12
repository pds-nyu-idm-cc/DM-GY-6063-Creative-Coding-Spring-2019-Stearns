void setup(){

  size(200,200);
  
}

void draw(){

  //moving this into setup allows you to see all of the boxes repeating
  background(255);
  
  //body
  stroke(0);
  fill(175);
  rectMode(CENTER);
  rect(mouseX,mouseY,50,50);
  
}
