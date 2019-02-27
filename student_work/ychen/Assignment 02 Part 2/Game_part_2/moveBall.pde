void moveBall() {

  ballx = ballx + xspeed;
  bally = bally + yspeed;

  if (ballx >= width-(ballsize/2) || ballx <= (ballsize/2)) {
    //turn around
    xspeed = xspeed * -1;
  }

  if (bally >= height-(ballsize/2) || bally <= (ballsize/2)) {
    //turn
    yspeed = yspeed * -1;
  }

  ballx2 = ballx2 + x2speed;
  bally2 = bally2 + y2speed;

  if (ballx2 >= width-50 || ballx2 <= 50) {
    //turn around
    x2speed = x2speed * -1;
  }

  if (bally2 >= height-50 || bally2 <= 50) {
    //turn
    y2speed = y2speed * -1;
  }
}
