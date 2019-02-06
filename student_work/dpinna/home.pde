void setup() {

  size(480, 480);
}


void draw() {

  //background scenery
  //sky
  fill(75, 240, 237);
  noStroke();
  rect(0, 0, 480, 170);
  //horizon
  line(0, 170, 480, 170);
  //seagulls
  strokeWeight(2);
  stroke(0);
  line(39, 42, 40, 40);
  line(40, 40, 44, 44);
  line(44, 44, 48, 40);
  line(49, 42, 48 ,40);
  
  strokeWeight(2);
  int a;
  int b;
  a = 10;
  b = 12;
  line(39+a, 42+b, 40+a, 40+b);
  line(40+a, 40+b, 44+a, 44+b);
  line(44+a, 44+b, 48+a, 40+b);
  line(49+a, 42+b, 48+a ,40+b);
  a = -20;
  b = 7;
  line(39+a, 42+b, 40+a, 40+b);
  line(40+a, 40+b, 44+a, 44+b);
  line(44+a, 44+b, 48+a, 40+b);
  line(49+a, 42+b, 48+a ,40+b);
  a = 20;
  b = -1;
  line(39+a, 42+b, 40+a, 40+b);
  line(40+a, 40+b, 44+a, 44+b);
  line(44+a, 44+b, 48+a, 40+b);
  line(49+a, 42+b, 48+a ,40+b);
  a = 38;
  b = -4;
  line(39+a, 42+b, 40+a, 40+b);
  line(40+a, 40+b, 44+a, 44+b);
  line(44+a, 44+b, 48+a, 40+b);
  line(49+a, 42+b, 48+a ,40+b);
  a = 59;
  b = 4;
  line(39+a, 42+b, 40+a, 40+b);
  line(40+a, 40+b, 44+a, 44+b);
  line(44+a, 44+b, 48+a, 40+b);
  line(49+a, 42+b, 48+a ,40+b);
  

  
  
  //bay and sea
    //sea
    noStroke();
    fill(94, 255, 205);
    rect(0, 170, 480, 260);
    
    //grasslands behind the beach
    fill(64, 105, 16);
    beginShape();
      vertex(310,200);
      vertex(480,200);
      vertex(480,440);
      vertex(0,415);
    endShape();

  //beach
    //point(4,350);
    //point(290,210);
    fill(247, 239, 146);
    noStroke();
    curve(-1050, -200, 0, 378, 294, 208, -800, 600);

  //hill in the background
    fill(55, 173, 64);
    arc(450, 205, 290, 180, -PI, 0);

  //second green hill slightly darker
  fill(27, 122, 34);
  stroke(27, 122, 34);
  ellipse(-100, 520, 600, 300);

  //green hill
  fill(42, 143, 50);
  stroke(42, 143, 50);
  ellipse(370, 500, 600, 300);


  //brown street leading to the house
  noFill();
  strokeWeight(9);
  stroke(149, 112, 65);
  //curve(240, 470, 320, 420, 400,350, 400,350);
  //point(240,470);
  //point(280,450);
  //point(320,420);
  //point(300,380);
  //point(420,350);
  line(240, 470, 340, 450);
  line(340, 450, 250, 420);
  line(250, 420, 370, 400);
  line(370, 400, 300, 380);
  line(300, 380, 420, 355);


  //house
  //central building
  fill(155, 22, 39);
  strokeWeight(2);
  stroke(155, 22, 39);
  rect(358, 300, 60, 55);

  //right hand side building
  fill(136, 18, 33);
  strokeWeight(2);
  stroke(136, 18, 33);
  rect(418, 325, 40, 30);

  //left hand side building
  fill(136, 18, 33);
  strokeWeight(2);
  stroke(136, 18, 33);
  rect(317, 325, 40, 30);

  //windows
  fill(255);
  noStroke();
  rect(364, 326, 12, 12);
  rect(400, 326, 12, 12);
  //door
  fill(107,60,19);
  strokeWeight(1);
  stroke(165,96,35);
  rect(381, 326, 14, 30);

  //rooftop
  fill(76,67,58);
  noStroke();
  triangle(358, 300, 418, 300, 388, 284);
  
}
