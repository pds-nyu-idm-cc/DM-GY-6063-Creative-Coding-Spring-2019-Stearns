//color changed
//changed defalt background
//added sound

//import processing.sound.*;
//SoundFile file;
//String audioName = "Space.mp3";
//String path;

int total = 210;

color bgcolor = color (0);
color pcolor = color (98, 68, 136);
color p1color = color (63, 95, 212);

float maxDist = 70;
float minDist = 30;

PVector direction;
int noiseScale = 300;
float z = 0, zStep = 3;
boolean showNoise = false;

Particle [] allparticles = new Particle[total];
Particle [] allparticles_1 = new Particle[total];

TriWave red;
TriWave green;
TriWave blue;

void setup() {

  //fullScreen();
  size (800, 600);

  //path = sketchPath(audioName);
  //file = new SoundFile(this, path);
  //file.loop();

  //setting up multiple particles
  for (int i=0; i <total; i++) {
    allparticles[i] = new Particle();
    allparticles_1[i] = new Particle();
  }

  direction = new PVector();
  
  red = new TriWave();
  green = new TriWave();
  blue = new TriWave();
}

void draw() {
  background (bgcolor); 
  
  pcolor = color(red.get()*98,green.get()*68,blue.get()*136);
  p1color = color(red.get()*63,green.get()*95,blue.get()*212);
  red.update();
  green.update();
  blue.update();

  if (showNoise) image(drawNoise(width, height, z), 0, 0);
  //makes the noise change over time
  z+=zStep;

  //determine distance between particles
  //also draw lines
  for (int i=0; i <total; i++) {
    for (int j=i+1; j<total; j++) {
      if (allparticles[i].distance(allparticles[j]) < maxDist) {
        stroke(pcolor);
        strokeWeight(1);
        allparticles[i].drawLine(allparticles[j]);
      } 
      if (allparticles_1[i].distance(allparticles_1[j]) < maxDist) {
        stroke(p1color);
        strokeWeight(1);
        allparticles_1[i].drawLine(allparticles_1[j]);
      } 
    }
  }

  for (int i=0; i <total; i++) {

    float tempNoise = getNoise(allparticles[i].x, allparticles[i].y, z, noiseScale);
    direction = makeDirection(tempNoise);

    fill(pcolor); 
    allparticles[i].move(direction);
    allparticles[i].display();
    allparticles[i].touchedEdge();

    fill(p1color);
    allparticles_1[i].move(direction);
    allparticles_1[i].display();
    allparticles_1[i].touchedEdge();
  }

  shimmeringBackground();

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
