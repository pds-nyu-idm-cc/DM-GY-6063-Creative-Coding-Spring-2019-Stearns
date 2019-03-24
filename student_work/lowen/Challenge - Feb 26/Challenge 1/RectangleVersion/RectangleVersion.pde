float bx;
float by;
int radius = 50;
boolean overButton = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() {
  size(640, 360);
  bx = width/2.0;
  by = height/2.0;
  rect(bx, by, radius, radius);  
}

void draw() { 
  background(255);
  
  // Test if the cursor is over the box 
  if (mouseX > bx-radius && mouseX < bx+radius && 
      mouseY > by-radius && mouseY < by+radius) {
    overButton = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(#52B640);
    overButton = false;
  }
  
  // Draw the box
  rect(bx, by, radius, radius);
}
