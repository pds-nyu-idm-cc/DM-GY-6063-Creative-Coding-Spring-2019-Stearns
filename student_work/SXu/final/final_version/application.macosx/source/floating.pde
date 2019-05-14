class Floating {
  PVector pos, vel;
  PImage img;
  float st= random(0, 50);//add random starttime to boat

  boolean isBoatRotating = false;
  boolean isdriving = false;

  float sailTime = 600.0; // how many frames should it take to get from start to finish
  float x, y, x2, y2, translateX = 0.0, translateY = 0.0; // x,y are where it actually is, x2, y2 and the end point, translateX and translateY add complex motion
  float xStep = 0.0; 
  float yStep = 0.0; // holds the speed of boat movement based on sailTime
  float rotateAngle = 0;
  float nx = random(1);
  float ny = random(1);
  float nStep = 0.025;
  //noise
  float nAmt = 1.7;
  //up-down
  float angle = 0;
  float angleStep = 0.02;
  float amp = 5.5;
  //left-right
  float rockAmt =0.045;
  //rotate
  float rstep = 0.08;

  String TYPE = "BOAT";


  //constructor
  Floating( float _x, float _y, String _type, PImage _img) {

    pos = new PVector(_x, _y);
    TYPE = _type;
    img = _img;
  }




  ////////////////////////////////////////////////////////////////////////////////
  //two main functions, one for display image, one for movement type

  void display() {
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

  void move() {

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
  void backforward() {
    
    pushMatrix();
    translate(sin(st + frameCount/80.)*5, 0);
    image(img, pos.x, pos.y);
    popMatrix();
  }


  //for market people
  void walking() {
    
    pushMatrix();
    translate(sin(st + frameCount/60.)*10, 0);
    image(img, pos.x, pos.y);
    popMatrix();
  }


  //for sailing boat 
  void driving(float x2, float y2) {
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
    translate(0, sin(st + frameCount/33.)*3);
    popMatrix();
  }

  ////not use
  //void disappear() {
  //  pos.x +=0.3;
  //  pos.y +=sin(frameCount/18.) -0.3;
  //}


  // adds up and down movement to the boat
  void bob() {
    
    translateY += amp * sin(st + angle);
    angle+=angleStep;
  }


  // adds a random movement to boat
  void shake() {
    
    translateX += nAmt * noise ( nx );
    translateY += nAmt * noise ( ny );
    nx += nStep;
    ny += nStep;
  }


  //adds angle to the boat
  void leftright() {

    rotateAngle = rockAmt * cos(st + angle);
  }


//boat floating
  void updown() {
    
    pushMatrix();
    translate(0, sin(st + frameCount/33.)*3);
    image(img, pos.x, pos.y);
    popMatrix();
  }


//boat rotate
  void rotateboat() {
    rotateAngle+=rstep;
  }



  ////////////////////////////////////////////////////////////////////////////////
  //detect the images
  boolean isMouseInRange () {

    if ((mouseX > (pos.x - img.width/2)) && (mouseX<(pos.x+img.width/2)) 
      && (mouseY>(pos.y-img.height/2)) && (mouseY<(pos.y+img.height/2))) {
      return true ;
    }
    return false;
  }
}
