PImage img;

void setup(){
  size(500, 500);
  img = loadImage("images/windows_xp_bliss-wide.jpg");
  noLoop(); 
}

void draw(){ 
  image(img, 0, 0);
}
