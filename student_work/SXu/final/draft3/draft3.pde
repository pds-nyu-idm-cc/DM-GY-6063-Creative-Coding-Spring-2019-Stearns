/**
 moving picture of painting Nihonbashi
 */

//soundfiles
import processing.sound.*;
SoundFile file1;
SoundFile file2;

// how many images 
int qtyImages = 19;

// an array to hold images
PImage[] images = new PImage[qtyImages];

// a value to scale everything by
float scalePercent=0.55;

// the position of images
int[] posX = new int[qtyImages];
int[] posY = new int[qtyImages];

// a place to hold coordinate presets for images
Table coordinates;

//boat movement
Floating b1, b2, b3, b4, b5, b6;
ArrayList <Floating> group;
//ArrayList <Floating> ship;


////////////////////////////////////////////////////////////////////////////////
// SETUP

void setup () {
  size(10, 10);
  //file1 = new SoundFile(this, "sound/The Sound of Wind Through the Bamboo Leaves.mp3");
  file2 = new SoundFile(this, "sound/watersound.mp3");
  //file1.play();
  group = new ArrayList <Floating>();

  // loads and scales all the images
  initializeImages();

  // loads coordinate presents
  initializeCoordinates();


  //  b1 = new Floating(); 
  //  b1.type="boat";
  //  b1.pos = new PVector(posX[1], posY[1]);  
  //  b1.img=images[1];
  b1 = new Floating( posX[1], posY[1], "BOAT", images[1]);
  b2 = new Floating( posX[3], posY[3], "BOAT", images[3]);
  b3 = new Floating( posX[4], posY[4], "BOAT", images[4]);

  b4 = new Floating( posX[5], posY[5], "BOAT2", images[5]);
  b5 = new Floating( posX[6], posY[6], "BOAT2", images[6]);
  b6 = new Floating( posX[2], posY[2], "DRIVE", images[2]);
  b6.x = posX[2];
  b6.y = posY[2];
  
  group.add (b1);
  group.add (b2);
  group.add (b3);
 // group.add (b6);
}



////////////////////////////////////////////////////////////////////////////////
// DRAW

void draw() { 
  imageMode(CORNER);
  drawBackground();

  imageMode(CENTER);
  //for (int i = 1; i<images.length; i++) {
  //  image(images[i], posX[i], posY[i]);
  //}


  //drawBackgroundobj();
  b1.move();
  b1.display();
  b2.move();
  b2.display();
  b3.move();
  b3.display();

  b4.updown();
  b5.updown();

  if(b6.driving == true){
    b6.move();
  }
  b6.display();



  whereAmI();

  //for (Floating obj : group ) {
  //  if (obj.isMouseInRange() == true) {
  //    circle(obj.pos.x, obj.pos.y, 20);
  //  }
  //}
}

void mousePressed() {
  ////another method
  //for (int i =0; i < len(group);++i){
  //  group[i].
  //}

  for (Floating obj : group ) {
    if (obj.isMouseInRange() == true) {
      obj.pos.y+=5;
      file2.play();
      
    }
  }
  
    if (b6.isMouseInRange() == true) {
      b6.driving = !b6.driving;
      file2.play();
      //b6.driving(500,500);
  
    }
  //}
}






////////////////////////////////////////////////////////////////////////////////
// drawBackground()

void drawBackground() {
  //background
  image(images[0], 0, 0);
  //frame
  image(images[18], 0, 0);
}



////////////////////////////////////////////////////////////////////////////////
// initializeImages()

void initializeImages() {
  // load up all our images
  for (int i = 0; i<images.length; i++) {

    String file = "images/Nihonbashi-" + nf(i, 3)+ ".png";
    images[i] = loadImage(file);
    // resize them
    images[i].resize(int(scalePercent*images[i].width), int(scalePercent*images[i].height));
  }
  //...and our window to match it
  surface.setSize(images[0].width, images[0].height);
  // draw the backgroundImage
  drawBackground();
}

////////////////////////////////////////////////////////////////////////////////
// initializeCoordinates()

void initializeCoordinates() {

  // load the coordinates csv
  coordinates = loadTable("coordinates.csv", "csv");

  // how many rows are there?
  println(coordinates.getRowCount() + " total rows in table"); 

  for (int i = 0; i < qtyImages; i++) {

    // get the row from the table
    TableRow coordinate = coordinates.getRow(i);

    // extract the coloumn elements from the row 
    posX[i] = coordinate.getInt(0);
    posY[i] = coordinate.getInt(1);

    // println("x: "+posX[i]+", y: "+posY[i]);
  }
}
