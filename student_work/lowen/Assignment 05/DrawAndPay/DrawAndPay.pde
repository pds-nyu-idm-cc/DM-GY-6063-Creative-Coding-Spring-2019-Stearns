//Lauren Owen
//Imagine a world where whatever you draw comes to life
//At a cost of course


float color1, color2, color3; 
PImage bg;
//I dont know why the zero is not changing but the increments
int cost=0;
int rate = 1;
int radius = 25;

void setup() { 
  size(1000, 751); 
  background(bg = loadImage("empty-lot.jpg"));
  // Tools
  tools();
  
}


void draw () {
  if ((mousePressed) && (mouseY < 600) && (mouseX > 210)) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  //cost
  textSize(20);
  text(+ cost, 35, 650);
  text("$", 22, 650);
  text("Total", 20,600);
  text("Cost", 23,625);
  textSize(10);
  text("Draw and", 23,670);
  text("watch it", 23,690);
  text("come to life", 15,710);
}

void mousePressed() { 
  //I read to add white to the background to make the counter go up
  //But it messed up my entire interface
  //So I took it off and let the overlay just happen
  //fill(255);
  {   
      cost = cost +10;     
    }
  
  //white
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 10 && mouseY <= 50 ) {  
    color1 = 255; 
    color2 = 255; 
    color3 = 255; 
    stroke(color1, color2, color3);
  }
  //black
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 60 && mouseY <= 100 ) {  
    color1 = 0; 
    color2 = 0; 
    color3 = 0; 
    stroke(color1, color2, color3);
  }
  //red
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 110 && mouseY <= 150 ) {  
    color1 = 255;
    color2 = 0;
    color3 = 0;  
    stroke(color1, color2, color3);
  }
  //blue
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 160 && mouseY <= 200 ) {  
    color1 = 0; 
    color2 = 0; 
    color3 = 255; 
    stroke(color1, color2, color3);
  }
  //orange
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 210 && mouseY <= 250 ) {  
    color1 = 255; 
    color2 = 127; 
    color3 = 0; 
    stroke(color1, color2, color3);
  } 
  //yellow
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 260 && mouseY <= 300 ) {

    color1 = 255; 
    color2 = 225; 
    color3 = 0; 
    stroke(color1, color2, color3);
  } 
  //beige
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 310 && mouseY <= 350 ) {  
    color1 = 220; 
    color2 = 170; 
    color3 = 115; 
    stroke(color1, color2, color3);
  }
  //brown
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 360 && mouseY <= 400 ) {   
    color1 = 135; 
    color2 = 90; 
    color3 = 30; 
    stroke(color1, color2, color3);
  }
  //green
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 410 && mouseY <= 450 ) { 
    color1 = 0; 
    color2 = 80; 
    color3 = 0; 
    stroke(color1, color2, color3);
  }
  //grey
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 460 && mouseY <= 500 ) {  
    color1 = 80; 
    color2 = 80; 
    color3 = 80; 
    stroke(color1, color2, color3);
  }  

  //random
  if (mouseX >=20 && mouseX <= 60 && mouseY >= 510 && mouseY <= 550 ) {    
    color1 = random(255); 
    color2 = random(255); 
    color3 = random(255); 
    stroke(color1, color2, color3);
    cost++;
  }
 
}
void keyPressed() {
  if (key == 'r' || key == 'R') { 
    color1 = random(255);
    color2 = random(255);
    color3 = random(255);
    stroke(color1, color2, color3);
  } else {
    color1 = 0;
    color2 = 0;
    color3 = 0;
  }
}

//void mouseReleased() {
  //if (dist(mouseX, mouseY, pmouseX, pmouseY) <= radius){
  //cost++;
  //}
  
//}

void tools()
{
 //toolbox
  fill(255);
  rect(0, 0, 80, height);
  //white
  fill(255, 255, 255);
  ellipse(40, 30, 40, 40); 
  //black
  fill (0, 0, 0); 
  ellipse(40, 80, 40, 40); 
  //red
  fill(255, 0, 0);
  ellipse(40, 130, 40, 40); 
  //blue
  fill(0, 0, 255);
  ellipse(40, 180, 40, 40); 
  //orange
  fill (255, 127, 0);
  ellipse(40, 230, 40, 40);
  //yellow
  fill (255, 225, 0);
  ellipse(40, 280, 40, 40);
  //beige
  fill (220, 170, 115);
  ellipse(40, 330, 40, 40);
  //brown
  fill (135, 90, 30); 
  ellipse(40, 380, 40, 40);
  //green
  fill (0, 80, 0);
  ellipse(40, 430, 40, 40);
  //grey
  fill (80, 80, 80);
  ellipse(40, 480, 40, 40);
  //randomize
  fill (255, 255, 255);
  ellipse(40, 530, 40, 40);
  fill (0, 0, 0);
  textSize(25);
  text("R", 33, 540);

  fill (0, 0, 0);
  textSize(13);

  stroke (255, 255, 255); 
  strokeWeight(2);  
}
