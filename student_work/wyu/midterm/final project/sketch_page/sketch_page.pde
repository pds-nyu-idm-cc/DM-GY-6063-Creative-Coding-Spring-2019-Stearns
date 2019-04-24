ArrayList<Stone> stones;
int gameScreen=0;
botton b;
Bird bird;
void setup() {
  b = new botton();
  stones = new ArrayList<Stone>();
  bird = new Bird(new PVector(0, 100));
  imageMode(CENTER);
  size(800, 600);
  ellipseMode(CENTER);
}
void draw() {
 
  // the logic of the game
   if (gameScreen == 0) {
    initialScreen();
  } else if (gameScreen == 1) {
    playScreen();
    
  } else if (gameScreen == 2) {
    endScreen();
  }
}
//drop stones
void mousePressed() {
   b.pop();
  if (gameScreen ==0) {
    startgame();
  } else if (gameScreen ==2) {
    restart();
  }
  if ( bird.isClicked() ) {
    dropStone();
  }
}
//void dropStone() {
//stones.add(new Stone(new PVector(mouseX, mouseY)));
//}
//stone statues
void stoneStatues() {
  for (int i = stones.size()-1; i>=0; i--) {
    Stone p = stones.get(i);
    p.update();
    p.display();
    if (p.isDead()) {
      stones.remove(i);
    }
  }
}
//initial screen
void initialScreen() {
  background(#fdeed7);
  b.display();
  textAlign(CENTER);
  fill(#f68680);
  textSize(70);
  text("The Endless Reclamation", width/2, height/2-50);
  textSize(20); 
  text("Click the botton to start", width/2, height-30);
}

//play screen
void playScreen() {
   //background
  strokeWeight(3);
  stroke(0, 0, 0);
  smooth();
  background(#B3CBE9);
  //beach
  fill(#FFCA79);
  noStroke();
  rect(0, 50, 300, 1500);
  //grass
  fill(#87EB75);
  for (int i=0; i < 7; i=i+1) {
    triangle(19+i*10, 200, 38+i*10, 150, 50+i*10, 200);
    triangle(30+i*10, 400, 45+i*10, 350, 70+i*10, 400);
    triangle(50+i*10, 500, 65+i*10, 450, 90+i*10, 500);
  }
  //the statues of stones
  stoneStatues();
  //the display of bird
  bird.display();
  bird.update();
  //the display of all stones
  for (Stone stones : stones) {
    stones.display();
  }
  //text
  textAlign(CENTER);
  fill(#f68680);
  textSize(50);
  text("The Endless Reclamation", width/2, height/2);
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
