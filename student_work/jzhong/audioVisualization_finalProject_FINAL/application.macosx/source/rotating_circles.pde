void rotating_circles () {
  colorMode(RGB, 255);
  
  
  fill(0,80);
  noStroke();
  rect(0,0,width,height);
  
  translate(width/2, height/2);

  
  for (int o = 0; o<3; o++) {
    for (int i=0; i<8; i++) {

      pushMatrix();
        switch(o){
          case 0:
            rotate(frameCount*.01 +2*PI/8*i);
            translate(o*100+map(dist, 0, 6, 30, 100), 0);
            break;
          case 1:
            rotate(-1*(frameCount*.01 +2*PI/8*i));
            translate(o*100+map(dist_snare, 0, 6, 40, 120), 0);
            break;
          case 2:
            rotate(frameCount*.01 +2*PI/8*i);
            translate(o*100+map(dist_hat, 0, 6, 50, 150), 0);
            break;
        }
        stroke(0);
        fill(255, 0, 0);
        ellipse(0, 0, r, r);
        rect(-s, -s, 2*s, 2*s);
      popMatrix();
      
    }
  }
  
  translate(-width/2, -height/2);
}
