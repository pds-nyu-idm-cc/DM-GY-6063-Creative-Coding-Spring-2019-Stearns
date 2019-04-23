int y = 350;
int x = 750;

void setup() {
  size(1300, 1000);
} 
void draw() {
  //background
  fill(#f2bec7);
  rect(0, 0, 1300, 1000);


  //Sun
  fill(234, 51, 35);
  ellipse(x, y, 100, 100);
  //moving the sun
  y=y-1;
  x=x+2;


  //body
  fill(248, 246, 230);
  rect(200, 300, 600, 350);   


  //shades
  fill(217, 214, 190);
  noStroke();
  rect(200, 300, 600, 55);


  //roof
  fill(100);
  rect(700, 150, 50, 105);
  triangle(180, 320, 515, 20, 850, 320);
  fill(120);
  triangle(150, 320, 300, 170, 450, 320);
  fill(85);
  quad(347, 170, 322, 192, 450, 320, 500, 320);


  //windows
  fill(#9dd7e3);
  tint(5);
  rect(450, 420, 280, 150);   


  //ground
  fill(146, 149, 52);
  rect(0, 650, 1300, 1000); 


  //door
  fill(255);
  rect(250, 400, 130, 250); 
  fill(169, 185, 113);
  rect(265, 415, 100, 235);

  fill(#f0e609);
  ellipse(280, 550, 20, 20);

  ellipse(750, 110, 70, 35);
  ellipse(810, 80, 45, 25);
}
