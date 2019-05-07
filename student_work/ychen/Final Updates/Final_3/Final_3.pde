//arraylist, remove particles


int total = 200;
color bgcolor = color (24, 10, 60);
color pcolor = color (219, 123, 137);
color p1color = color (85, 102, 170);
float maxDist = 70;
//float minDist = 30;

//we're taking it all apart to understand the noise
PVector direction;
int noiseScale = 150;
PImage noiseBackground;
float z = 0; 
float zStep = 2;


Particle [] allparticles = new Particle[total];
Particle [] allparticles_1 = new Particle[total];

void setup() {

  //fullScreen();
  size (800, 600);
  frameRate(20);

  //setting up multiple particles
  for (int i=0; i <total; i++) {
    allparticles[i] = new Particle();
    allparticles_1[i] = new Particle();
  }

  direction = new PVector ();
  
  noiseBackground = drawNoise();
}

void draw() {
  background (bgcolor);
  image(drawNoise(), 0,0);

  for (int i=0; i <total; i++) {
    for (int j=i+1; j<total; j++) {
      if (allparticles[i].distance(allparticles[j]) < maxDist) {
        stroke(pcolor);
        strokeWeight(1);
        allparticles[i].drawLine(allparticles[j]);
      } else {
      }
      if (allparticles_1[i].distance(allparticles_1[j]) < maxDist) {
        stroke(p1color);
        strokeWeight(1);
        allparticles_1[i].drawLine(allparticles_1[j]);
      } else {
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
    allparticles[i].changeColor();

    fill(p1color);
    allparticles_1[i].move(direction);
    allparticles_1[i].display();
    allparticles_1[i].touchedEdge();
    allparticles_1[i].changeColor();
  }
}



PImage drawNoise() {
  PImage noise = createImage(width, height, GRAY);
  noise.loadPixels();
  for (int y=0; y<noise.height; y++){
    for (int x = 0; x<noise.width; x++){
      noise.pixels[x+y*width] = color (255*getNoise (x, y, z,noiseScale));
    }
  }
  noise.updatePixels();
  z+=zStep;
  return noise;
  
}

float getNoise (float _x, float _y, float _scale) {
  return noise(_x/_scale, _y/_scale);
}

float getNoise (float _x, float _y, float _z, float _scale) {
  return noise(_x/_scale, _y/_scale, _z/_scale);
}

PVector makeDirection(float _noise) {
  float angle = map (_noise, 0, 1, -2*PI, 2*PI);
  return new PVector(cos(angle), sin(angle));
}
