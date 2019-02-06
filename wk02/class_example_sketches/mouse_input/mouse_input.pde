// declare vairables
float r = 50;
color fillColor = color(0);
void setup(){

  // set screen size
  size(500, 500);
  
  // set starting background color
  background(255);
}

void draw(){
  
  // blank out canvas
  background(255);
  
  // style our shape
  strokeWeight(1);
  stroke(0);
  fill(fillColor);
  
  // draw shape
  ellipse(mouseX,mouseY,2*r,2*r);
  
}

void mousePressed(){
 
  if(mouseButton==37){
    fillColor=color(random(256),random(256),random(256));
  } else {
    r = random(100);
  }
}
