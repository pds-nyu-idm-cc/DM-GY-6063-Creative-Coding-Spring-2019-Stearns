Mover mover;

void setup() {
  size(500, 500);
  background(127);
  
  mover = new Mover();
}

void draw() {
  //background(127);
  mover.update();
  mover.render();
}

void mousePressed(){
  mover.pushAway();
}
