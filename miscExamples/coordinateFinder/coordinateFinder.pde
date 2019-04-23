/**
 A simple tool to get window coordiates
 */

PImage bgImage;

void setup() {
  size(10, 10);
  background(255);
  frameRate(30);

  try {

    bgImage = loadImage("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Penguins_walking_-Moltke_Harbour%2C_South_Georgia%2C_British_overseas_territory%2C_UK-8.jpg/827px-Penguins_walking_-Moltke_Harbour%2C_South_Georgia%2C_British_overseas_territory%2C_UK-8.jpg");
    surface.setSize(bgImage.width, bgImage.height);
    image(bgImage, 0, 0);
  } 
  catch(Exception e) {

    surface.setSize(500, 500);
    background(255);
  }
}

void draw() {

  if (bgImage != null) {
    image(bgImage, 0, 0);
  } else {
    background(255);
  }

  whereAmI();
}

void whereAmI() {
  // store the mouse coordinates
  int x = mouseX;
  int y = mouseY;
  // load pixels array
  loadPixels();
  // grab the color at the mouse coordinates and invert it
  color c = pixels[x+width*y] ^ 0xFFFFFF;
  stroke(c);
  // draw crosshairs
  line(x, 0, x, height);
  line(0, y, width, y);
  fill(c);
  // write coordinates to screen
  String text = "("+x+","+y+")";
  text(text, x+5, y-5);
}

void mousePressed() {
  println("Mouse pressed @: x="+mouseX+", y="+mouseY);
}
