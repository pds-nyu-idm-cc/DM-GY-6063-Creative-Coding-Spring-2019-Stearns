//declear variables

int score = 0, life=10;
float x, y;
float x1, x2, y1, y2, shapeSize, stepY;
float a, b, r, moveA = 0, moveB = 0, g = 0;
float j=255;
float o = 0;



void setup() {
  //set screen size
  size(700, 700);
  //set background color
  background(0);


  //ball initial attribution
  a = width/2; 
  b = height/2;
  r = width/18;
}



void draw() {

  gamePlay();

  /*display result*/
  
  result();

  println("a: "+moveA+", b: "+moveB);
  //println(moveB);
}

//user input and feedback


void mouseReleased() {
  a=mouseX;
  b=mouseY;
  moveA = (random(-5, 5)); 
  moveB = 4;
  g = 1;
  o = 1;
}

//void mouseDragged() {
//  j = 255;
//  //juggle block detection

//}

//void mouseDragged() {
//  a=mouseX;
//  b=mouseY;
//  moveA=moveB=g=0;
//  }
