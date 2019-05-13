class Circle {
 
  PVector acc;
  PVector vel;
  PVector pos;
  float x;
  float y;
  float speed=.9;
  float r = random(20-250);
  
  float life = 255; //fading the circle to white 
  
  color c;
 
 
    Circle (){
      
      x = mouseX; //using mouse x & y positions 
      y = mouseY;
      pos = new PVector (x,y);
      vel = new PVector (random(-10,20),random(-10,20)); // how fast its moving  
      acc = new PVector(0,0);
      
      c = color(random(20,30), random(220,225), random(120,255),70);
      
      }

  void move(){
        
        // making the circles on screen move in different directions
        pos.add(vel);
        vel.mult(speed); //speed the circles are coming out 
        vel.add(acc);
        
        r += (noise(frameCount/6.0))*3;
        
        if (pos.y > height){
          vel.y = -vel.y;
        }
        
        // adding delta mult moves circles away from mouse 
        PVector delta = new PVector(mouseX, mouseY);
        delta.sub(pos);
        delta.normalize();
        delta.mult(-3.5); // how fast it "runs away" from mouse 
        pos.add (delta);
        
        r *=1;
    
    
    }

  boolean done(){
    // circles fade out 
    life--;
    if (life < 0){
      return true;
    }else {
     return false;
    }
  }
  

  void display(){
   
    fill(c,life);
    ellipse(pos.x, pos.y, r, r);
    
  }


}
