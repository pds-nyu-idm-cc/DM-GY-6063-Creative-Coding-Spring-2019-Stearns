//load image

PImage img;

void setup() {
  size (1000,1000);
  img = loadImage("pool2.png");
}
//use filter to invert colors when mouse is clicked
void draw () {
   image(img, 0, 0);
   if (mousePressed == true) {
     filter(INVERT);    
   }
  //switch red and green values for any pixel that matches mouse location
  
   loadPixels();
   color c = get(mouseX, mouseY);
   
   for (int i = 0; i < (width*height); i++) {
     if (abs(blue(pixels[i]) - blue(c)) < 30) {
       float r = red(c);
       float g = green(c);
       pixels[i] = color(g,r,blue(c));
     }
   }
   updatePixels();
}
