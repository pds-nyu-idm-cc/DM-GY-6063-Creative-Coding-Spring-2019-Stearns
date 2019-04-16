class Bird {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PImage flappyBird;

  Bird() {
    position = new PVector(50, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector();
  }

  void birdFly(PVector force) {
    acceleration.add(force);
  }

  void birdUpdate() {
    birdFly(gravity);
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(5);
    acceleration.mult(0);

    if (position.y > height || position.y < 0) {
      gamestage = false;
    }
  }

  void flappybird() {
    flappyBird = loadImage("bird.gif");
    image(flappyBird, position.x, position.y, 50, 50);
  }
  
  void birdrestart(){
  }
}
