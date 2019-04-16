PImage night;
int blurPoint = 20; //size of pixel 

void setup(){

    // loads image into processing 
    size(605,416);
    night = loadImage("night.jpg");
    background(0);
    smooth();
    
}

void draw(){
  
 
  int x = int(random(night.width));
  int y = int(random(night.height));
  int loc = x/2 + y/2*night.width;
   // drawing the pixel location half x & half y times by the pictures width
  
  loadPixels();
    float r = red(night.pixels[loc]);
    float g = green(night.pixels[loc]);
    float b = blue(night.pixels[loc]);
    noStroke();

  fill( r,g,b, 100); // fill & alpha
  rect(x,y,blurPoint,blurPoint); //draw rectangle 
  

}
