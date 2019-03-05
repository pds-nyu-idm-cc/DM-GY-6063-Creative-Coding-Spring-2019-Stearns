class Ball{
  float x,y,r,vy;
  color c;
  int score;
  float mult=1.0;
  boolean clicked=false;
  boolean stopgame=false;
  Ball(float _x,float _y,float _r){
    x= _x;
    y= _y;
    r= _r;
    reset();
  }
  void draw(){
    if (!clicked){
      fill(c);
      ellipse(x,y,r,r);
    }
    
  }
  void update(){
    y+=vy*mult;
    if (y<-100){
      reset();
    }
  }
  
  /*void dead(){
     for(int i=0;i<5;i++){
       if (balls[i]>height);
       fill(255);
       text("Game over",400,400);
       stopgame=true;
     }
    
  }
  */
  
  void reset(){
    clicked=false;
    c = color(random(0,255),random(0,255),random(0,255));
    score = int(random(1,3));
    vy = -random(1,3);
    y=height+100;
  }
}
