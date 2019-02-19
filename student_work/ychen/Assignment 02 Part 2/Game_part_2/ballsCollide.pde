//velocity, PVector
//https://processing.org/examples/circlecollision.html 


//can't just use position...

void ballsCollide() {
  float collision = dist(ballx, bally, ballx2, bally2);
  boolean collide=false;


  if (collision < ((ballsize/2)+50)) {

    collide=true;
    xspeed = -xspeed;
    x2speed = -x2speed;
    //yspeed = -yspeed;
    //y2speed = -y2speed;
  } else if (collision >((ballsize/2)+50)) {
    collide = false;
  }
}
