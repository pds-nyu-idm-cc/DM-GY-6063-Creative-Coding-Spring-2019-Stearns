// Lauren Pixelator Machine

PImage img;

boolean clearBackground = false;

void setup() {
  img = loadImage("butterfly.jpeg");
  size(886,886);
}

void draw() {
  if (clearBackground) {
  background(0);
  } 
  else {
    pixelate();
    
  }
}

void mousePressed()
{
saveFrame("image-####.jpg");
}

void keyPressed()
{
clearBackground = true;
  scale(random(.4,1));
  background(random(0,255),0,0);
  redraw();
  //This took a while but finally we can regenerate the image by keypress to a random scale
  pixelate();
}

void pixelate(){

  scale(1);
  loadPixels();  
  for (int y = 0; y<height; y+=1 ) {
    for (int x = 0; x<width; x+=1) {
      int loc = x + y*img.width;
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      float av = ((r+g+b)/3.0);

    pushMatrix();
    translate(x,y);
      stroke(r,g,b);
      if (r > 100 && r < 255) {
        rect(0,0,(av-255)/3,0); //this value alters the length. The closer to 0 the longer the lines. 
       
      }
    popMatrix(); 
      
    }
  }
println("Finished Lauren!");
noLoop();
}
