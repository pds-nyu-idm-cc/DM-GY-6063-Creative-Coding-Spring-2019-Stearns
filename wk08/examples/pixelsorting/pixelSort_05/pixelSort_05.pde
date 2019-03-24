// trying to figure out how to scan an array of pixels
// set an in and out point for sorting a specific part
// in progres... not working


PImage img;
boolean reverseRowSort = false;
String fileName = new String();
color inThreshold = color(0);
color outThreshold = color(127);


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
  //if (fileName != null || !fileName.equals("")) {
  //  img.save(fileName);
  //}
}

////////////////////////////////////////////////////////////
// sortAllThePixels()

void sortAllThePixels(PImage _image) {
  _image.loadPixels();
  _image.pixels=sort(_image.pixels);
  _image.updatePixels();
}

////////////////////////////////////////////////////////////
// sortRows()

void sortRows(PImage _image) {

  _image.loadPixels();

  for (int y = 0; y < img.height; y++) {
    setImgRow(y, reverse(mySort(getImgRow(y, img), inThreshold, outThreshold)), img);
    //if (reverseRowSort) {
    //  setImgRow(y, reverse(mySort(getImgRow(y, img), 0xFFffffff, 0xFF000000)), img);
    //  fileName="output/reverseTrue.png";
    //} else {
    //  setImgRow(y, sort(getImgRow(y, img)), img);
    //  fileName="output/reverseFalse.png";
    //}
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

void keyPressed() {
  switch(key) {

  case 'r':
    reverseRowSort = !reverseRowSort;
    redraw();
    break;

  case 'a':
    redraw();
    break;

  default:
    println("That key isn't recognized.");
    break;
  }
}

////////////////////////////////////////////////////////////
// mySort

color[] mySort(color[] _colors, color _inThreshold, color _outThreshold) {

  // create in an out points, -1 means they haven't been set
  int in=-1;
  int out=-1;

  // iterate through the _colors array
  for ( int i = 0; i < _colors.length; i++) {
    
    
    // if in hasn't been set yet, check whether we're above the inThreshold
    if (in == -1) {
      if (_colors[i] > _inThreshold)in = i;
    } else { // otherwise, check whether we're above the outThreshold
      if (_colors[i] > _outThreshold) out = i;
    } 
    
    
    //if the current pixel is above the threshold, set in to current index
    if (in != -1 && out != -1 && in != out) {

      color[] px = new color[ ( out - in ) + 1];
      
      for (int j = 0; j < px.length; j++) {
        px[j] = _colors[j+in];
      }
      
      px = sort(px);
      
      for (int j = 0; j < px.length; j++) {
        _colors[j+in] = px[j];
      }
      
    }
    
  }

  return _colors;
}
