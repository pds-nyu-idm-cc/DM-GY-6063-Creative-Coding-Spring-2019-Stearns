// demostrating how abstraction simplifies code
// using a boolean variable to select sorting direction
// using key bindings to set boolean variable "flags"

PImage img;
boolean reverseRowSort = false;

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

////////////////////////////////////////////////////////////
// sortRows()

void sortRows(PImage _image) {

  _image.loadPixels();

  for (int y = 0; y < img.height; y++) {
    if (reverseRowSort) {
      setImgRow(y, reverse(sort(getImgRow(y, img))), img);
    } else {
      setImgRow(y, sort(getImgRow(y, img)), img);
    }
  }
  _image.updatePixels();
}

////////////////////////////////////////////////////////////
// get and set rows of pixels in an image object

color[] getImgRow(int _y, PImage _image) {
  color[] row = new color[_image.width];
  for (int x = 0; x < _image.width; x++) {
    row[x] = _image.pixels[ _y * _image.width + x ];
  }
  return row;
}

void setImgRow(int _y, color[] _row, PImage _image) {
  for (int x = 0; x < _image.width; x++) {
    _image.pixels[ _y * _image.width + x ]= _row[x];
  }
}

////////////////////////////////////////////////////////////
// key bindings

void keyPressed(){
  switch(key){
    case 'r':
    reverseRowSort = !reverseRowSort;
    redraw();
    break;
  }
}
