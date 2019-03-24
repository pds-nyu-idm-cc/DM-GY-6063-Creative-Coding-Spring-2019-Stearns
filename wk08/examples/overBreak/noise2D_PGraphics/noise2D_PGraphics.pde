float scale=.005;

// PGraphics are Processing's core graphics and rendering context
// We can create and render to PGraphics objects off screen and treat as layers
PGraphics noise;

void setup() {
  size(500, 500);
  noise = createGraphics(width, height);
  background(255);
}

void draw() {
  
  background(255);
  
  // draw the noise to a PGraphics object
  drawNoise(noise);
  image(noise, 0, 0);
  

}

void drawNoise(PGraphics _graphic) {
  noiseDetail(3);
  _graphic.beginDraw();
  _graphic.loadPixels();
  for ( int y = 0; y < height; y++ ) {
    for ( int x = 0; x < width; x++ ) {
      _graphic.pixels[y*width+x] = color(map(noise(x*scale, y*scale, scale*(mouseY+mouseX)/2), 0, 1, 0, 255));
    }
  }
  _graphic.updatePixels();
  _graphic.endDraw();
}
