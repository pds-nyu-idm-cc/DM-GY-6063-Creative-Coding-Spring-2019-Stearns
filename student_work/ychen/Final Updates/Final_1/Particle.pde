class Particle {
  PVector direction;
  PVector velocity;
  PVector position;
  float speed = 0.3;
  float radius = 2;
  float x, y;

  Particle () {
    x = random(width);
    y = random(height);
    direction = new PVector(0, 0);
    velocity = new PVector (0, 0);
    position = new PVector (x, y);
  }

  //particles moving
  void move() {
    int noiseScale = 600;
    float angle = noise(position.x/noiseScale, position.y/noiseScale)*15;
    direction.x = cos(angle);
    direction.y = sin(angle);
    velocity = direction.copy();
    velocity.mult(speed);
    position.add(velocity);
    
    for (int i = 0; i < total; i++) {
        float n = noise(x * 0.1, i * 0.02, frameCount * 0.2);
        position.x = map(n, 0, 1, 0, width);
        position.y = map(n, 0, 1, 0, height);
    }
  }

  //once particles touched the edge, new ones appear at random positions
  //store it to the original position so the particles go back?
  void touchedEdge () {
    if (position.x > width || position.x <0 || position.y > height || position.y <0) {
      position.x = random (width); 
      position.y = random (height);
    }
  }

  void display() {
    stroke(pcolor);
    smooth();
    vertex(position.x, position.y);
  }

  void changeColor() {
    if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
      pcolor = color (noise(mouseY/50, 100)*250, noise(mouseY/50, 200)*100, noise(mouseY/50, 200)*200);
      p1color = color (noise(mouseX, 100)*100, noise(mouseX, 100)*150, noise(mouseX, 200)*350);
    } else {
    }

    //"eraser"
    if (keyPressed == true) {
      pcolor = color (bgcolor);
      p1color = color (bgcolor);
    }
  }
}
