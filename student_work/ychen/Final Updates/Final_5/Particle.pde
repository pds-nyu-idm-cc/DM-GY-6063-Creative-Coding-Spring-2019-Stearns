class Particle {
  PVector direction;
  PVector velocity;
  PVector position;
  float speed = 0.3;
  float radius = 5;
  float x, y;

  //give initial values
  Particle () {
    x = random(width);
    y = random(height);
    direction = new PVector(0, 0);
    velocity = new PVector (0, 0);
    position = new PVector (x, y);
  }

  //move the particles
  void move() {
    int noiseScale = 600;
    float angle = noise(position.x/noiseScale, position.y/noiseScale)*15;
    direction.x = cos(angle);
    direction.y = sin(angle);
    velocity = direction.copy();
    velocity.mult(speed);
    position.add(velocity);
  
  }

  //give direction
  void move(PVector _direction) {
    velocity = _direction.copy();
    velocity.mult(speed);
    position.add(velocity);
  }

  //once particles touched the edge, new ones appear at random positions
  void touchedEdge () {
    if (position.x > width || position.x <0 || position.y > height || position.y <0) {
      position.x = random (width); 
      position.y = random (height);
    }
  }

  //make the particles
  void display() {
    noStroke();
    smooth();
    ellipse(position.x, position.y, radius, radius);
  }


  //draw lines between particles
  void drawLine(Particle _n) {
    line(position.x, position.y, _n.position.x, _n.position.y);
  }

  //check distance between particles
  float distance(Particle _n) {
    return pow(pow(_n.position.x - position.x, 2) + pow(_n.position.y - position.y, 2), 0.5);
  }
}
