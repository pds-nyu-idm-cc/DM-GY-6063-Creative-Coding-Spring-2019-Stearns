
void setup(){
  size(500,500);
  background(0,160,0);
  noLoop();
}

void draw(){
  //sky
  fill(0,130,225);
  noStroke();
  rect(0,0,500,250);
  
  //first floor
  fill(180, 102, 0);
  stroke(1);
  rect(100,200,165,130);
  
  //garage
  rect(265, 200, 120, 130);
  
  //roof
  fill(135, 45, 0);
  triangle(60, 130, 430, 130, 220, 60);
  
  //second floor
  fill(180, 102, 50);
  rect(100,130,165,70);
  rect(265,130,80,70);
  
  //window & door
  fill(179, 209, 255);
  rect(120, 220, 100, 100);
  rect(160, 140, 60, 50);
  fill(#c68c53);
  rect(280, 140, 40, 58);
  strokeWeight(2);
  line(170, 221, 170, 319);
  line(190, 141, 190, 189);

  
  //Balcony
  strokeWeight(2);
  noFill();
  rect(140, 170, 255, 30, 0, 0, 10, 10); 
  line(185, 170, 185, 200);
  line(230, 170, 230, 200);
  line(270, 170, 270, 200);
  line(310, 170, 310, 200);
  line(350, 170, 350, 200);
  
  
  //garage gate
  strokeWeight(1);
  fill(200);
  rect(280, 240, 90, 30);
  rect(280, 270, 90, 30);
  rect(280, 300, 90, 29);
  
  //drive way
  strokeWeight(3);
  fill(180);
  quad(280, 330, 370, 330, 505, 380, 505, 450);
  
  //yard
  strokeWeight(1);
  fill(153, 102, 60);
  quad(100, 335, 265, 335, 380, 400, 70, 400);
  
  //sun or moon depends on what you think lol
  strokeWeight(2);
  fill(#ff6600);
  circle(490,40,150);
  
}
