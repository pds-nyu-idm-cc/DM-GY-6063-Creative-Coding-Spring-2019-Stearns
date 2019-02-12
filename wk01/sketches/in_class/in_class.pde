// code example of built in functions
// DMGY 6063 Wk 01 01-29-2019

// code run once to setup Processing variables like the canvas size and other things
void setup(){
  // sets the size of our canvas pixels wide by pixels tall
  size( 500, 500 );
  
  // sets the background color to black
  background(0);
}

// this code executes at the rate set by frameRate(fps), where fps is frames per second...
// unless noLoop() is called, then you have to advance frame by frame with redraw()
// or call loop() 
void draw(){
  
  // frameCount is an integer value, the count of frames rendered since starting your program...
  // so lets put that integer into the background() function.
  background(frameCount);
  
  // stroke sets the color of any line or outline around a shape
  stroke(255,0,0);
  // sets the thickness of lines and outlines
  strokeWeight(10);
  // what it says on the tin
  point(width/2, height/2);
  
  // alignment relative to the coordinates you give the text() function 
  textAlign(CENTER, CENTER);
  // text color is set with the fill color
  fill(255);
  // output the current frameRate or number of frames per second that Processing is rendering at
  text(frameRate, width/2, height/2);
  
  // change the line/outline color to a hex value 0xAARRGGBB
  // 0x is a prefix that tells Processing that it's dealing with a hexidecimal value
  stroke(0xFFFF00FF);
  strokeWeight(0.5);
  // line( start_X, start_Y, end_X,end_Y)
  line(0,0,width,height);
  
  // lets draw a rectangle!
  stroke(0,255,0);
  strokeWeight(0.2);
  // drawing a rectangle from it's CENTER
  // see rectMode() in the Processing.org reference for more
  rectMode(CENTER);
  fill(0x88FFFF00);
  // rect(x,y,width,height);
  rect(width/2,height/2,125,125);
  
  /* 
  
  now go forth and build a house!
  you can use ellipse() of any other built in 2D primitive functions
  inspiration?
  https://static1.squarespace.com/static/5a5702212278e77572baf72b/5a60f5b0419202d291fb87d4/5a7a017ee2c48358c692c9bf/1521753292132/Screen+Shot+2018-02-06+at+2.26.45+PM.png
  
  */
}
