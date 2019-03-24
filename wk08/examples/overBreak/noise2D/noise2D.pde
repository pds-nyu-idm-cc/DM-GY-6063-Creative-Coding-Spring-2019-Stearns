float scale=.005;

void setup() {
  size(500, 500);
}

void draw() {
  drawNoise();
}

void drawNoise() {
  loadPixels();
  noiseDetail(4);
  for ( int y = 0; y < height; y++ ) {
    for ( int x = 0; x < width; x++ ) {
      pixels[y*width+x] = color(map(noise(x*scale, y*scale, scale*(mouseY+mouseX)/2),0,1,0,255));
    }
  }
  updatePixels();
}
