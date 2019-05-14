/**
 Interactive moving picture of painting Nihonbashi
 */

//soundfiles
import processing.sound.*;
SoundFile file1;
SoundFile file2;
SoundFile file3;

// how many images 
int qtyImages = 23;

// an array to hold images
PImage[] images = new PImage[qtyImages];

// a value to scale everything by
float scalePercent=0.55;

// the position of images
int[] posX = new int[qtyImages];
int[] posY = new int[qtyImages];

// a place to hold coordinate presets for images
Table coordinates;

//images
Floating b1, b2, b3, b4, b5, b6, b7, p1, p2, p3, p4, m1, m2, m3, m4, l1, l2;
ArrayList <Floating> group;




////////////////////////////////////////////////////////////////////////////////
// SETUP

void setup () {
  size(10, 10);
  file1 = new SoundFile(this, "sound/The Sound of Wind Through the Bamboo Leaves.mp3");
  file2 = new SoundFile(this, "sound/watersound.mp3");
  file3 = new SoundFile(this, "sound/marketsound.mp3");
  file1.play();
  group = new ArrayList <Floating>();

  // loads and scales all the images
  initializeImages();

  // loads coordinate presents
  initializeCoordinates();


  //load images
  b1 = new Floating( posX[1], posY[1], "BOAT", images[1]);
  b2 = new Floating( posX[3], posY[3], "BOAT", images[3]);
  b3 = new Floating( posX[4], posY[4], "BOAT", images[4]);

  b4 = new Floating( posX[5], posY[5], "BOAT2", images[5]);
  b5 = new Floating( posX[6], posY[6], "BOAT2", images[6]);
  b7 = new Floating( posX[14], posY[14], "BOAT2", images[14]);
  b6 = new Floating( posX[2], posY[2], "DRIVE", images[2]);
  b6.x = posX[2];
  b6.y = posY[2];

  p1 = new Floating( posX[8], posY[8], "BOAT2", images[8]);
  p2 = new Floating( posX[9], posY[9], "DONOTHING", images[9]);
  p3 = new Floating( posX[10], posY[10], "PEOPLE", images[10]);
  p4 = new Floating( posX[11], posY[11], "PEOPLE", images[11]);

  m1 = new Floating( posX[12], posY[12], "BOAT2", images[12]);
  m2 = new Floating( posX[17], posY[17], "BACK", images[17]);
  m3 = new Floating( posX[16], posY[16], "BACK", images[16]);
  m4 = new Floating( posX[20], posY[20], "BACK", images[20]);

  l1 = new Floating( posX[15], posY[15], "DONOTHING", images[15]);
  l2 = new Floating( posX[13], posY[13], "DONOTHING", images[13]);

  group.add (b1);
  group.add (b2);
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
  //b3.move();
  b3.display();

  //rotate boat3 when mousepressed
  if (b3.isBoatRotating == true) {
    b3.rotateboat();
  }
  b3.move();
  b4.move();
  b5.move();
  b7.move();

  //sail boat6 when mousepressed
  if (b6.isdriving == true) {
    b6.move();
  }
  b6.updown();

//people movement
  p1.move();
  p2.display();
  p3.move();
  p4.move();

//background landscape moving
  m1.move();
  m2.move();
  m3.move();
  m4.move();


 //mouseover the person on the boat will make it rotate
  if (p2.isMouseInRange() == true) peoplerotate();


 
  //top-label
  image(images[15], 53, 681);
  //top-frame
  imageMode(CORNER);
  image(images[18], 0, 0);


  //mouseover upperright corner laber will show the information about the painting 
  l2.display();
  if (l2.isMouseInRange() == true) paintinginfo();


  //mouseover lowerleft corner laber will show the original painting 
  if (l1.isMouseInRange() == true) originalimage();

 //whereAmI();
}




////////////////////////////////////////////////////////////////////////////////
// mouse
void mousePressed() {

  //move down and water soundeffect play when mousepressed
  for (Floating obj : group ) {
    if (obj.isMouseInRange() == true) {
      obj.pos.y+=5;
      file2.play();
    }
  }

//boat rotating/stop when mousepressed
  if (b3.isMouseInRange() == true) {
    b3.isBoatRotating = !b3.isBoatRotating;
    file2.play();
  }

//boat sailing/stop when mousepressed
  if (b6.isMouseInRange() == true) {
    b6.isdriving = !b6.isdriving;
    file2.play();
  }

//market soundeffect if you click the two people on lowerright corner
  if (p3.isMouseInRange() == true)  file3.play();
  if (p4.isMouseInRange() == true)  file3.play();
}




////////////////////////////////////////////////////////////////////////////////
// some functions

//display originalimage
void originalimage() {
  pushMatrix();
  imageMode(CENTER);
  translate( posX[21], posY[21]);
  background(30);
  scale(0.8);
  image(images[21], 0, 0);
  popMatrix();
}

//display introduction info
void paintinginfo() {
  pushMatrix();
  imageMode(CENTER);
  translate( posX[22], posY[22]);
  image(images[22], 0, 0);
  popMatrix();
}


void peoplerotate() {
    pushMatrix();
    imageMode(CENTER);
    translate( posX[9], posY[9]);
    rotate (sin(frameCount/10.));
    image(images[9], 0, 0);

    popMatrix();
}




////////////////////////////////////////////////////////////////////////////////
// drawBackground()

void drawBackground() {
  image(images[0], 0, 0);
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
