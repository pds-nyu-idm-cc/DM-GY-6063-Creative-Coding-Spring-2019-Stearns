float d;
float r = 80;
color c;

void setup() {
  background(255);
  size(500, 500);
}

void draw() {
  noStroke();
  d = dist(width/2, height/2, mouseX, mouseY);
  
  if (d < r/2 && mousePressed == false) {
    c = color (38, 77, 119);
  } else if (d < r/2 && mousePressed == true) {
    c = color (235,145,174);
  } else {
    c = color (100);
  }
  
  fill(c);
  circle(width/2, height/2, r);
}
