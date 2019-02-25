float angle; // value between 0-2*PI
float angleStep;
float pacManSize=50;
float pacManX;
float pacManY;

float speed=5;

float velocityX;
float velocityY;

boolean openMouth = true;
int direction; // 0 = right, 1 = down, 2 = left, 3 = right



void setup() {
  size(500, 500);
  
  angle=PI-PI/4;
  angleStep=.1;
  
  velocityX=0;
  velocityY=0;
  
  pacManX=width/2;
  pacManY=height/2;
  
  background(0);
}

void draw() {

  background(0);

  movePacMan();
  animatePacMan();
  drawPacMan();
}

void movePacMan(){
  switch(direction){
    case 0: // left
    pacManX-=speed;
    break;
    case 1: // up
    pacManY-=speed;
    break;
    case 2: // right
    pacManX+=speed;
    break;
    case 3: // down
    pacManY+=speed;
    break;
  }
}

void animatePacMan(){
  
  if (openMouth) {
    if (angle < PI) {
      angle+=angleStep;
    } else {
      openMouth=false;
    }
  } else {
    if (angle > PI-PI/4) {
      angle-=angleStep;
    } else {
      openMouth=true;
    }
  }
  
}

void drawPacMan() {
  noStroke();
  fill(#FFFF00);
  pushMatrix();
  translate(pacManX, pacManY);
  rotate(direction*PI/2);
  arc(0, 0, pacManSize, pacManSize, -angle, angle, PIE);
  popMatrix();
}


void keyPressed(){
  switch(keyCode){
    case LEFT:
    direction=0;
    break;
    case UP:
    direction=1;
    break;
    case RIGHT:
    direction=2;
    break;
    case DOWN:
    direction=3;
    break;
  }
}
