PImage img;
float offset = 0;
float easing = 0.05;

void setup(){
  size (100,100);
  surface.setResizable(true);
  img = loadImage("geo.jpg");
  surface.setSize(img.width, img.height);
  //noLoop(); 
}

void draw(){
  sortRows(img);
  image(img,0,0);
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(img, offset, 0);
}

void sortRows(PImage _image) {

  color[] row = new color[img.width];

  _image.loadPixels();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      row[x] = img.pixels[ y * width + x ];
    }

    row = sort(row);

    for (int x = 0; x < img.width; x++) {
      img.pixels[ y * width + x ]= row[x];
    }
  }
  _image.updatePixels();
}

void keyPressed(){
  saveFrame("pic1.tif");
}
