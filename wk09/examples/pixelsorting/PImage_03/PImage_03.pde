PImage img;

void setup() {
  size(100, 100);
  surface.setResizable(true);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  surface.setSize(img.width, img.height);
  noLoop();
}

void draw() {
    image(img, 0, 0);
}
