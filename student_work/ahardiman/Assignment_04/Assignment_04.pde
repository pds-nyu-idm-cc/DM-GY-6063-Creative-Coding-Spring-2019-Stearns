//work in progress - haven't figured out how to make the button react yet

Particle p1;

float x;
float y;

void setup() {
 size(600,400);
 p1 = new Particle(100,100,50);
}

void draw() {
  background(173,166,143);
  
   stroke(255);
   strokeWeight(2);
   
   x = 50;
   while (x < width) {
     line(x,0,x,height);
     x = x + 50;
   }
   
   y = 50;
   while (y < height) {
     line(0,y,width,y);
     y = y + 50;
   }
   
  p1.x = mouseX;
  p1.y = mouseY;
  
  p1.display();
}

/* void mousePressed(){
  if (dist(p1.x,p1.y,mouseX,mouseY)<){  //if red button is pressed
                   // grid lines increases
} */
