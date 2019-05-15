int px, py;
int value = 0;
int c;
int colours;
boolean over = false;
boolean click = false;

void setup() {
  size(400, 400);
  background(150);
  stroke(0, 0, 50);
  noFill();
  rectMode(CENTER);

  px = 200;
  py = 200;
}

void draw() {

  if (dist(mouseX, mouseY, px, py)<=25) {
over = true;
    //rectangular
    //if(mouseX>px-20 &&
    //   mouseX<px+20 &&
    //   mouseY>py-20 &&
    //   mouseY<py+20) {
if (!click) { 
    stroke(0, 200, 250);
    ellipse(px, py, 50, 50);
}
  } else {
    
    stroke(0, 0, 50);
    ellipse(px, py, 50, 50);
        over = false;
  }
}
void mousePressed() {
  {
    if (mousePressed == true && (mouseButton == LEFT)) {

      if (over) { 
        click = true; 
        fill(200);
      } else {
        click = false;
      }
    }
  }
}
void mouseReleased() {
  click = false;
}
