PImage img;

void setup() {
  size(100, 100);
  surface.setResizable(true);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  surface.setSize(img.width, img.height);
  noLoop();
}

void draw() {
  sortRows(img);
  image(img, 0, 0);
}

void sortAllThePixels(PImage _image) {
  _image.loadPixels();
  _image.pixels=sort(_image.pixels);
  _image.updatePixels();
}

void sortRows(PImage _image) {

  color[] row = new color[img.width];

  _image.loadPixels();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      row[x] = img.pixels[ y * width + x ];
    }

    row = sort(row);

    for (int x = 0; x < img.width; x++) {
      img.pixels[ y * width + x ]= row[x];
    }
  }
  _image.updatePixels();
}
