int i=200;
int j=100;

void setup(){
  size(600,600);
}


void draw(){
  //background(random(0,350));
  //grass
  rect (0,400,10000,500);
  //branches of tree
  //triangle(425,300,350,100,250,300);
  fill(#228B22);
  fill(#A52A2A);
  //base of tree
  //rect(320,300,50,100);
  fill(#FFFF00);
  ellipse(100,70,70,70);
  fill(#228B22);
  
  fill(255,255,255);
  ellipse(100,60,60,60);
  ellipse(145,60,90,80);
  ellipse(190,60,58,58);
  //cloud 1
  
  
  ellipse(400,60,60,60);
  ellipse(445,60,90,80);
  ellipse(490,60,58,58);
}
