PImage img;

float copy_x;
float copy_y;
float paste_x;
float paste_y;
int size = 64;

int gridSizeX;
int gridSizeY;

void setup() {
  size(500, 500, P2D);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  copy_x = 0;
  copy_y = 0;
  paste_x = width/2;
  paste_y = height/2;

  gridSizeX = int(width/float(size))+1;
  gridSizeY = int(height/float(size))+1;
}

void draw() {


  for (int y = 0; y < gridSizeY; y++ ) {
    for (int x = 0; x < gridSizeX; x++) {
      
      copy_x = x * size + ( int( random( -3, 3 ) ) ) ;
      copy_y = y * size + ( int( random( -3, 3 ) ) ) ;
      paste_x = x * size;
      paste_y = y * size;

      setImageRegion(paste_x, paste_y, getImageRegion(copy_x, copy_y, size, img), img);
    }
  }
  
  image(img, 0, 0);

  drawGrid();
}

void drawGrid() {
  stroke(127);
  strokeWeight(0.5);
  
  for (int x = 0; x < gridSizeX; x++) {
    int lineX = (x)*size;
    line(lineX, 0, lineX, height);
  }
  
  
  for (int y = 0; y < gridSizeY; y++) {
    int lineY = (y)*size;
    line(0, lineY, width, lineY);
  }
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
      // translate to the coordinates in the _destination image
      int dest_x = int(_x)+x;
      int dest_y = int(_y)+y;
      // write pixels only to coordinates within the _destination image
      if (dest_x < _destination.width && dest_y < _destination.height) {
        _destination.pixels[dest_y*_destination.width+dest_x]=_source.pixels[y*_source.width+x];
      }
    }
  }
  _destination.updatePixels();
}
