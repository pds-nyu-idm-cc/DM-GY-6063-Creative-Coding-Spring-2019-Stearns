PImage img;

void setup() {
  size(100, 100);
  surface.setResizable(true);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  surface.setSize(img.width, img.height);
  noLoop();
}

void draw() {
  sortPixels(img);
  image(img, 0, 0);
}

void sortPixels(PImage _image){
  _image.loadPixels();
  _image.pixels=sort(_image.pixels);
  _image.updatePixels();
}
