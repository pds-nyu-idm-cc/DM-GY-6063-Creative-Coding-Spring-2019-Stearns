Rect rectTop = new Rect ();
Rect rectBottom = new Rect ();

color colorTop = color (200, 64, 42); //red ish
color colorBottom = color (88, 108, 132); //blue-gray ish
color bg = color (224, 120, 47); // orange

//float hueValues[];
//float saturationValues[];
//float brightnessValues[];

void setup() {
  size (400, 600);
  //colorMode(HSB, 360, 100, 100);
  //noLoop();
  //frameRate(3);
}

void draw() {
  background(bg);
  rectTop.display();
  rectBottom.display();
}

void keyPressed() {
  if (key =='1') {
    colorTop = color(0, 0, random(255));
    colorBottom = color(random(255), 0, 0);
  }
  redraw();
    //ATTEMPT TO CHANGE HUE, SATURATION, BRIGHTNESS
    //for (int i=0; i<30;i++){
    //  colorTop = color(hueValues[i], saturationValues[i], brightnessValues[i]);
    //  hueValues[i] = random (360);
    //  saturationValues[i] = random(360);
    //  brightnessValues[i] = random(360);
    //}
    
   if (key == 's' || key =='S'){
     saveFrame("MR-####.png");
   }
}

void mouseMoved() {
  bg = color(224, 120, random(255));
  redraw();
}
