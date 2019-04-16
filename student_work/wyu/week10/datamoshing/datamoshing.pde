///////combing the pixel sorting and datamoshing
////////reference from Philps' week 10 note about datamoshing00 and pixelSort03

PImage img;
//int range_start;
int range = 100;
//int range_height;
float copy_x;
float copy_y;
float paste_x;
float paste_y;
int size = 400;

//the size of picture
void setup() {
  //////////////////copy and paste 
  copy_x = 0;
  copy_y = 0;
  paste_x = width/2;
  paste_y = height/2;
  ///////////////////scalling
  size(500, 500);
  surface.setResizable(true);
  img = loadImage("milkyway.jpg");
  surface.setSize(img.width, img.height);
  //noLoop();
  //range_start = mouseY
  //range_height= range_start + range;
}

void draw() {
  copy_x = mouseX;
  copy_y = mouseY;
  // paste_x = width/2;
  //paste_y = height/2;
  //setImageRegion(paste_x, paste_y, getImageRegion(copy_x, copy_y, size, img), img);
  ////////////loop 
  for (int i=0; i<10; i++) {
    //setImageRegion(paste_x, paste_y, getImageRegion(copy_x, copy_y, size, img), img);
    sortImgRows(img);
    sortImgCols(img);
    setImageRegion(paste_x, paste_y, getImageRegion(copy_x, copy_y, size, img), img);
    image(img, 0, 0);
  }
  //image(img, 0, 0);
}
//void sortRange(float y){
//   y = img.height/4; 
//   y < img.height/2
//  }

// //////////////////row Sorting
//get pixels color
color[] getImgRow(int _y, PImage _image) {
  color[] px = new color[_image.width];
  for (int x = 0; x < img.width; x++) {
    px[x] = img.pixels[ _y * width + x ];
  }
  return px;
}
//set pixels color
void setImgRow(int _y, color[] _pixels, PImage _image) {
  for (int x = 0; x < _image.width; x++) {
    _image.pixels[ _y * width + x ]= _pixels[x];
  }
}
//sort
void sortImgRows(PImage _image) {
  _image.loadPixels();
  //for (int y = img.height/4; y < img.height/2; y++)
  //sort range 
  for (int y = mouseY; y < mouseY+ range && mouseY+range < height; y++) {
    setImgRow( y, sort( getImgRow( y, _image ) ), _image );
  }
  _image.updatePixels();
}



// column Sorting
//get pixel color
color[] getImgCol(int _x, PImage _image) {
  color[] px = new color[_image.height];
  for (int y = 0; y < img.height; y++) {
    px[y] = img.pixels[ y * width + _x ];
  }
  return px;
}
//set pixel color
void setImgCol(int _x, color[] _pixels, PImage _image) {
  for (int y = 0; y < _image.height; y++) {
    _image.pixels[ y * width + _x ]= _pixels[y];
  }
}
//sort
void sortImgCols(PImage _image) {
  _image.loadPixels();
  for (int x = mouseX; x < mouseX+range && mouseX+range < width; x++) {
    setImgCol( x, sort( getImgCol( x, _image ) ), _image );
  }
  _image.updatePixels();
}




// datamoshing 
//the range of datamoshing
PImage getImageRegion(float _x, float _y, float _size, PImage _image) {
  return _image.get(int(_x), int(_y), int(_size), int(_size));
}

// set pixels color
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

//save
void keyPressed() {
  if (key == 's') {
    saveFrame("img-" + (int)random(100, 150) +".jpg");
  }
}
