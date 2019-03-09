
Ball[] balls = new Ball[5];
int totalScore=0;

void setup(){
  size(800,500);
  //balls[0] = new Ball(100,height+100,50);
  //balls[1] = new Ball(200,height+100,40);
  //balls[2] = new Ball(300,height+100,30);
  //balls[3] = new Ball(400,height+100,50);
  //balls[4] = new Ball(500,height+100,50);
  for(int i=0;i<5;i++){
    balls[i] = new Ball(100.0*i+200, height+100,random(30,50));
  }
}

void draw(){
  background(244,238,236);
  noStroke();
  for(int i=0;i<5;i++){
    float tempMult = max(totalScore/10.0,1);
    balls[i].mult=tempMult;
    balls[i].update();
    balls[i].draw();
  }
  fill(49,47,47);
  textSize(25);
  text(str(totalScore),20,40);
  textSize(15);
  text("X"+str(balls[0].mult),20,90);
}

void mousePressed(){
  for(int i=0;i<5;i++){
     if (dist(balls[i].x,balls[i].y,mouseX,mouseY)<balls[i].r){
       balls[i].clicked=true;
       balls[i].reset();
       totalScore+=balls[i].score;
     } 
  }
}

void mouseReleased(){
  
  //win
  if (totalScore >=20){
    noLoop();
    background(244,238,236);
    textSize(18);
    text("Okay fine you win", 200, height/2);
}
}
