float d;


void setup() {
  background(255);
  size(500, 500);
}

void draw() {
  noStroke();
  d = dist(width/2, height/2, mouseX, mouseY);
  
  if (d < 40) {
    fill(38, 77, 119);
  } else {
    fill(190);
  }
  circle(width/2, height/2, 80);
}
