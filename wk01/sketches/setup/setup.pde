// setup() should be the first code in your project to run
void setup() {

  // size() should be the first function called in setup().
  // size() takes two integer values as arguments,
  // setting width and height respectively.
  size(800, 450);

  // other functions can be called here are well
  // frameRate() accepts a float argument
  // default is 60, but can be set to an arbitrary value
  // note: this is the max framerate, complex code may run slower
  frameRate(30);

  // by default, draw() loops
  // this can be stopped by calling noLoop()
  // and resumed by calling loop()
  noLoop();

  // any code placed in setup will run.
  println("We're executing code in setup()");

  // We can even call custom functions so long as they
  // are declared elswehre in our sketch.
  customFunction();
  
  //background() let's us set the background color
  // a single value = greyscale 0-255
  // or RGB value can be sepcified as hex or
  // background(red,green,blue);
  background(0);
  
}

void draw() {
  println("We're executing code in draw()");
}

void customFunction() {
  println("We're executing the code in our customFunction().");
}
