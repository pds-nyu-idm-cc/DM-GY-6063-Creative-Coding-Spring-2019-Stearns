void setup(){
  size(600,300);
  colorPixels();
}

void draw(){
}

void colorPixels(){
  loadPixels();
  for(int i = 0 ; i < pixels.length ; i++){
    pixels[i]=color(random(256),random(256),random(256));
  }
  updatePixels();
}

void keyPressed(){
  colorPixels();
}

void mousePressed(){
  color pixel = pixels[ mouseX + mouseY * width];
  float red = red(pixel);
  float green = green(pixel);
  float blue = blue(pixel);
  println("Red: "+red+", Green: "+green+", Blue: "+blue);
}
