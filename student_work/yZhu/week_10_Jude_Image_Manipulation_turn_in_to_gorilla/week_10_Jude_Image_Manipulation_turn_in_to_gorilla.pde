// Assignment 5: Pixel and Image
// Yundi Jude Zhu

// Ever wondered what if you turn into a monster???
// Move mouse to turn into a gorilla, and press "s" to save a screenshot.

// According to the requirenment, I used pixel sorting, filter(), brightness() and saturation().
// I took Learning Processing's example 15-15: 2D image mapped to 3D for reference.

PImage img;
int cellsize = 1; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows 

void setup() {
  size(500, 500, P3D);
  img = loadImage("Jude.jpg"); // Load the image
  filter(INVERT); // invert the original image
  cols = width/cellsize;              // Calculate # of columns
  rows = height/cellsize;             // Calculate # of rows
}

void draw() {
  background(255);
  img.loadPixels();

  // Begin loop for columns
  for (int i = 0; i < cols; i++ ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Map brightness to a z position as a function of mouseX
      float z = map(saturation(img.pixels[loc]), 0, 255, 0, mouseX); // Turn into gorilla
      //float z = map(brightness(img.pixels[loc]), 0, 255, 0, mouseX); // Dissolve
      
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x, y, z); 
      fill(random(0,c));
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') 
    saveFrame("#####.png");
}
