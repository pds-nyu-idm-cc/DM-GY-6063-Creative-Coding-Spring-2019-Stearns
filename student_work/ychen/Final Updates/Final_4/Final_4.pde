//arraylist & remove particles once they leave screen
//color change over time? - not showing random colors

//changed defalt background
//added sound

import processing.sound.*;
SoundFile file;
String audioName = "Space.mp3";
String path;

int total = 210;

color bgcolor = color (0);
color pcolor = color (98, 68, 136);
color p1color = color (63, 95, 212);
color pcolorChange = color (noise(mouseY/50, 100)*250, noise(mouseY/50, 200)*100, noise(mouseY/50, 200)*200);
color p1colorChange = color (noise(mouseX, 100)*100, noise(mouseX, 100)*150, noise(mouseX, 200)*350);
//color pcolorChange = color (random(98),random(68),random(136));
//color p1colorChange = color (random(63),random(95),random(212));

float maxDist = 70;
float minDist = 30;

PVector direction;
int noiseScale = 300;
float z = 0, zStep = 3;
boolean showNoise = false;

float delay = 10;

Particle [] allparticles = new Particle[total];
Particle [] allparticles_1 = new Particle[total];

void setup() {

  //fullScreen();
  size (800, 600);
  //frameRate(10);

  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.loop();

  //setting up multiple particles
  for (int i=0; i <total; i++) {
    allparticles[i] = new Particle();
    allparticles_1[i] = new Particle();
  }

  direction = new PVector();
}

void draw() {
  background (bgcolor); 

  if (showNoise) image(drawNoise(width, height, z), 0, 0);
  //makes the noise change over time
  z+=zStep;

  //determine distance between particles
  //also draw lines
  for (int i=0; i <total; i++) {
    for (int j=i+1; j<total; j++) {
      if (allparticles[i].distance(allparticles[j]) < maxDist) {
        stroke(pcolor);
        //if (frameCount%(2*delay)<delay) stroke(pcolorChange);
        strokeWeight(1);
        allparticles[i].drawLine(allparticles[j]);
      } else if (allparticles[i].distance(allparticles[j]) > minDist) {
        noStroke();
      }
      if (allparticles_1[i].distance(allparticles_1[j]) < maxDist) {
        stroke(p1color);
        //if (frameCount%(2*delay)<delay) fill(p1colorChange);
        strokeWeight(1);
        allparticles_1[i].drawLine(allparticles_1[j]);
      } else if (allparticles_1[i].distance(allparticles_1[j]) > minDist) {
        noStroke();
      }
    }
  }

  for (int i=0; i <total; i++) {

    float tempNoise = getNoise(allparticles[i].x, allparticles[i].y, z, noiseScale);
    direction = makeDirection(tempNoise);

    fill(pcolor);  
    //if (frameCount%(2*delay)<delay) fill(pcolorChange);
    allparticles[i].move(direction);
    allparticles[i].display();
    allparticles[i].touchedEdge();

    fill(p1color);
    //if (frameCount%(2*delay)<delay) fill(p1colorChange);
    allparticles_1[i].move(direction);
    allparticles_1[i].display();
    allparticles_1[i].touchedEdge();
  }

  shimmeringBackground();

  //println(pcolorChange, p1colorChange);
}


//  plan b: if changing colors overtime doesn't work well, 
//  this changes colors randomly when mouse is pressed at different locations
void mousePressed() {
  pcolor = color (noise(mouseY/50, 100)*250, noise(mouseY/50, 200)*100, noise(mouseY/50, 200)*200);
  p1color = color (noise(mouseX, 100)*100, noise(mouseX, 100)*150, noise(mouseX, 200)*350);
  println("Particles colors: " + pcolor, p1color);
}

void keyPressed() {
  switch( key ) {
  case 'n': //switch from noise background to default background
    showNoise = !showNoise;
    break;
  case 'r': //return to the original colors of the particles
    pcolor = color (98, 68, 136);
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

//make the shimmering background
void shimmeringBackground() {
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

//make the noise background
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
