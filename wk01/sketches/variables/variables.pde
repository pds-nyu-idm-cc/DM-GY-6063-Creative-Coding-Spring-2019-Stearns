/*
Variables allow us to store values for future use.
In Processing, variables have many different flavors or types.
*/

//Common Primitives:
boolean trueOrFalse; // true or false 
byte aByte; // a whole number from -127 to 128
int anInteger; // stores resonably large positive and negative whole numbers
long a64bitInteger;
float a32bitFloatingPoint;
double a64bitFloat;
char aCharacter;

//Common Composites
String aStringOfCharacters;


// we can declare AND initialize variables globally before setup()
color bgColor = 0xABCDEF;

// or we can declare them globally here and initialize in setup()
float fps;

void setup(){
  size(800,450);
  background(bgColor);
  fps=30;
  frameRate(fps);
}

void draw(){
  bgColor=color(int(random(0,256)),int(random(0,256)),int(random(0,256)));
  background(bgColor);
  //frameRate((59*mouseX/width)+1);
}

void mouseMoved(){
  frameRate((59*mouseX/width)+1);
}
