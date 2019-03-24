class Mover {
  float k = 0.0125; //friction coeff used for drag
  float maxforce = 5;
  float maxspeed = 5;
  boolean wrapEdges=false;
  boolean drag=true;

  float m = 1, r = 5;  
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();

  Mover() {
    position = new PVector(random(width), random(height));
    velocity = PVector.random2D().setMag(2);
  }

  void drag() {
    // Magnitude is coefficient * speed squared
    applyForce(velocity.copy().setMag(-k*pow(velocity.mag(), 2)));
  }

  void applyForce(PVector _force) {
    // acceleration = force / mass
    acceleration.add(_force.limit(maxforce).div(m));
  }

  // Method to update position
  void update() {  
    position.add(velocity.add(acceleration).limit(maxspeed));
    acceleration.mult(0);
    if (drag)drag();
    if (wrapEdges) {
      boundaryWrap();
    } else {
      boundaryCollision();
    }
  }

  void render() {  
    stroke(0);
    strokeWeight(1);
    fill(255,127);
    circle(position.x, position.y, 2*r);
  }

  void boundaryCollision() {
    if (position.x < 0  + r ) {
      velocity.x *= -1;
      position.x = r;
    }
    if (position.x > width - r) {
      velocity.x *= -1;
      position.x = width-r;
    }
    if (position.y < 0 + r ) {
      velocity.y *= -1;
      position.y = r;
    }
    if (position.y > height - r) {
      velocity.y *= -1;
      position.y = height-r;
    }
  }

  void boundaryWrap() {
    position.x=(position.x+width)%width;
    position.y=(position.y+height)%height;
  }
}
