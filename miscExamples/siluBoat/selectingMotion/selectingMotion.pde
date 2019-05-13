float x, y, size;
float resize = 1;
float minScale = 0.5;
float maxScale = 1.0;
float angle = 0;
float angleStep = 0.02;
float noiseX = random(1);
float noiseY = random(1);
float nStep = 0.01;
float nMult = 100;
float yOffset;
float xOffset;

boolean mvSq = false;
boolean rtSq = false;
boolean scSq = false;

float r = 0;
float rStep = 1;

void setup() {
  size( 500, 500 );
  background(255);
  x = width/2;
  y = height/2;
  size = 100;
}

void draw() {
  background(255);
  rectMode(CENTER); // draw rectangles from the center

  pushMatrix();

  if (mvSq) moveSquare();
  if (rtSq) rotateSquare();
  if (scSq) scaleSquare();

  square(0, 0, size); // special type of rectangle

  popMatrix();
}

void moveSquare() {
  xOffset = map( noise(noiseX), 0, 1, -nMult, nMult );
  noiseX+=nStep;
  yOffset = map( noise(noiseY), 0, 1, -nMult, nMult );
  noiseY+=nStep;
  translate(x + xOffset, y + yOffset);
}

void rotateSquare() {
  rotate(r);
  r+=rStep;
}

void scaleSquare() {
  resize = map ( sin(angle), -1, 1, minScale, maxScale);
  angle+=angleStep;
  scale(resize);
}

void keyPressed() {
  switch(key) {
  case '1':
    mvSq = !mvSq;
    break;
  case '2':
    rtSq = !rtSq;
    break;
  case '3':
    scSq = !scSq;
    break;
  default:
    //println("What?! Really?");
    break;
  }
}
