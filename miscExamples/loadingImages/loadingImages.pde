/**
 moving picture of painting Nihonbashi
 */

// how many images 
int qtyImages = 13;

// an array to hold images
PImage[] images = new PImage[qtyImages];

// a value to scale everything by
float scalePercent=0.70;

// the position of images
int[] posX = new int[qtyImages];
int[] posY = new int[qtyImages];

// a place to hold coordinate presets for images
Table coordinates;


////////////////////////////////////////////////////////////////////////////////
// SETUP

void setup () {
  // set the window size to something arbitrary we'll change this later
  size(10, 10);
  
  // loads and scales all the images
  initializeImages();
  
  // loads coordinate presents
  initializeCoordinates();
  
}

////////////////////////////////////////////////////////////////////////////////
// DRAW

void draw() { 
  imageMode(CORNER);
  drawBackground();

  imageMode(CENTER);
  for (int i = 1; i<images.length; i++) {
    image(images[i], posX[i], posY[i]);
  }
  
  whereAmI();
}

////////////////////////////////////////////////////////////////////////////////
// drawBackground()

void drawBackground() {
  image(images[0], 0, 0);
}

////////////////////////////////////////////////////////////////////////////////
// initializeImages()

void initializeImages(){
  // load up all our images
  for (int i = 0; i<images.length; i++) {
   
    String file = "images/Nihonbashi-" + nf(i, 3)+ ".png";
    images[i] = loadImage(file);
    // resize them
    images[i].resize(int(scalePercent*images[i].width), int(scalePercent*images[i].height));
  }
  //...and our window to match it
  surface.setSize(images[0].width,images[0].height);
  // draw the backgroundImage
  drawBackground();
}

////////////////////////////////////////////////////////////////////////////////
// initializeCoordinates()

void initializeCoordinates(){
  
  // load the coordinates csv
  coordinates = loadTable("coordinates.lst" ,"csv");

  // how many rows are there?
  println(coordinates.getRowCount() + " total rows in table"); 

  for (int i = 0 ; i < qtyImages; i++) {
    
    // get the row from the table
    TableRow coordinate = coordinates.getRow(i);
    
    // extract the coloumn elements from the row 
    posX[i] = coordinate.getInt(0);
    posY[i] = coordinate.getInt(1);
    
    println("x: "+posX[i]+", y: "+posY[i]);
  }
  
}
