int total = 100;
int noiseScale = 800;
float radius;
Particle p;

Particle [] allparticles = new Particle [total];

void setup() {
  size (500, 500);
  background (0);

  p = new Particle(new PVector(random(width), random(height)));
}

void draw() {
  noStroke();
  smooth();
  fill(255);

  p.move();
  p.display();

  for (int i=0; i<allparticles.length; i++) {
    radius = map(i, 0, total, 5, 6);
    allparticles[i] = new Particle();
  }
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

  Particle (float x, float y) {
    position.x=x;
    position.y=y;
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

    ellipse(position.x, position.y, radius, radius);
  }
}
