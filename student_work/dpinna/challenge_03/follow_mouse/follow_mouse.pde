//color(167, 142, 27);
//color(51, 76, 125);
//color(144, 62, 62);

PVector location;
PVector velocity;

int posX, posY;

void setup() {
  size(500, 500);

  location = new PVector(50, 50);
  velocity = new PVector(1.5, 2.1);
}

void draw() {
  background(221);
  location.add(velocity);

  if ((location.x >= width/2)) {
    velocity.x =0;
    println("where are you going");
  } else if (location.x >= mouseX) {
    println(location.x +" "+mouseX);
    println("avoiding mouseX");
    velocity.x +=0.1;
  }
   //if (location.y >= height/2 || (location.y <= 0)) {
   //  velocity.y -=1;
   //}else if (location.y >= mouseY-50) {
   //  println("avoiding mouseY");
   // velocity.y +=0.1;
  //}

  //println(location.x);

  ellipse(location.x, location.y, 48, 48);
}
