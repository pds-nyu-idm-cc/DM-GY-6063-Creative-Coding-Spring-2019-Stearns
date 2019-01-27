//This sketch demonstrates common techniques and applications of commenting

// Commenting, like any form of proper project documentation,
// is one of the hardest things to get in the habit of doing well,
// but it is an indispensible tool, and will be required of you.

// Creates a comment that terminates after a line break

/*
Creates a comment that
can span multiple lines
*/

// Commenting can add visual order to your sketches as well as
// indicate the functionality of your code.
// This may seem silly at this stage in the game, but as your projects
// become more complex, structuring your code so that it is easy
// to navigate, read, and understand will become crucial

///////////////////////////////////////////////////////////////////////////
// Setup

void setup(){
  
  // Pressing command+/ (mac) or ctl+/ (win)
  // comments out the current line for selected lines of code
  
  //int futureVariable=0;
  
  //someFunction();
  //notYetWritten();
  
  // You can also comment out within a line using /* */
  println(exampleFunction(5 /*futureVariable*/));
  
}

///////////////////////////////////////////////////////////////////////////
// Draw

void draw(){
}

///////////////////////////////////////////////////////////////////////////
// exampleFunction

int exampleFunction(int someValue){
  return someValue;
}
