//Button Drawing Machine
//By Yundi Jude Zhu

boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
boolean button4 = false;
boolean button5 = false;

int x1 = 52; int y1 = 430; int w1 = 70; int h1 = 40;//button1 to turn on party light
int x2 = 132; int y2 = 430; int w2 = 70; int h2 = 40;//button2 to jiggle Zoog
int x3 = 212; int y3 = 430; int w3 = 70; int h3 = 40;//button3 to make smiling faces
int x4 = 292; int y4 = 430; int w4 = 70; int h4 = 40;//button4 to go back home
int x5 = 372; int y5 = 430; int w5 = 70; int h5 = 40;//button5 to reset

Zoog zoog;

void setup() {
  size(500, 500);
  strokeWeight(5);
  zoog = new Zoog(250, 340, 120, 120, 40); 
  reset();
}

void reset() {
  zoog = new Zoog(250, 340, 120, 120, 40);
}

void draw() {
  //loat background image
  PImage stage;
  stage = loadImage("stage.jpg");
  image(stage,0,0);
  
  clickButton1();
  clickButton2();
  clickButton3();
  clickButton4();
  clickButton5();
  drawButton1();
  drawButton2();
  drawButton3();
  drawButton4();
  drawButton5();
  zoog.display();
}

void clickButton1() {
  //click on button1 to turn on party light
  if (button1) {
    background(random(200, 255), random(100, 255), random(100, 255)); // background color
    PImage stage; // show background image above the light
    stage = loadImage("stage.jpg");
    image(stage,0,0);
    tint(255, 126); // transparent background image
    stroke(0);
  } else {
    //background(255); // original background color
    stroke(255);
  }
}

void clickButton2() {
  //click on button2 to jiggle zoog
  if (button2) {
    float factor = constrain(mouseX/10, 0, 5);
    zoog.jiggle(factor);
    stroke(0);
  } else {
  }
}

void clickButton3() {
  //click on button3 to make smile faces
  if (button3) {
    PImage face; // show face
    face = loadImage("face.png");
    image(face,random(0,500),random(0,500));
    stroke(0);
    noTint(); // so that faces are always in solid color
  } else {
  }
}

void clickButton4() {
  // click on button4 to go back home
  if (button4) {
    PImage home; // show face
    home = loadImage("home.jpg");
    image(home,0,0);
    stroke(0);
    noTint(); // so that faces are always in solid color
  } else {
  }
}

void clickButton5() {
  // click on button5 to reset
  if (button5) {
    stroke(0);
    reset();
  } else {
  }
}
    
void drawButton1() {
  fill(random(200, 255), random(0, 50), random(0, 50)); // button 1 color
  rect(x1, y1, w1, h1, 10, 10, 10, 10); // button 1 location

  //detect whether mouse is on button 1
  if (mouseX > x1 && mouseX < x1+w1 && mouseY > y1 && mouseY < y1+h1 && mousePressed) {
    button1 = true;
  } else {
    button1 = false;
  }
}

void drawButton2() {
  fill(random(200,255), random(170,200), random(0,50)); // button 2 color
  rect(x2, y2, w2, h2, 10, 10, 10, 10); // button 2 location
  //detect whether mouse is on button 2
  if (mouseX > x2 && mouseX < x2+w2 && mouseY > y2 && mouseY < y2+h2 && mousePressed) {
    button2 = true;
  } else {
    button2 = false;
  }
}

void drawButton3() {
  fill(random(100,120), random(140,180), random(0,20)); // button 3 color
  rect(x3, y3, w3, h3, 10, 10, 10, 10); // button 3 location
  //detect whether mouse is on button 3
  if (mouseX > x3 && mouseX < x3+w3 && mouseY > y3 && mouseY < y3+h3 && mousePressed) {
    button3 = true;
  } else {
    button3 = false;
  }
}

void drawButton4() {
  fill(random(0,10), random(140,150), random(140,170)); // button 4 color
  rect(x4, y4, w4, h4, 10, 10, 10, 10); // button 4 location
  //detect whether mouse is on button 4
  if (mouseX > x4 && mouseX < x4+w4 && mouseY > y4 && mouseY < y4+h4 && mousePressed) {
    button4 = true;
  } else {
    button4 = false;
  }
}

void drawButton5() {
  fill(random(0,100), random (20,60), random(50,90)); // button 5 color
  rect(x5, y5, w5, h5, 10, 10, 10, 10); // button 5 location
  //detect whether mouse is on button 5
  if (mouseX > x5 && mouseX < x5+w5 && mouseY > y5 && mouseY < y5+h5 && mousePressed) {
    button5 = true;
  } else {
    button5 = false;
  }
}
