class Particle { // initialise the new object
  float particledistance = 50;
  float particlespeed = 4.0;
  float particleforce = 0.1;
  float particleSize = random(3, 8);
  
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector target = new PVector(0, 0);
  
   void particle_display() { // display particles 
      noStroke();
      fill(255,0,64);
      ellipse(pos.x, pos.y, particleSize, particleSize);
  }
  
  void particle_move() { // move the particles and make sure it slows down 
    float proximity = 1.0;
    float distance = dist(pos.x, pos.y, target.x, target.y);
    if (distance < 50) {
      proximity = distance/particledistance;
    }
    // apply velocity to the particles
    PVector target_vel = new PVector(target.x, target.y);
    target_vel.sub(pos);
    target_vel.normalize();
    target_vel.mult(particlespeed*proximity);
    
    //apply force to the particles
    PVector target_acc = new PVector(target_vel.x, target_vel.y);
    target_acc.sub(vel);
    target_acc.normalize();
    target_acc.mult(particleforce);
    acc.add(target_acc);
    
    //apply mouse hovering to the particles
    float mouseDist = dist(pos.x, pos.y, mouseX, mouseY);
    float mouseMove = 250;
  
  if(mouseDist < mouseMove){
    PVector movePush = new PVector(pos.x, pos.y);
    movePush.sub(new PVector(mouseX, mouseY));
    movePush.normalize();
    movePush.mult((mouseMove-mouseDist)*0.003);
    acc.add(movePush);
  }
  
  //update the particle movements
  vel.add(acc);
  pos.add(vel);
  acc.mult(0);
  }
}
