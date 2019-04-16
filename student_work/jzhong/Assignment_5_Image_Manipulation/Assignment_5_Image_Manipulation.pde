/*
I am attempting to make this program shuffle parts of the image
following the mouse movement.

Press 1 for a simple pixel array manipulation
  this function swaps out selected pixels with white pixels
 
Press 2 for shuffling
  this function copies the 64*64 portion on the left side
  of the mouse and flips it (mirror) on the right side
  
Press 's' key to save image
*/

PImage img;
float copy_x, copy_y, paste_x, paste_y;
int size = 64; //considering changing this to 32 because 64 seems to big


void setup() {
  size(100, 100);
  //the window size will comply to the image size
  surface.setResizable(true);
  img = loadImage("blueMountain.jpg");
  surface.setSize(img.width, img.height);
  //noLoop();

  //avoiding black box at the begining (doesnt seem to work?)
  paste_x = -100;
  paste_y = -100;
}
void draw() {

//set copy and paste cordinates
  copy_x = abs(mouseX-width);//this is what makes the image to flip
  copy_y = mouseY;
  paste_x = mouseX;
  paste_y = mouseY;

//making the switch
  if (key == '1') {
    randomWhiteDots(img);
  } else if (key == '2') {
    leftRightShuffle(paste_x, paste_y, getLeftRegion(copy_x, copy_y, size, img), img);
  } 

  image(img, 0, 0);
  
}

void randomWhiteDots(PImage _img) {
  int dimension = _img.width*_img.height;
  _img.loadPixels();
  for (int i = 0; i <dimension; i+= 2) {
    _img.pixels[i] = color(255);
  }
  img.updatePixels();
}

PImage getLeftRegion(float _x, float _y, float _size, PImage _img) {
  return _img.get(int(_x), int(_y), int(_size), int(_size));
}

void leftRightShuffle(float _x, float _y, PImage _source, PImage _destination) {
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

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("imgSaved-######.png");
  }
}
