void setup() {
  size(500,500);
  
}

void draw() {
 background(244,238,236);
 noStroke();
 if (mouseX < 100) {
   rect(0,0,100,500); 
 } else if (mouseX > 400) {
   rect(400,0,100,500); 
 }
 circle(mouseX,mouseY,50);
}
//MAYDAY MAYDAY what is shape track / shape ease?
