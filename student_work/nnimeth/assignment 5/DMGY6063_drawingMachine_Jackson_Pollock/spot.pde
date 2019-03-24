class spot{

  float x;
  float y;
  float diameter;
 

spot(float tempD){

  x= random(width);
  y = random(height);
  diameter = tempD; // temporary diameter 

}



void display(){

  noStroke();
  frameRate(1);
  fill(random(30),random(160), random(180));
  ellipse(x,y, diameter, diameter); // diameter is dynamic (see new spot)

}



}
