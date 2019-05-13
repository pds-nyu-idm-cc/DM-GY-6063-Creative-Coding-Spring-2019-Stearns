PImage bgimg;
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<String> texts = new ArrayList<String>();
String fontName = "Times";
int textIndex = 0;
import processing.sound.*;
SoundFile file;

void setup() {
  size(1000, 562);
  bgimg = loadImage("bgimg.jpg");
  file = new SoundFile(this, "funny.mp3");
  file.play();
  texts.add("Hello, it's Tao");
  texts.add("Yo! Coding");
  texts.add("We all get an A?");
  texts.add("YES & Thank You ! ! !");
  drawtext(texts.get(textIndex));
}


void draw() {
  image(bgimg,0,0);
  for (int x = particles.size ()-1; x > -1; x--) {
    Particle p = particles.get(x);
    p.particle_move();
    p.particle_display();
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    textIndex += 1;
    if (textIndex > texts.size()-1) { 
      textIndex = 0;
    }
    drawtext(texts.get(textIndex));
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

void drawtext(String t) {//draw words in PGraphics
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  pg.fill(0);
  pg.textSize(100);
  pg.textAlign(CENTER);
  PFont font = createFont(fontName, 100);
  pg.textFont(font);
  pg.text(t, width/2, height/2);
  pg.endDraw();
  pg.loadPixels();

  int particleNumber = particles.size();
  int particleIndex = 0;
  ArrayList<Integer> coords = new ArrayList<Integer>();
  for (int i = 0; i < (height * width)-1; i+= 3) {
    coords.add(i);
  }
  for (int i = 0; i < coords.size (); i++) {
    int randomIndex = (int)random(0, coords.size());
    int coordsIndex = coords.get(randomIndex);
    if (pg.pixels[coordsIndex] != 0) {// Convert index to its coordinates
      int x = coordsIndex % width;
      int y = coordsIndex / width;

      Particle p_new;
      if (particleIndex < particleNumber) { //use old particles
        p_new = particles.get(particleIndex);
        particleIndex += 1;
      } 
      else { //create new particles
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
