// the image, what else?
PImage img;

Region[] region;

// the size of the copy/paste region
int size = 32;

// store grid size
int gridSizeX;
int gridSizeY;

void setup() {
  size(500, 500);
  img = loadImage("images/windows_xp_bliss-wide.jpg");


  // calculate grid size
  gridSizeX = int(width/float(size))+1;
  gridSizeY = int(height/float(size))+1;

  // initialize the locations
  region = new Region[gridSizeX * gridSizeY];


  for (int y = 0; y < gridSizeY; y++ ) {
    for (int x = 0; x < gridSizeX; x++) {
      region[y*gridSizeY+x]= new Region(new PVector(x * size, y * size));
      // copy from a region on the image and paste it back in a slightly different place
    }
  }
}

void draw() {
  moshGrid();
  image(img, 0, 0);
}

void moshGrid() {

  for (int y = 0; y < gridSizeY; y++ ) {
    for (int x = 0; x < gridSizeX; x++) {
      int regionIndex= y*gridSizeY+x;
      float copy_x = x * size + ( int( random( -3, 3 ) ) ) ;
      float copy_y = y * size + ( int( random( -3, 3 ) ) ) ;
      region[regionIndex].p = new PVector(copy_x, copy_y);
      // copy from a region on the image and paste it back in a slightly different place
      setImageRegion(region[regionIndex].o.x, region[regionIndex].o.y, getImageRegion(region[regionIndex].p.x, region[regionIndex].p.y, size, img), img);
    }
  }
}


// keep the x coordinates on screen
float wrapAroundX(float _x, float _width) {
  return (_x + _width) % _width;
}

// keep the y coordinates on screen
float wrapAroundY(float _y, float _height) {
  return (_y + _height) % _height;
}

// returns a region in an image
PImage getImageRegion(float _x, float _y, float _size, PImage _source) {
  PImage buffer = createImage( int( _size ), int( _size ), RGB);
  _source.loadPixels();
  for ( int y = 0; y < buffer.height; y++ ) {
    for ( int x = 0; x < buffer.width; x++ ) {
      int source_x = int( wrapAroundX( _x + x, _source.width ) );
      int source_y = int( wrapAroundY( _y + y, _source.height ) );
      buffer.pixels[ y * buffer.width + x ] = _source.pixels[ source_y * _source.width + source_x ];
    }
  }
  buffer.updatePixels();

  return buffer;
}

// writes pixels from one PImage into another
void setImageRegion(float _x, float _y, PImage _source, PImage _destination) {
  _destination.loadPixels();
  for (int y = 0; y < _source.height; y++ ) {
    for (int x = 0; x < _source.width; x++) {
      int dest_x = int(wrapAroundX(_x+x, _destination.width));
      int dest_y = int(wrapAroundY(_y+y, _destination.width));
      _destination.pixels[dest_y*_destination.width+dest_x]=_source.pixels[y*_source.width+x];
    }
  }
  _destination.updatePixels();
}

class Region {
  PVector o = new PVector();
  PVector p = new PVector();
  PVector v = new PVector();
  PVector a = new PVector();
  int size = 32;

  Region() {
  }

  Region(PVector _o) {
    o=_o;
    p=o;
  }

  Region(float _x, float _y) {
    p=new PVector(_x, _y);
  }

  void update() {
    p.add(v);
  }

  void update(PVector _v) {
    p.add(_v);
  }
}
