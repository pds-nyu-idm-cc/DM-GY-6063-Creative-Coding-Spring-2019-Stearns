color color1, color2, color3;
int circleX=100, circleY=100;
int circleSize = 88;


void setup() {
  size(500, 500);
  color1 = color(167, 142, 27);
  color2 = color(51, 76, 125);
  color3 = color(144, 62, 62);
}

void draw() {
  background(221);
  /*Make a circle detects when you move 
   your mouse over it by changing 
   to a "highlight" color.*/
  //fill(171, 91, 100);
  //changeColorOnHover();
  //circle(circleX, circleY, circleSize);
  circleCircumference(100, 100, 88);
  
  println(mouseX, mouseY);
}

void changeColorOnHover() {

  if (mouseX<55 || mouseX>143) {
    if (mouseY<95 ||mouseY>148) {
      fill(color2);
      println("color2");
    }
  } else {
    println("color1");
    fill(color1);
  }
}

void circleCircumference(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    fill(color2);
  } else{
    fill(color1);
  }
  circle(x, y, diameter);
}
