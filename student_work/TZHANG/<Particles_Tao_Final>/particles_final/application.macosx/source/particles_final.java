import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class particles_final extends PApplet {

PImage bgimg;
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<String> texts = new ArrayList<String>();
String fontName = "Times";
int textIndex = 0;

SoundFile file;

public void setup() {
  
  bgimg = loadImage("bgimg.jpg");
  file = new SoundFile(this, "funny.mp3");
  file.loop();
  texts.add("Hello, it's Tao");
  texts.add("Yo! Coding");
  texts.add("We all get an A?");
  texts.add("YES & Thank You ! ! !");
  drawtext(texts.get(textIndex));
}


public void draw() {
  image(bgimg,0,0);
  for (int x = particles.size ()-1; x > -1; x--) {
    Particle p = particles.get(x);
    p.particle_move();
    p.particle_display();
  }
}

public void keyPressed() {
  if (keyCode == RIGHT) {
    textIndex += 1;
    if (textIndex > texts.size()-1) { 
      textIndex = 0;
    }
    drawtext(texts.get(textIndex));
  }
}

public PVector generateRandomPos(int x_height, int y_width, float magnitude) {
  PVector randomDistance = new PVector(random(0, width), random(0, height));
  
  PVector pos = new PVector(x_height, y_width);
  pos.sub(randomDistance);
  pos.normalize();
  pos.mult(magnitude);
  pos.add(x_height, y_width);
  return pos;
}

public void drawtext(String t) {//draw words in PGraphics
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
        p_new.particleforce = 0.1f;        
        particles.add(p_new);
      }
      p_new.target.x = x;
      p_new.target.y = y;
    }
  }
}
class Particle { // initialise the new object
  float particledistance = 50;
  float particlespeed = 4.0f;
  float particleforce = 0.1f;
  float particleSize = random(3, 8);
  
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector target = new PVector(0, 0);
  
   public void particle_display() { // display particles 
      noStroke();
      fill(255,0,64);
      ellipse(pos.x, pos.y, particleSize, particleSize);
  }
  
  public void particle_move() { // move the particles and make sure it slows down 
    float proximity = 1.0f;
    float distance = dist(pos.x, pos.y, target.x, target.y);
    if (distance < 50) {
      proximity = distance/particledistance;
    }
    // apply velocity to the particles
    PVector target_vel = new PVector(target.x, target.y);
    target_vel.sub(pos);
    target_vel.normalize();
    target_vel.mult(particlespeed*proximity);
    
    //apply force to the particles
    PVector target_acc = new PVector(target_vel.x, target_vel.y);
    target_acc.sub(vel);
    target_acc.normalize();
    target_acc.mult(particleforce);
    acc.add(target_acc);
    
    //apply mouse hovering to the particles
    float mouseDist = dist(pos.x, pos.y, mouseX, mouseY);
    float mouseMove = 250;
  
  if(mouseDist < mouseMove){
    PVector movePush = new PVector(pos.x, pos.y);
    movePush.sub(new PVector(mouseX, mouseY));
    movePush.normalize();
    movePush.mult((mouseMove-mouseDist)*0.003f);
    acc.add(movePush);
  }
  
  //update the particle movements
  vel.add(acc);
  pos.add(vel);
  acc.mult(0);
  }
}
  public void settings() {  size(1000, 562); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "particles_final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
