float d;
float r = 80;
color c;
boolean active = false;

void setup() {
  background(255);
  size(500, 500);
}

void draw() {
  noStroke();
  d = dist(width/2, height/2, mouseX, mouseY);
  
  if (d < r/2 && mousePressed == true) {
    c = color (38, 77, 119);//navy-pressed
  } else if (active == true) {
    c = color (235,145,174);//pink - active
  } else if (active == false){
    c = color (100);//gray - inactive
  }
  
  fill(c);
  circle(width/2, height/2, r);
}

void mousePressed() {
  if (d < r/2) {
    active = !active;
  }
}
