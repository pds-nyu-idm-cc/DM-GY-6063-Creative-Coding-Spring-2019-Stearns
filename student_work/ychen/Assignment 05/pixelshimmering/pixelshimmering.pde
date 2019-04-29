//shimmering effect

PImage img;

void setup() {
  size(640, 360);
  img = loadImage("redboat.JPG");
}

void draw() {
  for (int i = 0; i<100; i++) {
    float x = random(width);
    float y = random(height);
    color c = img.get(int(x), int(y));
    fill(c, 20);
    noStroke();
    ellipse(x, y, 16, 16);
  }
  
  saveFrame("output/redboat_####.png");
}
