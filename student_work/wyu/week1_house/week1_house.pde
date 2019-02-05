
float x;
float y;
void setup(){
  size(500,500);
}
void draw(){
  x=x+1;
  y=y-0.5;
  background(255,220,220);
  strokeWeight(4);
  fill(100,245,100,100);
  rect(0,400,500,100);
  fill(125);
  triangle(200,200,400,200,300,100);
  fill(255);
  rect(200,200,200,200);
  fill(200,130,100);
  ellipse(350,250,50,50);
  rect(237,275,50,125);
  ellipse(280,340,5,5);
  fill(int(random(125,255)), 0, 0);
  ellipse(100+x,100+y,90,90);
}
