PImage bgimg; // Image for background
ArrayList<Particle> particles = new ArrayList<Particle>(); //ArrayList for object particles
ArrayList<String> texts = new ArrayList<String>(); //ArrayList for texts
ArrayList<Integer> coords = new ArrayList<Integer>(); //ArrayList for coordinates
int text_right = 0; // Use index to locate each text (right pressed).
import processing.sound.*; //Sound file imported
SoundFile file;

void setup() { // Setup for image, audio, and text arraylists
  size(1000, 562);
  bgimg = loadImage("bgimg.jpg");
  texts.add("Hello, it's Tao");
  texts.add("Yo! Coding");
  texts.add("We all get an A?");
  texts.add("YES & Thank You ! ! !");
  drawtext(texts.get(text_right));
  file = new SoundFile(this, "funny.mp3");
  file.loop();
}


void draw() {
  image(bgimg,0,0);
  for (int x = particles.size ()-1; x > -1; x--) { // Iterate the particles and apply functions onto them
    Particle p = (Particle) particles.get(x);
    p.particle_move();
    p.particle_display();
  }
}

void keyPressed() { // Right key pressed show next text.
  if (keyCode == RIGHT) {
    text_right += 1;
    if (text_right > texts.size()-1) text_right = 0;
    drawtext(texts.get(text_right));
  }
}

PVector generateRandomPos(int x_height, int y_width, float magnitude) {
  PVector randomDistance = new PVector(random(0, width), random(0, height));
  PVector pos = new PVector(x_height, y_width);
  pos.sub(randomDistance);
  pos.normalize();
  pos.mult(magnitude);
  pos.add(x_height, y_width);
  return pos;
}

void drawtext(String t) {//draw texts in PGraphics 
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  pg.fill(0);
  pg.textSize(100);
  pg.textAlign(CENTER);
  PFont font = createFont("Times",100);
  pg.textFont(font);
  pg.text(t, width/2, height/2);
  pg.endDraw();
  pg.loadPixels();

  int particleNumber = particles.size(); // calculate the size of particle arraylists
  int particleIndex = 0;
  for (int i = 0; i < (height * width)-1; i+= 3) {
    coords.add(i); // collect the coordinates over the screen
  }
  for (int i = 0; i < coords.size (); i++) {
    int coordsIndex = coords.get((int)random(0, coords.size()));
    if (pg.pixels[coordsIndex] != 0) {// Convert index to coordinates
      int x = coordsIndex % width;
      int y = coordsIndex / width;

      Particle p_new; // create new particles in case of not enought
      if (particleIndex < particleNumber) { //use particles on the screen
        p_new = particles.get(particleIndex);
        particleIndex += 1;
      } 
      else { //create new particles to form the texts. 
        p_new = new Particle();
        PVector randomPos = generateRandomPos(height/2, width/2, (height+width)/2);
        p_new.pos.x = randomPos.x;
        p_new.pos.y = randomPos.y;
        p_new.particlespeed = 4;
        p_new.particleforce = 0.1;        
        particles.add(p_new);
      }
      p_new.target.x = x;
      p_new.target.y = y;
    }
  }
}
