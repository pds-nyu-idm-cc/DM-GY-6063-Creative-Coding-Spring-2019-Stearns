float scale=.025;
int seed = 9999;
int octaves = 3;
float falloff = .5;
float z=0;
float zStep=.0025;

void setup() {
  size(600, 300);
  noiseSeed(seed);
  noiseDetail(octaves, falloff);
}

void draw() {
  drawNoise();
}

void drawNoise() {
  loadPixels();
  noiseDetail(4);
  for ( int y = 0; y < height; y++ ) {
    for ( int x = 0; x < width; x++ ) {
      pixels[y*width+x] = color(map(noise(x*scale, y*scale, z),0,1,0,255));
    }
  }
  z+=zStep;
  updatePixels();
}
