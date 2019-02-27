class Toggle {
  boolean inactive;
  boolean pressed;
  int a, b, c, d; // x,y,w,h
  Toggle(int ia, int ib, int ic, int id) {
    state = false;
    ready = true;
    a = ia;
    b = ib;
    c = ic;
    d = id;
  }
}
  
  
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
  ellipse(bx, by, radius, radius);
}

void draw() { 
  background(255);

  // Test if the cursor is over the box 
  if (mouseX > bx-radius && mouseX < bx+radius && 
    mouseY > by-radius && mouseY < by+radius) {
    overButton = true;  
    if (!locked) { 
      ready = false;
      state = !state;
      stroke(255); 
      fill(153);
    }
  } else {
    stroke(153);
    fill(#52B640);
    overButton = false;
  }

  // Draw the box
  ellipse(bx, by, radius, radius);
}


void mousePressed() {
  if (overButton) { 
    locked = true; 
    fill(#CDB6D2);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by;
}

void mouseReleased() {
  locked = false;
}
