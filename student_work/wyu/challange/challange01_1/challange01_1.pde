float r = 50;
void setup(){
  size(800,600);
  background(255);
}
//challenge 1
void draw(){
   strokeWeight(2);
   stroke(0);
   if (mouseX > (width/2-r) && mouseY> (height/2-r)){
   fill(100);
 }
   ellipse(width/2, height/2, 2*r, 2*r);
}
