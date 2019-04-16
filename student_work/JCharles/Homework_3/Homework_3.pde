PImage photo;

void setup(){
  size (600,600);
  photo = loadImage("Brown_Pastel.png");
}

void draw(){
  background(0);
  image(photo,0,0, mouseX, mouseY);
}
