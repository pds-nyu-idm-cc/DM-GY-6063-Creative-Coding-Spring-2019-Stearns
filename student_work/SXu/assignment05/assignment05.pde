PImage imgMask;
PImage img;
PImage img2;


void setup() {

  size(600, 400);
  frameRate(30);
  //frame.setResizable(true);
  surface.setResizable(true);

  // loadImage
  img = loadImage("t018898cc615569eb45.jpg");
  img2 = loadImage("t018898cc615569eb45.jpg");
  surface.setSize(img.width, img.height);
  //imgMask = loadImage("2.jpg");
  //img.mask(imgMask);
  //imageMode(CENTER);
  //noLoop();
  
//colorMode(HSB);
//  loadPixels();
//  for(int i = 0; i<pixels.length; i++) {
//    float b = brightness(pixels[i]);
//       if(b > 100) {
//      pixels[i] = color(255);
//    } else {
//      pixels[i] = color(0);
//    }
//  }  updatePixels();



  
}

void draw() {
  //sortPixels(img);
  sortRows(img, img2);
  image(img2, 0, 0);
  //image(img, width/2, height/2);
  //image(img, mouseX, mouseY);
  //filter(ERODE);
  filter(DILATE);
  tint(255,86);
//    color c = color(150, 100, 255);
//  fill(c);
//  float value = saturation(c);  // Sets 'value' to 126
//fill(value);
}


//void sortPixels(PImage _image) {
//  _image.loadPixels();
//  _image.pixels=sort(_image.pixels);
//  _image.updatePixels();
//}


void sortRows(PImage _image, PImage _image2) {

  color[] row = new color[_image.width];

  _image.loadPixels();

  for (int y = 0; y < _image.height; y++) {
    for (int x = 0; x < _image.width; x++) {
      row[x] = _image.pixels[ y * width + x ];
    }
    //use mouse to control where the pixel is sorting, from 0 to mouseX position  
    int sortcount = int(mouseX + sin(frameCount/13.+y/( log(mouseX)*10.+1.))*100 + 100);

    //avoid reach the edge
    if (sortcount >= _image.width) {
      sortcount = _image.width-1;
    }
    row = sort(row, sortcount );

    //pixel update in another image, so the original image is shown
    for (int x = 0; x < _image.width; x++) {
      _image2.pixels[ y * width + x ]= row[x];
    }
  }
  _image2.updatePixels();
}


//save image
void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("#####.png");
}
