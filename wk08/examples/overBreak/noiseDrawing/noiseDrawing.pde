float scale=.005;

// PGraphics are Processing's core graphics and rendering context
// We can create and render to PGraphics objects off screen and treat as layers

PGraphics noise;
PGraphics path;

boolean showNoise=true; // use 'n' key to toggle
boolean showPath=true; // use 'p' key to toggle
boolean showMover=false; // use 'm' key to toggle

Mover mover = new Mover();

void setup() {
  size(500, 500);
  noise = createGraphics(width, height);
  path = createGraphics(width, height);
  background(255);
}

void draw() {
  
  background(255);
  
  // draw the noise to a PGraphics object
  drawNoise(noise);
  // display the noise?
  if (showNoise) image(noise, 0, 0);
  
  // use the coordinates of a mover to draw a path a PGraphics object
  drawPath(path, mover);
  // show the path?
  if (showPath) image(path, 0, 0);

  // calculate and apply the force from the noise
  mover.forceB(forceFromBrightness(noise, mover));
  // move the mover
  mover.update();
  // draw?
  if (showMover) mover.render();
  
}

float forceFromBrightness(PGraphics _graphic, Mover _mover){
  // grab the pixel value from where the mover is 
  color pixel = _graphic.pixels[int(_mover.position.x)+int(_mover.position.y)*width];
  
  float force = (brightness(pixel)/255)-0.5;
  return force;
}

void drawPath(PGraphics _graphic, Mover _mover) {
  _graphic.beginDraw();
  _graphic.strokeWeight(0);
  _graphic.fill(255);
  _graphic.circle(_mover.position.x, _mover.position.y, _mover.r*2);
  _graphic.endDraw();
}

void drawNoise(PGraphics _graphic) {
  noiseDetail(3);
  _graphic.beginDraw();
  _graphic.loadPixels();
  for ( int y = 0; y < height; y++ ) {
    for ( int x = 0; x < width; x++ ) {
      float noise = noise(x*scale, y*scale, scale*(mouseY+mouseX)/2);
      _graphic.pixels[y*width+x] = color(map(noise, 0, 1, 0, 255));
    }
  }
  _graphic.updatePixels();
  _graphic.endDraw();
}
