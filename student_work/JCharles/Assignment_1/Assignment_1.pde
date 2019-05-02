float circlex=250;
float circley=50;

void setup() {
  size (400, 400); 
  background(255);  
}

void draw() {
  //sky color picker
  background(#9FA2F2);
  stroke(0);
  //cloud
  fill(255);
  noStroke();
  ellipse(40,40,70,70);
  ellipse(67,40,70,70);
  ellipse(56,35,70,70);
  //sun color picker
  fill(#F2CB09);
  ellipse(circlex, circley,80,80);
  //speed of sun going behind the horizon
  circlex=circlex+1;
  circley=circley+1;
  //roof of the house
  fill(#C10B91);
  triangle(220, 140, 140, 200, 300, 200);
  //house
  fill(#FFC0CB);
  rect(160, 200, 120, 100);
  //windows and door
  fill(#425841);
  rect(200, 260, 40, 40);
  fill(255);
  rect(180, 220, 20, 20); 
  rect(240, 220, 20, 20);
  //doorknob
  fill(0);
  ellipse(210,280,10,10);
  fill(255);
  //grass
  noStroke();
  fill(0,105,0);
  rect(0,300,400,100);
}
