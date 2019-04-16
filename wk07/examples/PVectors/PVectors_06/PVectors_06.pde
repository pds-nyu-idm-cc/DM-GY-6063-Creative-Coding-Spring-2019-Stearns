// number of Movers
int qtyMovers = 100;

// declare an array of Movers
ArrayList<Mover> movers;

void setup() {
  size(500, 500);
  background(127);

  // initialize the ArrayList
  movers = new ArrayList<Mover>();

  // add newly constructed Movers 
  for (int i = 0; i < qtyMovers; i++) {
    movers.add(new Mover());
  }

}

void draw() {
  background(127);
  
  // ArrayList.size() is like array.length
  for (int i = 0; i < movers.size(); i++) {
    // we have to "get" a reference to the object in the ArrayList
    Mover m = movers.get(i);
    // anything we do to that reference is applied to the object
    m.update();
  }
  
  // example of shorthand notation for ArrayLists
  // it's not necessary to use a separate for loop
  for (Mover m : movers) m.render();
  
}

void mousePressed() {
  if(mouseButton == RIGHT){
    removeMover();
  }else if(mouseButton == LEFT){
    movers.add(new Mover());
  }
}

void removeMover() {
  // when we remove elements, we have to work backwards
  for (int i = movers.size() - 1; i >= 0; i--) {
    Mover m = movers.get(i);
    if (m.isClicked()) movers.remove(i);
  }
}
