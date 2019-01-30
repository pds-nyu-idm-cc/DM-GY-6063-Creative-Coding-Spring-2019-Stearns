

void setup(){
  size( 500, 500 );
  background(0);
}

void draw(){
  
  background(frameCount);
  
  stroke(255,0,0);
  strokeWeight(10);
  point(width/2, height/2);
  
  textAlign(CENTER, CENTER);
  fill(255);
  text(frameRate, width/2, height/2);
  
  stroke(0xFFFF00FF);
  strokeWeight(0.5);
  line(0,0,width,height);
  
  stroke(0,255,0);
  strokeWeight(0.2);
  
  rectMode(CENTER);
  fill(0x88FFFF00);
  rect(width/2,height/2,125,125);
  
}
