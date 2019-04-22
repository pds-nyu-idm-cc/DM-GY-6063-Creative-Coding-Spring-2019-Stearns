void setup() {
  size(800, 800);
  background(255);
  frameRate(5);
}

void draw() {
  
  background(255);
  
  whereAmI();
  
  //println("Mouse X: "+mouseX+", Mouse Y: "+mouseY);
  
}

void whereAmI(){
  stroke(127);
  line(mouseX,0,mouseX,height);
  line(0, mouseY, width, mouseY);
  fill(127);
  String text = "("+mouseX+","+mouseY+")";
  text(text, mouseX, mouseY);
}
