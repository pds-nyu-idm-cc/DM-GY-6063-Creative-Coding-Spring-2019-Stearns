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

void setup() {
  size(500, 500);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  
  // initialize the locations
  copy_x = 0;
  copy_y = 0;
  
  paste_x = width/2;
  paste_y = height/2;
  
  // initialize the speed
  copy_sX=random(-3,3);
  copy_sY=random(-3,3);
  
  paste_sX=random(-3,3);
  paste_sY=random(-3,3);
  
}

void draw() {
  
  // change the size of the copy/paste region each frame
  //size = int(random(1,128));
  size = int(mouseY*0.5);

  // copy region moves at a constant velocity and wraps around the image
  //copy_x = wrapAroundX( copy_x + copy_sX, img.width);
  //copy_y = wrapAroundY( copy_y + copy_sY, img.height);
  
  // copies from a random location
  copy_x = random(img.width);
  copy_y = random(img.height);
  
  // paste moves at a constant velocity and wraps around the screen
  //paste_x = wrapAroundX( paste_x + paste_sX, width);
  //paste_y = wrapAroundY( paste_y + paste_sY, height);
  
  // paste region moves in a drunk walk
  paste_x = wrapAroundX( paste_x + random(-3,3), width);
  paste_y = wrapAroundY( paste_y + random(-3,3), height);

  setImageRegion(paste_x, paste_y, getImageRegion(copy_x, copy_y, size, img), img);

  image(img, 0, 0);
  
  
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
  //return _image.get(int(_x), int(_y), int(_size), int(_size));
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
