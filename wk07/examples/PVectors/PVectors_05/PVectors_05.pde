// number of movers
int qtyMovers = 100;

// declare an array of movers
Mover[] movers;

void setup() {
  size(500, 500);
  background(127);

  // initialize the array
  movers = new Mover[qtyMovers];

  // initialize the movers in the array
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  //background(127);
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].render();
  }
}

void mousePressed() {
  pushAway();
}

void pushAway(){
  for (int i = 0; i < movers.length; i++) {
    movers[i].speed=PVector.sub(movers[i].position, new PVector(mouseX, mouseY)).mult(10);
  }
}
