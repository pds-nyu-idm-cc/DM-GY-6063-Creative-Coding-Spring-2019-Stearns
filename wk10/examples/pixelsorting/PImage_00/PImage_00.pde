// create a PImage instance and name the object "img"
PImage img;

void setup(){
  
  // initialize our canvas dimensions
  size(500, 500);
  
  // use loadImage() to load an image into img
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  
  // we only need to draw once
  noLoop();
  
}

void draw(){
  
  // draw our image, img to the canvas, at the given x, y coordinates
  image(img, 0, 0);
  
}

void mousePressed(){
  img.loadPixels();
  color pixel = img.pixels[ mouseX + mouseY * width];
  float red = red(pixel);
  float green = green(pixel);
  float blue = blue(pixel);
  println("Red: "+red+", Green: "+green+", Blue: "+blue);
}
