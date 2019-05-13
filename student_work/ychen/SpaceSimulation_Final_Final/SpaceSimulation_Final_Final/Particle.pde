class Particle {
  PVector direction;
  PVector velocity;
  PVector position;
  float speed = 0.3;
  float radius = 5;
  float x, y;

  //initializes dir, vel, pos
  Particle () {
    x = random(width);
    y = random(height);
    direction = new PVector(0, 0);
    velocity = new PVector (0, 0);
    position = new PVector (x, y);
  }

  //moves the particles
  void move() {
    int noiseScale = 600;
    float angle = noise(position.x/noiseScale, position.y/noiseScale)*15;
    direction.x = cos(angle);
    direction.y = sin(angle);
    velocity = direction.copy();
    velocity.mult(speed);
    position.add(velocity);
  }

  //gives direction for noise
  void move(PVector _direction) {
    velocity = _direction.copy();
    velocity.mult(speed);
    position.add(velocity);
  }

  //once particles touch the edge, new ones appear at random positions
  void touchedEdge () {
    if (position.x > width || position.x <0 || position.y > height || position.y <0) {
      position.x = random (width); 
      position.y = random (height);
    }
  }

  //draws particles
  void display() {
    noStroke();
    smooth();
    ellipse(position.x, position.y, radius, radius);
  }

  //draws lines between particles
  void drawLine(Particle _n) { 
    line(position.x, position.y, _n.position.x, _n.position.y);

    //originally wanted to make dispersion
    //but it turned out some particles would move diagonally
    //and draw/undraw lines with the particles near them
    //look ok to me, just wanted to figure out why only certain particles are moving this way
    float d = dist(position.x, _n.position.x, position.y, _n.position.y);
    if (d <= 20) {
      PVector delta = new PVector (0, 0);
      delta.sub(_n.position.x, _n.position.y);
      delta.normalize();
      delta.mult(-0.5);
      position.add(delta);
    }
  }

  //distance between particles
  float distance(Particle _n) {
    return pow(pow(_n.position.x - position.x, 2) + pow(_n.position.y - position.y, 2), 0.5);
  }
}
