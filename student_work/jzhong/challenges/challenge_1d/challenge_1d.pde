float h = 60;
float l = 80;
float rectLeft, rectRight, rectTop, rectBottom;
color c;
boolean active = false;
boolean detection = false;

void setup() {
  background(255);
  size(500, 500);
  rectLeft = (width/2-l/2); 
  rectRight = rectLeft+l; 
  rectTop = height/2-h/2; 
  rectBottom = rectTop+h;
}

void draw() {
  noStroke();
  detection();

  if (detection == true && mousePressed == true) {
    c = color (38, 77, 119);//navy-pressed
  } else if (active == true) {
    c = color (235, 145, 174);//pink - active
  } else if (active == false) {
    c = color (100);//gray - inactive
  }

  fill(c);
  rect(rectLeft, rectTop, l, h, 10, 10, 10, 10);
}

void mousePressed() {
  if (detection == true) {
    active = !active;
  }
}

void detection() {
  if (mouseX>rectLeft && mouseX<rectRight && mouseY>rectTop && mouseY<rectBottom) {
    detection = true;
  } else {
    detection = false;
  } 
}
