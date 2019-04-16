PGraphics myGraphic;
color fillColor;
void setup() {
  size(500, 500);
  myGraphic = createGraphics(width, height);
  background(255);
  drawRect(myGraphic);
  fillColor = randomColor();
}

void draw() {
  background(255);
  image(myGraphic, 0, 0);
  rectMode(CENTER);
  fill(fillColor);
  rect(width/2, height/2, width/2, height/2);
}

void drawRect(PGraphics _graphic) {
  _graphic.beginDraw();
  _graphic.loadPixels();
  for (int i = 0; i < _graphic.pixels.length; i++) {
    _graphic.pixels[i]=color(random(256), random(256), random(256));
  }
  _graphic.updatePixels();
  _graphic.endDraw();
}

color randomColor(){
  return color(random(256),random(256),random(256));
}

void keyPressed() {
  drawRect(myGraphic);
}

void mousePressed(){
  fillColor = randomColor();
}
