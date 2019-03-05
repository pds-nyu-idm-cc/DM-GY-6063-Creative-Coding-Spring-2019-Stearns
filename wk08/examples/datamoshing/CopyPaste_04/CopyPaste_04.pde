// the image, what else?
PImage img;

// the location of where we want to copy pixels from
float copy_x;
float copy_y;

// the speed at which we want to move the copy location
float copy_sX;
float copy_sY;

// the location to which we want to paste our pixels
float paste_x;
float paste_y;

// the speed at which we want to relocate the paste location
float paste_sX;
float paste_sY;

// the size of the copy/paste region
int size = 64;

// store grid size
int gridSizeX;
int gridSizeY;

void setup() {
  size(500, 500);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  
  // initialize the locations
  copy_x = 0;
  copy_y = 0;
  
  paste_x = width/2;
  paste_y = height/2;
  
  // calculate grid size
  gridSizeX = int(width/float(size))+1;
  gridSizeY = int(height/float(size))+1;
  
  // initialize the speed of copy and paste
  copy_sX=random(-3,3);
  copy_sY=random(-3,3);
  paste_sX=random(-3,3);
  paste_sY=random(-3,3);
  
}

void draw() {
  moshGrid();
  image(img, 0, 0);
  //drawCopyRegion();
}

void moshGrid(){
  
  for (int y = 0; y < gridSizeY; y++ ) {
    for (int x = 0; x < gridSizeX; x++) {
     
      copy_x = x * size + ( int( random( -3, 3 ) ) ) ;
      copy_y = y * size + ( int( random( -3, 3 ) ) ) ;
      paste_x = x * size;
      paste_y = y * size;
      // copy from a region on the image and paste it back in a slightly different place
      setImageRegion(paste_x, paste_y, getImageRegion(copy_x, copy_y, size, img), img);
    }
  }
  
}

void drawCopyRegion(){
  // renders the copy region
  stroke(0);
  strokeWeight(0.5);
  noFill();
  square(copy_x, copy_y, size);
}

// keep the x coordinates on screen
float wrapAroundX(float _x, float _width){
  return (_x + _width) % _width;
}

// keep the y coordinates on screen
float wrapAroundY(float _y, float _height){
  return (_y + _height) % _height;
}

// returns a region in an image
PImage getImageRegion(float _x, float _y, float _size, PImage _source) {
  PImage buffer = createImage( int( _size ), int( _size ), RGB);
  _source.loadPixels();
  for ( int y = 0; y < buffer.height ; y++ ) {
    for ( int x = 0; x < buffer.width ; x++ ) {
      int source_x = int( wrapAroundX( _x + x , _source.width ) );
      int source_y = int( wrapAroundY( _y + y , _source.height ) );
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
