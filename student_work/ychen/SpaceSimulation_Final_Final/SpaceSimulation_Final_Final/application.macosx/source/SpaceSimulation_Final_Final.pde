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

import processing.sound.*;
SoundFile file;
String audioName = "data/Space.mp3";
String path;

int total = 210; //total number of particles

color bgcolor = color (0); //background color
color p0fill; //color of first set of particles
color p1fill; //color of second set of particles
color p0color, p1color, p0colorChange, p1colorChange; //color changing variables for lerpColor();
float cStep = 0.0; //color changing increment

float maxDist = 70; //defines the distance between particles

PVector direction;
int noiseScale = 300;
float z = 0, zStep = 3;
boolean showNoise = false;

Particle [] allparticles_0 = new Particle[total];
Particle [] allparticles_1 = new Particle[total];

void setup() {

  //fullScreen();
  size (800, 600);

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

void draw() {

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

void initColor() {
  p0fill = p0color;
  p0color = color (98, 68, 136);
  p0colorChange = color (80, random(98), random(68), random(136));

  p1fill = p1color;
  p1color = color (63, 95, 212);
  p1colorChange = color (80, random(63), random(95), random(212));

  cStep = 0;
}

//below makes the noise background
PImage drawNoise(float _w, float _h, float _z) {
  //here's how it works and what it needs...
  PImage noise = createImage(int(_w), int(_h), GRAY);
  noise.loadPixels();
  for (int y = 0; y < noise.height; y++) {
    for (int x = 0; x < noise.width; x++) {
      noise.pixels[x+y*width] = color(255*getNoise(x, y, _z, noiseScale));
    }
  }
  noise.updatePixels();
  return noise;
}

float getNoise(float _x, float _y, float _scale) {
  return noise(_x/_scale, _y/_scale);
}
float getNoise(float _x, float _y, float _z, float _scale) {
  return noise(_x/_scale, _y/_scale, _z/_scale);
}

PVector makeDirection(float _noise) {   
  float angle = map(_noise, 0, 1, -2*PI, 2*PI);
  return new PVector( cos(angle), sin(angle) );
}
