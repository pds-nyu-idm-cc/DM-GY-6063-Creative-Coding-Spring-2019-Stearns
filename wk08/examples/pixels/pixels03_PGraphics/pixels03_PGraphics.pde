PGraphics myGraphic;

void setup() {
  size(500, 500);
  myGraphic = createGraphics(width, height);
  background(255);
  drawRect(myGraphic);
}

void draw() {
  background(255);
  image(myGraphic, 0, 0);
}

void drawRect(PGraphics _graphic) {
  _graphic.beginDraw();
  _graphic.clear();
  _graphic.fill(color(random(256), random(256), random(256)));
  _graphic.rectMode(CENTER);
  _graphic.rect(width/2, height/2, width/(random(3)+1), height/(random(3)+1));
  _graphic.endDraw();
}

void keyPressed() {
  drawRect(myGraphic);
}
