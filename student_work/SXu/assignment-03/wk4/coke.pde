//bottle and square background
class coke{
  float x,y;
  float r=255,g=255,b=255;
  float r2=255,g2=255,b2=255;
  void draw(){
    fill(r,g,b);
    rect(x,y,100,100);
    
    pushMatrix();
      translate(x,y);
      scale(2);
       beginShape();
       vertex(18.9,6.7);
       vertex(18.6,14.8);
       vertex(11.6,23.7);
       vertex(12.3,40.2);
       vertex(18.3,40.2);
        fill(r2,g2,b2);
       endShape(CLOSE);
      ellipse(x,y,20,20);
      ellipse(56, 46, 55, 20);
    popMatrix();
  }
}
