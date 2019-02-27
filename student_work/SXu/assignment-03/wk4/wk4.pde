//Andy Warhol style
coke[] cokes = new coke[100];
int count=0;
void setup(){
  size(500,500);
  
  for(int i=0;i<5;i++){
    for(int o=0;o<5;o++){
      cokes[count] = new coke();
      cokes[count].x=i*100;
      cokes[count].y=o*100;
      count++;
    }
  }

}

void draw(){
  for(int i=0;i<count;i++){
    cokes[i].draw();
  }
  fill(0,0,0,50);
  noStroke();
  ellipse(mouseX,mouseY,30,30);
 

}
void mousePressed(){
  println(mouseX+","+mouseY);
  int x = mouseX/100;
  int y = mouseY/100;
  int count = x*5+y;
  cokes[count].r=random(0,255);
  cokes[count].g=random(0,255);
  cokes[count].b=random(0,255);
  cokes[count].r2=random(0,255);
  cokes[count].g2=random(0,255);
  cokes[count].b2=random(0,255);
}

//save image
void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("#####.png");
}
