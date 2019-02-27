//Lauren Owen
//Inspired by Alma Thomas' The Eclipse (1920, oil on canvas)
//An eclipse is when the moon moves in front of the sun
//And here you have a purple moon perfectly blocking the sun
//Yet the sun's rays of light still shine through
int x;
int y;
float radius;
//The point value always being between 0 and 1 made the
//changes in rectangle width not come out with enough fluctuations
//float t = 0.12;
//Not sure where I went wrong exactly
//but I could not call the array with the functions and class I created
//Ray [] rays = new Ray[2];

void setup() {
  size(521, 1000, P3D);
  //initialize ray array that returned error
  //for (int i = 0; i < rays; i ++ ) {
  //rays[i] = new Ray();}
  //Rays[0]=("505, 92, -1000, #357BB9");
  //rays[1]=("-20, 35, 150, #769ea2");
}

void draw() {
  background(255);
  //drawRays(); failed array call
  drawMoon();
  //drawRay(radius, color, position)//function
  drawRay(505, 92, -1000, #357BB9);
  drawRay(-20, 35, 150, #769ea2);
  drawRay(-20, 32, 140, #357BB9);
  drawRay(-20, 30, 140, #769ea2);
  drawRay(-20, 30, 130, #357BB9);
  drawRay(-15, 30, 110, #65b5dd);
  drawRay(-15, 25, 100, #5e466f);
  drawRay(-10, 20, 90, #60384e);
  drawRay(-10, 15, 70, #fa7445);
  drawRay(-10, 15, 60, #fa7445);
  drawRay(-7, 13, 55, #fa7445);
  drawRay(-7, 13, 50, #fc6546);
  drawRay(-5, 10, 45, #fd7c28);
  drawRay(-5, 10, 45, #fc8b25);
  drawRay(-5, 10, 45, #fda062);
  drawRay(-5, 10, 45, #fdcc47);
  drawRay(-5, 10, 45, #f7cc3b);
  drawRay(-1, 10, 45, #feca4b);
  drawRay(0, 10, 45, #feca4b);
  drawRay(0, 3, 40, #facb4c);
  drawRay(0, 3, 40, #fee93e);
  drawRay(0, 0, 40, #fee93e);
  drawRay(0, -5, 40, #fee93e);
  drawRay(0, -7, 40, #f8e544);
  drawRay(0, -5, 30, #f8e544);
  drawRay(0, -7, 40, #f8e544);
  drawSunnyDay(-40, 57, 370);
}
//
//Moon
void drawMoon()
{
  fill(69, 60, 96);
  ellipse(380, 300, 170, 170);
}

//Mouse function

//Sun rays
void drawRay(float right, float down, float forward, int shade) {
  translate(right, down, forward);
  for (float ang=0; ang<=PI; ang+=PI/35) {
    pushMatrix();
    stroke(0);
    fill(shade);
    rotateZ(ang*2);
    translate(180, 20, 100);
    //not the noise output I wanted
    //float noisevalue = noise(t)*200*right;
    //rect(0, 0, 10, noisevalue);
    rect(0, 0, 10, 20);
    popMatrix();
  }
}

//to change rectangle size in rays
//not used currently
void drawRay2(float right, float down, float forward, int shade, int width, int height) {
  translate(right, down, forward);
  for (float ang=0; ang<=PI; ang+=PI/20) {
    pushMatrix();
    stroke(0);
    fill(shade);
    rotateZ(ang*2);
    translate(180, 0, 100);
    rect(0, 0, width, height);
    popMatrix();
  }
}

//Recurrsion with keypress to create a sunny, no-eclipse day
//I feel like a seizure warning is necessary
void drawSunnyDay(int x, int y, float radius) {
  if (keyPressed) {
    if (key == ENTER) {
      ellipse(x, y, radius, radius);
      fill(random(200, 255), random(100, 255), random(255));
      stroke(255);
      if (radius > 40) {
        radius *= 0.9;
        drawSunnyDay(x, y, radius);
      }
    }
  }
}
