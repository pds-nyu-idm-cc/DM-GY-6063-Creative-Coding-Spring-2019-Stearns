// declare variables
int circlex;


void setup(){

  // set screen size
  size(500, 500);
  
  
  // set starting background color
  background(87, 164, 229);
  
  fill(0,0,0);
  circlex=50;
}
 
void draw(){
  
 //Logic
 circlex=circlex+2;
 
  stroke(122, 224, 60);
  fill(122, 224, 60);
  circle(250,250, 35);
  stroke(91, 224, 68);
  fill(191, 224, 68);
  circle(250,250, 30);
  stroke (224, 163, 33);
  fill(224, 163, 33);
  circle (250, 250, 18);
  fill (229, 221, 86);
  circle(250, 250, 10);
  stroke(73, 122, 196);
  fill(73, 122, 196);
  triangle(250, 250, 200, 200, 200, 300
  );
  stroke(59, 100, 164);
  fill(59, 100, 164);
  triangle(250, 250, 200, 250, 250, 300);
  stroke(224, 59, 33);
  fill(224, 59, 33);
  triangle(250, 250, 300, 200, 300, 300); 
  stroke(220, 121, 90);
  fill(220, 121, 90);
  triangle(250, 250, 300, 250, 250, 200);
  
  stroke(229, 221, 86);
  fill(7229, 221, 86);
  circle(225, 225, 7);
   stroke(229, 221, 86);
  fill(229, 221, 86);
  circle(275, 225, 7);
   
  stroke(229, 221, 86);
  fill (229, 221, 86);
 circle(mouseX, 250, 10);
 
  stroke(224, 163, 33);
  fill (224, 163, 33);
 circle(250, mouseY, 10);
 
  stroke(224, 163, 33);
  fill(224, 163, 33);
  circle(225, 275, 7);
  
    stroke(224, 163, 33);
  fill(224, 163, 33);
  circle(275, 275, 7);
stroke (226, 134, 193  );
fill (226, 134, 193  );
triangle(200, 200, 300, 200, 250, 150);
fill(152, 191, 220);
triangle (225, 175, 250, 200, 275, 175);

circle (375, 50, 50);
circle (375, 50, 35);
circle (375, 50, 20);

fill (243, 215, 233);
circle (mouseX, mouseY,20);

}
