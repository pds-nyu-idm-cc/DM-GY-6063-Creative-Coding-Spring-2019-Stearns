PImage img;

void setup() {
  size(100, 100);
  surface.setResizable(true);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  surface.setSize(img.width, img.height);
  noLoop();
}

void draw() {
  sortCols(img);
  image(img, 0, 0);
}

void sortCols(PImage _image) {

  color[] col = new color[img.height];

  _image.loadPixels();

  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      col[y] = img.pixels[ y * width + x ];
    }

    col = sort(col);
    col = reverse(col);
    
    for (int y = 0; y < img.height; y++) {
      img.pixels[ y * width + x ]= col[y];
    }
  }
  _image.updatePixels();
}
