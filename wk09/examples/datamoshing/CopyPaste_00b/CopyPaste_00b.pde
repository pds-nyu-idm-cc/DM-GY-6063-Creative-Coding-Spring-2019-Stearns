
PImage img;

float copy_x;
float copy_y;

float copy_sX;
float copy_sY;

float paste_x;
float paste_y;

float paste_sX;
float paste_sY;

int size = 64;

void setup() {
  size(500, 500);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  
  copy_x = 0;
  copy_y = 0;
  paste_x = width/2;
  paste_y = height/2;
  
  copy_sX=random(-3,3);
  copy_sY=random(-3,3);
  
  paste_sX=random(-3,3);
  paste_sY=random(-3,3);
  
}

void draw() {
  
  //size = int(random(1,128));
  
  //size = int(mouseY*0.5);

  copy_x = wrapAroundScreenX( copy_x + copy_sX, img.width);
  copy_y = wrapAroundScreenY( copy_y + copy_sY, img.height);
  
  //copy_x = random(img.width);
  //copy_y = random(img.height);
  
  //paste_x = wrapAroundScreenX( paste_x + paste_sX, width);
  //paste_y = wrapAroundScreenY( paste_y + paste_sY, height);
  
  //paste_x = wrapAroundScreenX( paste_x + random(-3,3), width);
  //paste_y = wrapAroundScreenY( paste_y + random(-3,3), height);

  setImageRegion(paste_x, paste_y, getImageRegion(copy_x, copy_y, size, img), img);

  image(img, 0, 0);
  //image(getImageRegion(copy_x, copy_y, size, img),0,0);
  stroke(0);
  strokeWeight(0.5);
  noFill();
  square(copy_x, copy_y, size);
}



float wrapAroundScreenX(float _x, float _width){
  return (_x + _width) % _width;
}

float wrapAroundScreenY(float _y, float _height){
  return (_y + _height) % _height;
}

// returns a region in an image
PImage getImageRegion(float _x, float _y, float _size, PImage _image) {
  return _image.get(int(_x), int(_y), int(_size), int(_size));
}

// writes pixels from one PImage into another
void setImageRegion(float _x, float _y, PImage _source, PImage _destination) {
  _destination.loadPixels();
  for (int y = 0; y < _source.height; y++ ) {
    for (int x = 0; x < _source.width; x++) {
      int dest_x = int(_x)+x;
      int dest_y = int(_y)+y;
      if (dest_x < _destination.width && dest_y < _destination.height) {
        _destination.pixels[dest_y*_destination.width+dest_x]=_source.pixels[y*_source.width+x];
      }
    }
  }
  _destination.updatePixels();
}
