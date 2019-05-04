class Star{
  PVector p,v;
  float timePan;
  Star(PVector _p, PVector _v){
    
    //setting the initial position
    p = _p;
    
    //setting the velocity
    v = _v;
    
    //setting the time pan to let stars flashes in different cycle
    timePan = random(100);
    
  }
  void update(){
    
    //update the next position with velocity
    p.add(v);
    
  }
  void draw(){
    
    pushMatrix();
    
      //draw everything after translating to the object's position
      translate(p.x,p.y);
      
      //set a variable of the final color
      float fillColor = 255;
      
      //base on time + some random pan of time, if it is 20 part of 40 time span, make the star dark, otherwise make the star white
      if ((timePan + frameCount)% 40 <20){
        fillColor=0;
      }
      
      fill(fillColor);
      
      //draw the star (or draw multiple circles for a cloud)
      ellipse(0,0,5,5);
      
    popMatrix();
    
  }
}
