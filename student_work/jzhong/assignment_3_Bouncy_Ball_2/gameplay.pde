void gamePlay () {
  //some background
  background(0);

  //set up play area
  stroke(255);
  strokeWeight (2);
  noFill();
  rect (width/8, height/8, width*6/8, height*6/8); 

  //playarea parameters
  //left:x=width/8;
  //top:y=height/8;
  //right:x=width*7/8;
  //bottom:y=height*7/8;

  //display background text
  String message = "Hello, Welcome to NYU Ball Juggler";
  String message2 = "Click inside of the BOX to Drop the NYU Ball";
  String Score = "Score: " + score;
  String Life = "Life: " + life;
  textAlign (CENTER);
  textSize (18);
  fill(255);
  text(message, width/2, height/12);
  text(message2, width/2, height*11/12);
  textAlign (CENTER);
  text(Score, width*7/8, height/12-10);
  text(Life, width*7/8, height/12+10);

  drawShapes();


  //draw bouncy ball
  stroke(255);
  fill(100, 68, 220);
  circle(a, b, r);
  //adding gravity
  moveB+=g;


  //ball movement
  a+=moveA;
  b+=moveB; 

  wallDetection();
  juggleBlock();

}
