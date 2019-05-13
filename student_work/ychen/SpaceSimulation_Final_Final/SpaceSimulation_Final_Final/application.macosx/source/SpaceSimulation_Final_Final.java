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

public class SpaceSimulation_Final_Final extends PApplet {

//  Creative Coding Final Project - Space Simulation
//  2019.05.13
//  Yuanting (Iris) Chen
//
//  When you run the sketch, colors of the particles and lines will change to new colors overtime.
//  Please wait patiently.
//
//  Press key 'n' to switch from defalut background to noise background. The noise is guiding the movement of the particles.
//  Press key 'r' to return to the original colors othe particles
//  Press key 's' to save .png
//
//  Please see README_FINAL.md for project details.
//
////////////////////////////////////////////////////////////////


SoundFile file;
String audioName = "data/Space.mp3";
String path;

int total = 210; //total number of particles

int bgcolor = color (0); //background color
int p0fill; //color of first set of particles
int p1fill; //color of second set of particles
int p0color, p1color, p0colorChange, p1colorChange; //color changing variables for lerpColor();
float cStep = 0.0f; //color changing increment

float maxDist = 70; //defines the distance between particles

PVector direction;
int noiseScale = 300;
float z = 0, zStep = 3;
boolean showNoise = false;

Particle [] allparticles_0 = new Particle[total];
Particle [] allparticles_1 = new Particle[total];

public void setup() {

  //fullScreen();
  

  //sound file
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.loop();

  //sets up two sets of particles
  for (int i=0; i <total; i++) {
    allparticles_0[i] = new Particle();
    allparticles_1[i] = new Particle();
  }

  //used for making noise
  direction = new PVector();

  //initializes original colors of particles & lines, see below
  initColor();
}

public void draw() {

  background (bgcolor); 

  //makes the noise change over time
  if (showNoise) image(drawNoise(width, height, z), 0, 0);
  z+=zStep;

  //determines distance between particles & draws lines
  for (int i=0; i <total; i++) {
    for (int j=i+1; j<total; j++) {
      if (allparticles_0[i].distance(allparticles_0[j]) < maxDist) {
        stroke(p0fill);
        strokeWeight(1);
        allparticles_0[i].drawLine(allparticles_0[j]);
      } 
      if (allparticles_1[i].distance(allparticles_1[j]) < maxDist) {
        stroke(p1fill);
        strokeWeight(1);
        allparticles_1[i].drawLine(allparticles_1[j]);
      }
    }
  }

  //draws, moves, adds particles
  for (int i=0; i <total; i++) {
    float tempNoise = getNoise(allparticles_0[i].x, allparticles_0[i].y, z, noiseScale);
    direction = makeDirection(tempNoise);

    fill(p0fill);  
    allparticles_0[i].move(direction);
    allparticles_0[i].touchedEdge();
    allparticles_0[i].display();
    
    fill(p1fill);
    allparticles_1[i].move(direction);
    allparticles_1[i].touchedEdge();
    allparticles_1[i].display();
  }

  //draws default shimmering background
  shimmeringBackground();

  //changes colors of the particles & lines over time
  colorChanging();
  
  //use below if want to save as a video
  //saveFrame("videooutput/space-####.png");
}

public void initColor() {
  p0fill = p0color;
  p0color = color (98, 68, 136);
  p0colorChange = color (80, random(98), random(68), random(136));

  p1fill = p1color;
  p1color = color (63, 95, 212);
  p1colorChange = color (80, random(63), random(95), random(212));

  cStep = 0;
}

//below makes the noise background
public PImage drawNoise(float _w, float _h, float _z) {
  //here's how it works and what it needs...
  PImage noise = createImage(PApplet.parseInt(_w), PApplet.parseInt(_h), GRAY);
  noise.loadPixels();
  for (int y = 0; y < noise.height; y++) {
    for (int x = 0; x < noise.width; x++) {
      noise.pixels[x+y*width] = color(255*getNoise(x, y, _z, noiseScale));
    }
  }
  noise.updatePixels();
  return noise;
}

public float getNoise(float _x, float _y, float _scale) {
  return noise(_x/_scale, _y/_scale);
}
public float getNoise(float _x, float _y, float _z, float _scale) {
  return noise(_x/_scale, _y/_scale, _z/_scale);
}

public PVector makeDirection(float _noise) {   
  float angle = map(_noise, 0, 1, -2*PI, 2*PI);
  return new PVector( cos(angle), sin(angle) );
}
//changes colors of the particles & lines over time
public void colorChanging() {
  p0fill = lerpColor(p0color, p0colorChange, smoothStep(0.2f, 0.7f, cStep));
  p1fill = lerpColor(p1color, p1colorChange, smoothStep(0.2f, 0.7f, cStep));

  cStep += 0.01f;

  if ( cStep > 1.5f) {
    cStep = 0.0f;
    p0color= p0colorChange;
    p0colorChange = color (random(98, 255), random(68, 220), random(136, 255));
    p1color= p1colorChange;
    p1colorChange = color (random(10, 63), random(10, 95), random(10, 212));
  }

  //uncomment here to check if the colors are actually changing!!!
  //println(cStep,pfill,p1fill);
}

//changes every 1.5 step
public float smoothStep(float index0, float index1, float cStep) {
  cStep = constrain((cStep - index0) / (index1 - index0), 0.0f, 1.5f); 
  return cStep * cStep;
}
class Particle {
  PVector direction;
  PVector velocity;
  PVector position;
  float speed = 0.3f;
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
  public void move() {
    int noiseScale = 600;
    float angle = noise(position.x/noiseScale, position.y/noiseScale)*15;
    direction.x = cos(angle);
    direction.y = sin(angle);
    velocity = direction.copy();
    velocity.mult(speed);
    position.add(velocity);
  }

  //gives direction for noise
  public void move(PVector _direction) {
    velocity = _direction.copy();
    velocity.mult(speed);
    position.add(velocity);
  }

  //once particles touch the edge, new ones appear at random positions
  public void touchedEdge () {
    if (position.x > width || position.x <0 || position.y > height || position.y <0) {
      position.x = random (width); 
      position.y = random (height);
    }
  }

  //draws particles
  public void display() {
    noStroke();
    smooth();
    ellipse(position.x, position.y, radius, radius);
  }

  //draws lines between particles
  public void drawLine(Particle _n) { 
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
      delta.mult(-0.5f);
      position.add(delta);
    }
  }

  //distance between particles
  public float distance(Particle _n) {
    return pow(pow(_n.position.x - position.x, 2) + pow(_n.position.y - position.y, 2), 0.5f);
  }
}
public void keyPressed() {
  switch( key ) {
  case 'n': //switch from noise background to default background
    showNoise = !showNoise;
    break;
  case 'r': //return to the original colors of the particles
    p0color = color (98, 68, 136);
    p1color = color (63, 95, 212);
    break;
  case 's': //save the current image
    saveFrame("output/Sky-####.png");
    println("saved!");
    break;
  default:
    println("key not recognized...");
    break;
  }
}
//draws default shimmering background
public void shimmeringBackground() {
  fill(255);
  noStroke();
  strokeWeight(2);
  for (int x = 0; x < width; x = x+ 100) {
    ellipse(random(width), random(height), 1, 1);
  }
  for (int y = 0; y < height; y = y + 100) {
    ellipse(random(width), random(height), 1, 1);
  }
}
  public void settings() {  size (800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SpaceSimulation_Final_Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
