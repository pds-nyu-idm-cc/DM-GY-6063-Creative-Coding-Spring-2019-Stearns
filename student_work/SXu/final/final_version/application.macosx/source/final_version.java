import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class final_version extends PApplet {

/**
 Interactive moving picture of painting Nihonbashi
 */

//soundfiles

SoundFile file1;
SoundFile file2;
SoundFile file3;

// how many images 
int qtyImages = 23;

// an array to hold images
PImage[] images = new PImage[qtyImages];

// a value to scale everything by
float scalePercent=0.55f;

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

public void setup () {
  
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

public void draw() { 
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
public void mousePressed() {

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
public void originalimage() {
  pushMatrix();
  imageMode(CENTER);
  translate( posX[21], posY[21]);
  background(30);
  scale(0.8f);
  image(images[21], 0, 0);
  popMatrix();
}

//display introduction info
public void paintinginfo() {
  pushMatrix();
  imageMode(CENTER);
  translate( posX[22], posY[22]);
  image(images[22], 0, 0);
  popMatrix();
}


public void peoplerotate() {
    pushMatrix();
    imageMode(CENTER);
    translate( posX[9], posY[9]);
    rotate (sin(frameCount/10.f));
    image(images[9], 0, 0);

    popMatrix();
}




////////////////////////////////////////////////////////////////////////////////
// drawBackground()

public void drawBackground() {
  image(images[0], 0, 0);
}


////////////////////////////////////////////////////////////////////////////////
// initializeImages()

public void initializeImages() {
  // load up all our images
  for (int i = 0; i<images.length; i++) {

    String file = "images/Nihonbashi-" + nf(i, 3)+ ".png";
    images[i] = loadImage(file);
    // resize them
    images[i].resize(PApplet.parseInt(scalePercent*images[i].width), PApplet.parseInt(scalePercent*images[i].height));
  }
  //...and our window to match it
  surface.setSize(images[0].width, images[0].height);
  // draw the backgroundImage
  drawBackground();
}

////////////////////////////////////////////////////////////////////////////////
// initializeCoordinates()

public void initializeCoordinates() {

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
public void whereAmI(){
  stroke(127);
  line(mouseX,0,mouseX,height);
  line(0, mouseY, width, mouseY);
  fill(255);
  String text = "("+mouseX+","+mouseY+")";
  text(text, mouseX, mouseY);
}
class Floating {
  PVector pos, vel;
  PImage img;
  float st= random(0, 50);//add random starttime to boat

  boolean isBoatRotating = false;
  boolean isdriving = false;

  float sailTime = 600.0f; // how many frames should it take to get from start to finish
  float x, y, x2, y2, translateX = 0.0f, translateY = 0.0f; // x,y are where it actually is, x2, y2 and the end point, translateX and translateY add complex motion
  float xStep = 0.0f; 
  float yStep = 0.0f; // holds the speed of boat movement based on sailTime
  float rotateAngle = 0;
  float nx = random(1);
  float ny = random(1);
  float nStep = 0.025f;
  //noise
  float nAmt = 1.7f;
  //up-down
  float angle = 0;
  float angleStep = 0.02f;
  float amp = 5.5f;
  //left-right
  float rockAmt =0.045f;
  //rotate
  float rstep = 0.08f;

  String TYPE = "BOAT";


  //constructor
  Floating( float _x, float _y, String _type, PImage _img) {

    pos = new PVector(_x, _y);
    TYPE = _type;
    img = _img;
  }




  ////////////////////////////////////////////////////////////////////////////////
  //two main functions, one for display image, one for movement type

  public void display() {
    // use the image of the boat
    imageMode(CENTER);
    pushMatrix();
    //translateX += xStep;
    //translateY += yStep;
    translate(pos.x+translateX, pos.y+ translateY);
    rotate(rotateAngle);  
    image(img, 0, 0 );
    // reset the translation
    translateX = 0;
    translateY = 0;
    popMatrix();
  }

  public void move() {

    switch(TYPE) {
    case "BOAT":
      if (isBoatRotating==false) {
        this.leftright();
      }

      this.bob();
      this.shake();
      break;

    case"BOAT2":
      this.updown();
      break;

    case"DRIVE":
      this.driving(430, 560);
      this.updown();
      break;

    case"BACK":
      this.backforward();
      break; 

    case "PEOPLE":
      this.walking();
      break;

    case "DONOTHING":
      break;   
      //println("TYPE: "+TYPE+" not recognized");
    }
  }

  ////////////////////////////////////////////////////////////////////////////////
  //break down movement

  //for landscape 
  public void backforward() {
    
    pushMatrix();
    translate(sin(st + frameCount/80.f)*5, 0);
    image(img, pos.x, pos.y);
    popMatrix();
  }


  //for market people
  public void walking() {
    
    pushMatrix();
    translate(sin(st + frameCount/60.f)*10, 0);
    image(img, pos.x, pos.y);
    popMatrix();
  }


  //for sailing boat 
  public void driving(float x2, float y2) {
    //println("x2: ", x2, "; y2: ", y2, "; pos.x: ", pos.x, "; pos.y: ", pos.y, "; x: ", x, "; pos.y: ", y);
    if (abs(x2 - pos.x) <= 1 && abs(y2 - pos.y) <= 1) {
      //xStep = (pos.x - x)/sailTime;
      //yStep = (pos.y - y)/sailTime;
    } else {
      xStep = (x2 - x)/sailTime;
      yStep = (y2 - y)/sailTime;
      pos.x += xStep;
      pos.y += yStep;
    }
    pushMatrix();
    translate(0, sin(st + frameCount/33.f)*3);
    popMatrix();
  }

  ////not use
  //void disappear() {
  //  pos.x +=0.3;
  //  pos.y +=sin(frameCount/18.) -0.3;
  //}


  // adds up and down movement to the boat
  public void bob() {
    
    translateY += amp * sin(st + angle);
    angle+=angleStep;
  }


  // adds a random movement to boat
  public void shake() {
    
    translateX += nAmt * noise ( nx );
    translateY += nAmt * noise ( ny );
    nx += nStep;
    ny += nStep;
  }


  //adds angle to the boat
  public void leftright() {

    rotateAngle = rockAmt * cos(st + angle);
  }


//boat floating
  public void updown() {
    
    pushMatrix();
    translate(0, sin(st + frameCount/33.f)*3);
    image(img, pos.x, pos.y);
    popMatrix();
  }


//boat rotate
  public void rotateboat() {
    rotateAngle+=rstep;
  }



  ////////////////////////////////////////////////////////////////////////////////
  //detect the images
  public boolean isMouseInRange () {

    if ((mouseX > (pos.x - img.width/2)) && (mouseX<(pos.x+img.width/2)) 
      && (mouseY>(pos.y-img.height/2)) && (mouseY<(pos.y+img.height/2))) {
      return true ;
    }
    return false;
  }
}
  public void settings() {  size(10, 10); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "final_version" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
