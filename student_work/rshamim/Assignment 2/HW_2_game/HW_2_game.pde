float circlex = 10;
float triangley = 100;

void setup () {
  size (500, 500);
}

void draw (){
  background (14, 75, 39);
  stroke (0);
  if (circlex<width/2)
  fill (68, 29, 192);
  ellipse(circlex, triangley, 50, 50);
  
  circlex=circlex+1;
  triangley=triangley+10;
  
 
}
