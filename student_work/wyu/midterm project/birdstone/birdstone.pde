PImage bird;
Particle p;

void setup() {
  imageMode(CENTER);
  bird=loadImage("niaoniaoniao");
  bird.resize(80, 0);
  size(800, 600);
  ellipseMode(CENTER);
  rectMode(CENTER);
  p = new Particle(new PVector(width/2, mouseY));
}
void draw() {
  strokeWeight(3);
  stroke(0, 0, 0);
  smooth();
  background(#FED7DA);
  //the image of bottle
  fill(#BDD2E9);
  line(width/2-25, height/2+3, width/2-25, height/2+65);
  line(width/2+25, height/2+3, width/2+25, height/2+65);
  ellipse(width/2, height/2+3, 50, 15);
  rect(width/2, height/2+80, 90, 100, 7);
  stroke(255);
  for (int i=0; i < 7; i=i+1) {
    line(width/2+10*i-35, height/2+80, width/2+10*i-25, height/2+90);
    line(width/2+10*i-35, height/2+80+20, width/2+10*i-25, height/2+90+20);
  } 
  bird();
  p.update();
  p.display();
}
//the image of bird
void bird() {
  image(bird, mouseX, mouseY);
}

void mousePressed() {
  //p(new Particle(new PVector(mouseX, mouseY)));
  if (p.isDead()) {
    background(157);
  }
}
