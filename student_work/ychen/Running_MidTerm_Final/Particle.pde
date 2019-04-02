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
    
    //Tried to a mouse-avoding interactive movement. Particles would not go back to original location.
    //PVector mouseVec;
    //mouseVec = new PVector (mouseX, mouseY);
    //float dd = dist(mouseX, mouseY, position.x, position.y);
    //if (dd < 300) {
    //  position.add(mouseVec.sub(position).normalize().mult(-100/dd));
    //}
    //position.add(velocity);
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
    noStroke();
    smooth();
    ellipse(position.x, position.y, radius, radius);
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
