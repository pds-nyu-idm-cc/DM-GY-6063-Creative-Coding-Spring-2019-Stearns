// 1. new attributes
//2. update pos, vel
//3. draw
class Particle {
 PVector pos;
 PVector vel;
 PVector acc;
 color c;
 float r;
 
 Particle (PVector _p,PVector _v ){
   pos =_p;
   vel = new PVector(random(-3,3),random(-3,3));
   //set acc to change the particles falling (0,0,.5) vs bursting motion (0,0)
   acc = new PVector (0,0);
   c = color (random (255), random(255), random(255));
   r = random (10,100);
}
void update (){
  pos.add(vel);
  vel.mult(0.98);
  vel.add(acc);
  //pos.x changed to r or pos.y, sin changed to noise
//r +=noise(frameCount/3.0);
pos.y +=sin(frameCount/r + r);
  if (pos.y>height){
    vel.y= -vel.y;
  }
  PVector delta = new PVector (mouseX, mouseY);
  delta.sub(pos);
  delta.normalize();
  //makes particle move away from mouse
 // delta.mult(-1);
  pos.add(delta);
  
  r*=0.99;
}
void draw (){
  noStroke();
ellipse(pos.x,pos.y,r,r);
  fill (c);
 // rect(pos.x, pos.y, r, r);
}
}
