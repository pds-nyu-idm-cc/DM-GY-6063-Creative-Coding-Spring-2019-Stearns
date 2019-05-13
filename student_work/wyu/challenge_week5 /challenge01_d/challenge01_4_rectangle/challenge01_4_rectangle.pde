//Do this for a rectangular button
float d1;
float c ;
float r = 50;
float rectX ;
float rectY;
float rectR;
color rectactive= (#FF4258);
color rectInactive= (#B3CBE9);
color rectPressed = (#FED7DA);
Boolean mouseIsclicked;
Boolean mouseOverRec;
Boolean recIsClicked;
void setup() {
  rectX =width/2-200;
  rectY =height/2-100;
  rectR = 100;
  mouseIsclicked = false;
  mouseOverRec = false;
  recIsClicked =false;
  size(800, 600);
  background(255);
}


void draw() {
  strokeWeight(2);
  stroke(100);
  //the setting of rectangle
  overRect();
  if (mouseOverRec) { //active color
    fill(rectactive);
    if (recIsClicked) {
      fill(rectPressed);// pressed color
    }
  } else {
    fill(rectInactive);// inactive color
  }

  rect(rectX, rectY, rectR, rectR);

  // distance between the ball and the mouse
  d1 =dist(width/2, height/2, mouseX, mouseY);

  //ellipes active color
  if (d1< r) {
    c = 200;
    // the pressed color 
    if (mouseIsclicked) {
      c= 30;
    }
    //inactive color
  } else {
    c = 150;
  }
  fill(c);
  ellipse(width/2, height/2, 2*r, 2*r);
}




// when mouse pressed in the range of the circle/rectangle
void mousePressed() {
  if (d1<r) {
    mouseIsclicked = true;
  }
  if (mouseOverRec) {
    recIsClicked = true;
  }
}
// the setting of mouse over the rectangle
void overRect() {
  if (mouseX >= rectX && mouseX<= rectX+rectR && mouseY <= rectY+rectR && mouseY>=rectY) {
    mouseOverRec = true;
  } else {
    mouseOverRec = false;
  }
}
