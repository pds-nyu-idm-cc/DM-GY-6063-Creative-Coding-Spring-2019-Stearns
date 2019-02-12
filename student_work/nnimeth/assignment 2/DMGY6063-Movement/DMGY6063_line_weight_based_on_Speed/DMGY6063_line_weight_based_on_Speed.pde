void setup(){

  size(400,400);
  background(255);
  
}

void draw(){
  
  
  //makes stroke thickness change based on speed 
  stroke(255,200,200);
  float speed = abs(mouseX - pmouseX);
  strokeWeight(speed);
  line(mouseX, mouseY, pmouseX, pmouseY);
 
}

void mousePressed(){
  background(255);
}
