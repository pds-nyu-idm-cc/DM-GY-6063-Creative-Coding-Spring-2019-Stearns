// create a PImage instance and name the object "img"
PImage img;

void setup() {

  // initialize our canvas dimensions
  size(200, 600);

  // use loadImage() to load an image into img
  img = loadImage("images/windows_xp_bliss-wide.jpg");

  // we only need to draw once
  noLoop();
}

void draw() {
  // resize using stretch to fill method
  //img.resize(width, height);

  // resize using scale to fill
  // calculate the aspect ratios of the image and the screen
  float img_ratio = float(img.width) / float(img.height);
  float screen_ratio = float(width) / float(height);

    if (img_ratio > screen_ratio){
     img.resize( int( height * img_ratio ) , height);
    } else {
     img.resize( width , int( width / img_ratio ));
    }
    
  // draw our image, img to the canvas, at the given x, y coordinates
  image(img, 0, 0);
}
