class Tile {

  PVector p = new PVector();  // position
  PVector v = new PVector();  // velocity
  PVector a = new PVector();  // acceleration
  int size = 16;   // width and height
  PImage img = createImage(size, size, RGB); // PImage buffer
  color[] px = new color[int(sq(size))]; // array of pixels
  float mass = 1;

  Tile() {
  }

  Tile(float _x, float _y) {
    p = new PVector(_x, _y);
  }

  Tile(float _x, float _y, int _size) {
    p = new PVector(_x, _y);
  }

  void update() {
    v.add(a);
    p.add(v);
    v.limit(5);
    a.setMag(0);
  }

  void applyForce(PVector _force) {
    a.add(_force.div(mass));
  }

  void render() {
    rectMode(CENTER);
    stroke(127);
    strokeWeight(0.5);
    noFill();
    square(p.x, p.y, size);
  }
}
