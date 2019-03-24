class Box {
// A Box object knows about its location in the grid as well as its size with the variables x, y, w, h.
float x,y,w,h,hr,vr,angle;
  
Box(float tempX, float tempY, float tempW, float tempH, int tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    hr= w/2;
    vr= h/2;
    angle=tempAngle;
  }
 
  void display() {
    stroke(255);   
    float r =  (int)random(0, 255);
    float g =  (int)random(0, 255);
    float b =  (int)random(0, 255);     
    fill(r,g,b);
    rect(x,y,w,h);
  }
  
  void update(){
    if(abs(mouseX-x) < hr  && abs(mouseY-y)< vr){
     float r = (int)random(0, 254);
     float g = (int)random(0, 134);
     float b = (int)random(0, 48);
     
      fill(r,g,b);
      rect(x,y,w,h);
    }
  }
}
