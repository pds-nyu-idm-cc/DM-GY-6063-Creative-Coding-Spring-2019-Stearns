float total = 100;
float noiseScale = 800;
float radius;
Particle p;

Particle [] allp = new Particle[100];

void setup() {
  size (500, 500);
  background (0);

  p = new Particle(new PVector(random(width), random(height)));
}

void draw() {
  noStroke();
  smooth();
  fill(255);
  for (int i=0; i<total; i++) {

    radius = map(i, 0, total, 2, 4);
  }

  p.move();
  p.display();
}

class Particle {
  PVector position;
  PVector velocity;
  PVector direction;
  PVector acceleration;
  float speed = 0.4;

  Particle (PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    direction = new PVector(0, 1);
    position = l.copy();
  }
  
    Particle (float x, float y){
    //float x;
    //float y;
    //float x = location.x;
    //float y = location.y;
    position.x=x;
    position.y=y;
    //location =x;
  }

  void move() {

    float angle = noise(position.x/noiseScale, position.y/noiseScale)*noiseScale;
    direction.x = cos(angle);
    direction.y = sin(angle);
    velocity = direction.copy();
    velocity.mult(speed);
    position.add(velocity);
  }


  void display() {
    //fill(255,0,0);
    ellipse(position.x, position.y, radius, radius);
  }
}
