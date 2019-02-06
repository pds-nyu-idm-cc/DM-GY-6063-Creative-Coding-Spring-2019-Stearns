// declare and array of floats
float[] myValues;

void setup() {
  size(100, 100);

  //initialize that array to all zeros
  myValues = new float[100];

  myValues[0]=.12567463524235;

  println(myValues.length);
  println(myValues[0]);
  println(myValues[1]);
  
  // if we try to read outside of array's bounds
  // by using an index greater than it's length-1
  // we get an error
  // try/catch allows us to print that error without crashing our program
  
  try {
    println(myValues[100]);
  } 
  catch (Exception e) {
    println("Yikes! Something went wrong...");
    println(e);
  }
}
