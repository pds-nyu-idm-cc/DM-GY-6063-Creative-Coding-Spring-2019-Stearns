class BasicGraphics{
  PVector p;
  BasicGraphics(PVector _p){
    p = _p;
  }
  void draw(){
    pushMatrix();
      translate(p.x,p.y);
      float r = sin(frameCount/10.)*20;
      ellipse(0,0,r,r);
    popMatrix();
  }
  void translateToPosition(){ //move initial position for every objects
     pushMatrix();
      translate(p.x,p.y);
  }
  
  void backToPosition(){
     popMatrix();
  }
  
}


class RotatingSquare extends BasicGraphics{ //extends to put the square object under basicgraphics
  RotatingSquare(PVector _p){
    super(_p);
  }
  void draw(){
    super.translateToPosition();
    rectMode(CENTER);
      stroke(#FFCC54);
      fill(#FFCC54);
      rotate(frameCount/20.);
      rect(0,0,30,30);
    super.backToPosition();
  }
  
}





class TwoPointLine extends BasicGraphics{
  TwoPointLine(PVector _p){  
    super(_p);
  }
  void draw(){
    super.translateToPosition();
    //rotate(frameCount/10.);
 
    //float d = 15 +sin(frameCount/10.)*10;
    float d = 15;
    rotate(sin(frameCount/30.)* PI/2 ); //use framecount to rotate, try with sin
    stroke(#FFCC54);
    fill(#FFCC54);
    line(-d ,0,d ,0);
    ellipse(d ,0,5,5);
    ellipse(-d ,0,5,5);
      
    super.backToPosition();
  }
  
}

class MovingBall extends BasicGraphics{
  float br=25;
  float x = 0;
  MovingBall(PVector _p){
    super(_p);
  }
  void draw(){
    
    super.translateToPosition();
    stroke(#FFCC54);
    //noFill();
    rectMode(CENTER);
    rotate(sin(frameCount/10.)* PI/2);
    //rect(0,0,br*2,br*2);
    noFill();
    ellipse(x,0,10,10);
    x+=2;
    if (x>br){
      x=-br;
    }
    super.backToPosition();
  }
  
}


class FiveBallExplode extends BasicGraphics{
  float r =0;
  FiveBallExplode(PVector _p){
    super(_p);
  }
  void draw(){
    super.translateToPosition();
    stroke(#E9D8B1);
    float d = 20;
    float dd = PI*2/5;
    fill(#FFCC54);
    if (r<30){
      //r++;
      r = lerp(r,35,0.03); 
    }else{
      r=0;
    }
    float subR = map(r,0,30,10,0); //range of number - map(value, start1, stop1, start2, stop2)
    for(int i=0;i<5;i++){
      rotate(dd);
      ellipse(r,0,subR,subR);
      
    }
      
    super.backToPosition();
  }
  
}

class ConfusedBall extends BasicGraphics{
  float br=25;
  float x = 0;
  ConfusedBall(PVector _p){
    super(_p);
  }
  void draw(){
    
    super.translateToPosition();
    stroke(#E9D8B1);
    rectMode(CENTER);
    //rotate(frameCount/5.);
    rotate(sin(frameCount/5.)* PI/5);
    fill(#FFCC54);
    ellipse(x,0,5,5);
    ellipse(0,x,5,5);
    x+=2;
    if (x>br){
      x=-br;
    }
    super.backToPosition();
  }
  
}

class FourSquares extends BasicGraphics{
  FourSquares(PVector _p){  
    super(_p);
  }
  void draw(){
    super.translateToPosition();
    //rotate(frameCount/10.);
    stroke(#FFCC54);
    //float d = 15 +sin(frameCount/10.)*10;
    float d = 15;
    rotate(sin(frameCount/20.)* PI/2 ); //use framecount to rotate, try with sin
    fill(#FFCC54);
    rect(d ,0,3,3);
    rect(-d ,0,3,3);
    rect(0,d,3,3);
    rect(0,-d,3,3);
      
    super.backToPosition();
  }
  
}

class MovingLines extends BasicGraphics{
  MovingLines(PVector _p){  
    super(_p);
  }
  void draw(){
    super.translateToPosition();

    stroke(#FFCC54);
    float ml = 15;
    rotate((frameCount/30.)); //use framecount to rotate, try with sin
    line(ml ,0,-ml ,0);
    line(0, ml, 0, -ml);
 
      
    super.backToPosition();
  }
  
}

class JitterCircle extends BasicGraphics {
  JitterCircle(PVector _p){
    super(_p);
}
  void draw(){
    super.translateToPosition();
    rectMode(CENTER);
    float jcx = 0;
    float jcy = 0;
    float jcr = 5;
    jcx += random(-2,2);
    jcy += random(-2,2);
    fill(#FFCC54);
    stroke(#FFCC54);
   ellipse(jcx,jcy,jcr,jcr);
   ellipse(jcx,jcy+10,jcr,jcr);
   ellipse(jcx,jcy-10,jcr,jcr);
 super.backToPosition();

}
}

class Type extends BasicGraphics {
  Type(PVector _p){
    super(_p);
}
  void draw(){
    super.translateToPosition();
   font = loadFont("AvenirNext-DemiBold-30.vlw");
textFont(font, 20);
text("PROGRAMMING POSTER",0,0);
font = loadFont("AvenirNext-DemiBold-25.vlw");
textFont(font, 13);
text("Inspired by Tim Rodenbroeker",0,20);
 super.backToPosition();

}
} 
  
class Footnote extends BasicGraphics {
  Footnote(PVector _p){
    super(_p);
}
  void draw(){
    super.translateToPosition();
   font = loadFont("AvenirNext-DemiBold-25.vlw");
textFont(font, 10);

text("Alberta Hardiman",0,0);
text("Creative Coding",7,12);
 super.backToPosition();

}
} 
  
class FootnoteLeft extends BasicGraphics {
  FootnoteLeft(PVector _p){
    super(_p);
}
  void draw(){
    super.translateToPosition();
   font = loadFont("AvenirNext-DemiBold-25.vlw");
textFont(font, 10);

text("Midterm Project",0,0);
 super.backToPosition();

}
} 

class FootnoteCenter extends BasicGraphics {
  FootnoteCenter(PVector _p){
    super(_p);
}
  void draw(){
    super.translateToPosition();
   font = loadFont("AvenirNext-DemiBold-25.vlw");
textFont(font, 10);

text("Spring 2019",0,0);
 super.backToPosition();

}
} 
