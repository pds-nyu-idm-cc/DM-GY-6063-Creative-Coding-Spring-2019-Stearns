float angle = 0;
float angleStep = 0.01;
float amplitude = 150;

float nx = random(1);
float ny = random(1);
float nStep = 0.1;
float nAmt = 50;

void setup() {

  size(500, 500);
}

void draw() {


  if (angle < 2*PI) {
    noStroke();

    float x = amplitude*cos(angle);
    float y = amplitude*sin(angle);

    angle+=angleStep;

    x += nAmt * noise( nx );
    y += nAmt * noise( ny );

    nx += nStep;
    ny += nStep;

    ellipse(width/2 + x, height/2 + y, 5, 5);
  }
}
