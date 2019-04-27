// Lauren Pixelator Machine
float angle=0;
float angleStep=0.05;
PImage img;

float rMin=13;
float rMax=62;
float gMin=2;
float gMax=241;
float bMin=14;
float bMax=134;

String mode = "RED"; // RED, GREEN, BLUE, SATURATION, BRIGHTNESS, HUE we use this strings to select a mode


boolean clearBackground = false;

void setup() {
  size(800, 800);
  img = loadImage("butterfly.jpeg");
  image(img, 0, 0);
  pixelate();
}

void draw() {
  pixelate();
  angle+=angleStep;
}

void randomizeBackground() {
  background(random(0, 255), 0, 0);
}

void mousePressed()
{
  saveFrame("image-####.jpg");
}

void keyPressed()
{

  switch(key) {
  case '1':
    mode = "RED";
    break;
  case '2':
    mode = "BLUE";
    break;
  case '3':
    mode = "GREEN";
    break;
    case '4':
    mode = "YAHOO!";
    break;
    case 'r':
    randomizeBackground();
    break;
    default:
    println("Nope! "+key);
    break;
  }
  println("Mode: "+mode);
}

void pixelate() {

  scale(1); 
  loadPixels();
  for (int y = 0; y<height; y+=1 ) {
    for (int x = 0; x<width; x+=1) {
      int loc = x + y*width;
      float a = img.pixels[loc] >> 24 & 0xFF;
      float r = img.pixels[loc] >> 16 & 0xFF;
      float g = img.pixels[loc] >> 8 & 0xFF;
      float b = img.pixels[loc] & 0xFF;

      //float r = red (pixels[loc]);
      //float g = green (pixels[loc]);
      //float b = blue (pixels[loc]);

      //float r = red (img.pixels[loc]);
      //float g = green (img.pixels[loc]);
      //float b = blue (img.pixels[loc]);
      
      float av = brightness(pixels[loc]);
      //float av = ((r+g+b)/3.0);



      drawLine(x, y, r, g, b, av);
    }
  }
  //println("Finished Lauren!");
  //noLoop();
}

void drawLine(float _x, float _y, float _r, float _g, float _b, float _av) {
  pushMatrix();
  translate(_x+mouseX/4, _y+mouseY/4);
  stroke(_r, _g, _b);
  rotate(angle);

  switch(mode) {

  case "RED":
    if (_r > rMin && _r < rMax) {
      line(0, 0, (_av-255)/3, 0); //this value alters the length. The closer to 0 the longer the lines.
    }
    break;

  case "GREEN":
    if (_g > gMin && _g < gMax) {
      line(0, 0, (_av-255)/3, 0); //this value alters the length. The closer to 0 the longer the lines.
    }
    break;

  case "BLUE":
    if (_b > bMin && _b < bMax) {
      line(0, 0, (_av-255)/3, 0); //this value alters the length. The closer to 0 the longer the lines.
    }
    break;

  case "SATURATION":
    break;
  case "BRIGHTNESS":
    break;
  case "HUE":
    break;

  default:
    println("I don't understand that mode! "+mode);
    break;
  }

  popMatrix();
}
