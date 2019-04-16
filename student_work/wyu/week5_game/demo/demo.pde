int gameScreen=0;
botton b;
Fish[] balls = new Fish[20];
void setup() {
  size(800, 600);
  b = new botton();
  //the setup of balls
  for (int i=0; i<20; i++) {
    balls[i]= new Fish(random(width), random(height), random(10, 30));
  }
}
// the logic of the game
void draw() {
  if (gameScreen == 0) {
    initialScreen();
  } else if (gameScreen == 1) {
    playScreen();
    for (int i=0; i<20; i++) {
      balls[i].display();
      balls[i].move();
    }
  } else if (gameScreen == 2) {
    endScreen();
  }
}
//initial screen
void initialScreen() {
  background(#fdeed7);
  b.display();
  textAlign(CENTER);
  fill(#f68680);
  textSize(70);
  text("Eating Bubbles", width/2, height/2-50);
  textSize(20); 
  text("Click the botton to start", width/2, height-30);
}

//play screen
void playScreen() {
  background(#fdeed7);
  textSize(20);
  fill(#f8646c);
  text("remain: ", 700, 50);//+remain,500,50);
  text("credit: ", 700, 100);//+credit,500,100);
  //if(remain==0)
  //{
  //textSize(50);
}
//endgame screen
void endScreen() {
  background(#fdeed7);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  text("Your Score", width/2, height/2 - 120);
  textSize(130);
  //text(score, width/2, height/2);
  textSize(15);
  text("Click to Restart", width/2, height-30);
}
//the botton of the initial screen
void mousePressed() {
  b.pop();
}
//push the button
void mouseReleased() {
  if (gameScreen ==0) {
    startgame();
  } else if (gameScreen ==2) {
    restart();
  }
}
//other contents function
void startgame() {
  gameScreen=1;
}
void gameover() {
  gameScreen=2;
}
void restart() {
  gameScreen=1;
}
