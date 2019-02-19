float x; 
float y; 
int r = 10; 
int gameResult = 1; 
float[] ballx = new float [20]; 
float[] bally = new float [20]; 
int[] ballr = new int [20]; 
float[] speedx = new float [20]; 
float[] speedy = new float [20]; 
float a = 0.1; 

void setup() { 
  size (800, 700); 
  ellipseMode (CENTER); 

  // setup for blackballs
  for (int i=0; i<20; i++) { 
    ballx[i] = random (0, width); 
    bally[i] = random (0, height); 
    ballr[i] = int (random (0, 30));
  } 
  //setup for yellow ball
  x = random (0, width); 
  y = random (0, height);
} 

void draw() { 
  background(100, 100, 100);
  //background
  for (int h=0; h<width; h=h+20) {
    line(h, 0, h, width);
    h=h+int(random(20));
  }
  for (int s=0; s<width; s=s+20) {
    line(0, s, width, s);
    s=s+int(random(20));
  }


  //20 black balls
  fill (0); 
  for (int i=0; i<20; i++) { 
    ellipse (ballx[i], bally[i], 2*ballr[i], 2*ballr[i]);
  } 

  //1 yellow moving ball
  fill (200, 60, 100); 
  ellipse (x, y, 2*r, 2*r); 
  for (int i=0; i<20; i++) { 
    float math=(ballx[i]-x)*(ballx[i]-x)+(bally[i]-y)*(bally[i]-y)-(ballr[i]+r)*(ballr[i]+r); 
    if (math<0 && ballr[i]>r) { 
      gameResult = 0;
    }
  } 

  // game status 
  if (gameResult == 0) { 
    gameover();
  } else { 

    //mouse following
    x = mouseX;
    y = mouseY;
    for (int i=0; i<20; i++) { 
      move (i);
    }
  } 

  // eat small ball
  for (int i=0; i<20; i++) { 
    if ((ballx[i]-x)*(ballx[i]-x)+(bally[i]-y)*(bally[i]-y)-(ballr[i]+r)*(ballr[i]+r)<0 && ballr[i]<r) { 
      r = int (sqrt ((r+ballr[i])*(r+ballr[i]))); 
      ballr[i] = 0;
    }
  } 

  //how to win the game
  int sum = 100; 
  for (int i=0; i<20; i++) { 
    sum += ballr[i];
  } 
  if (sum == 100) { 
    win();
  }
} 

//the movement of blackballs
void move(int i) { 
  speedx[i] += random (-a, a); 
  speedy[i] += random (-a, a); 
  ballx[i] += speedx[i]; 
  bally[i] += speedy[i]; 
  if (ballx[i]<-5) { 
    ballx[i] += width;
  } 
  if (ballx[i] > width+5) { 
    ballx[i] -= width;
  } 
  if (bally[i] < -5) { 
    bally[i] += height;
  } 
  if (bally[i] > height+5) { 
    bally[i] -= height;
  }
} 

//lose
void gameover() { 
  fill (200, 40, 40); 
  textSize (100); 
  textAlign(CENTER); 
  text ("Game Over", width/2, height/2);
} 

//win
void win() { 
  fill (255); 
  textSize (50); 
  textAlign(CENTER); 
  text ("Congratulations!You Win!", width/2, height/2);
}
