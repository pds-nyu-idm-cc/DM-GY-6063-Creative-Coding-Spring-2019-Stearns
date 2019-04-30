//move the mouse to see the image

PImage img;
//PImage newImg;

void setup() {
  size(200, 200);
  surface.setResizable(true); //scale
  img = loadImage("redboat.JPG");
  surface.setSize(img.width, img.height);
  //newImg = createImage(200,200,RGB);
  //newImg.save("outputImage.jpg");
  //noLoop();
}

void draw() {
  sortPixels();
  //image(img, 0, 0);

  filter(POSTERIZE, 2);
  filter(DILATE);
  //filter(ERODE);
}

void sortPixels() {
  loadPixels();
  img.loadPixels();

  for (int x = 0; x < width; x++) {
    for (int y=0; y<height; y++) {
      int loc = x+y*img.width;
      float r = red(img.pixels[loc]*2);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]/3);
      float d = dist (mouseX, mouseY, x, y);
      float factor = map (d, 0, 400, 2, 0);
      pixels[loc] = color (r*factor, g*factor, b*factor);
    }
    updatePixels();
  }
}

void mousePressed() {
  saveFrame("output-##.jpg");
}

//shimmering effect with circles
// void draw(){
//  for (int i = 0; i<100; i++){
//    float x = random(width);
//    float y = random(height);
//    color c = img.get(int(x),int(y));
//    fill(c,20);
//    noStroke();
//    ellipse(x,y,16,16);
//  }
//}
