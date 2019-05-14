class boat {
  PVector pos, vel;
  PImage img;

  boat() {

    pos = new PVector(200, 100);
      vel = new PVector(2, 1);
  }

  void draw() {
    background(0);
    pushMatrix();
    translate(0, sin(frameCount/9.)*10);
    image(img, 100, 100);
    popMatrix();
  
    fill(0, 0.01);
    rect(0, 0, width, height);
      
  }
}
