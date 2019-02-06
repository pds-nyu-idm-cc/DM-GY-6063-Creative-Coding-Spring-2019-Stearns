noStroke();

//background
  size(800,600);
//sky
  background(178,222,225);
//grass
  fill(136,196,37);
  rect(0,500,800,600);
//sun
  fill(255,194,67);
  circle(650,120,200);
  fill(201,93,67);
  circle(650,120,150);
//cloud
  fill(255,255,255);
  ellipse(200,80,250,50);
  fill(255,255,255);
  ellipse(380,110,250,55);

//house
  fill(255,204,231);
  rect(100,385,385,130);
//roof
  fill(255,189,219);
  triangle(100,385,290,330,485,385);
//door
  fill(255,255,255);
  square(255,435,80);
//window
  fill(255,244,224);
  circle(180,450,60);
  fill(255,244,224);
  circle(400,450,60);
//pig ear
  fill(255,189,219);
  triangle(100,285,200,360,100,385);
  fill(255,189,219);
  triangle(485,285,385,360,485,385);

//text
  String s = "JUDE'S PIG HOUSE";
  fill(255,255,255);
  textAlign(CENTER);
  textSize(30);
  text(s,100,250,385,250);
  
//zoog
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(0);
  fill(238,202,130);
  rect(600,455,20,100);
  fill(255);
  ellipse(600,425,60,60);
  fill(0);
  ellipse(581,425,16,32);
  ellipse(619,425,16,32);
  stroke(0);
  line(590,505,580,515);
  line(610,505,620,515);
  
  
