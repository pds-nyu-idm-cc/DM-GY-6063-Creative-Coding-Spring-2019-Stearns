class floating {
  PVector pos, vel;
  PImage img;
  String type="boat";

  floating() {

    pos = new PVector(0, 0);
      vel = new PVector(2, 1);
  }
  
  void update(){
    if (type=="boat"){
      pos.x =sin(frameCount)*10.;
    }
    if (type=="peopel"){
    }
  }

  void draw() {
    //background(0);
    pushMatrix();
    translate(0, sin(frameCount/18.)*2);
    
    if (type == "boat"){
       image(img, pos.x, pos.y);
    }
    if (type == "PEOPLE"){
       image(img, pos.x, pos.y);
    }
    
    
    popMatrix();
  
    //fill(0, 0.01);
    //rect(0, 0, width, height);
      
  }
}
