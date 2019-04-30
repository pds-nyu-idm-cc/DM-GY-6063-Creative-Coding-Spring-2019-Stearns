PImage cloud;
ArrayList<Tube> tubes;
int score;
ArrayList<Stone> stones;
float[] terrain;
float offset;
float movement = random(0, 10000);
int w =200;
int gameScreen=0;
botton b;
Bird bird;
void setup() {
  cloud=loadImage("cloud.png");
  tubes = new ArrayList<Tube>();
  terrain = new float[w+2];
  b = new botton();
  stones = new ArrayList<Stone>();
  bird = new Bird(new PVector(0, 100));
  imageMode(CENTER);
  size(800, 600);
  ellipseMode(CENTER);
  //why tubes only have one on the screen???not working ?????
  for (int i=0; i<100; i++) {
    tubes.add(new Tube());
  }
}
void draw() {

  // the logic of the game
  if (gameScreen == 0) {
    initialScreen();
  } else if (gameScreen == 1) {
    
    playScreen();
    

    fill(#f68680);
    //for (int i=0; i<5; i++){
    // Tube p = tubes.get(i);
    //  p.accend();
    //  p.display();
    //} do not know the reason wht did not work
  } else if (gameScreen == 2) {
    endScreen();
  }
}
//drop stones
void mouseReleased() {
  b.pop();
  if (gameScreen ==0) {
    startgame();
  } else if (gameScreen ==2) {
    restart();
  }
  if ( bird.isClicked() ) {
    dropStone();
    score++;
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
  textSize(50);
  text("The Endless Reclamation", width/2, height/2-50);
  textSize(20); 
  text("Click the botton to start", width/2, height-30);
}

//play screen
void playScreen() {
  //background
  fill(#B3CBE9);
  terrain();
  //obstacles add the problem is how to make random obstacles around????? 
  //try to use for loop but the screen only have 1 obstacles and was not the rectangle I set before
  for (int i=0; i<50; i++) {
    Tube p = tubes.get(i);
    p.accend();
    p.display();
    /////////need to find the reason why not work the collsion
    //if  (p.isCollison()) {
    //  bird.display();
    //  bird.update();
    //}
    image(cloud,200,100);
  } 


  //strokeWeight(3);
  //stroke(0, 0, 0);
  //smooth();
  //background(#B3CBE9);
  ////beach
  //fill(#FFCA79);
  //noStroke();
  //rect(0, 50, 300, 1500);
  ////grass
  //fill(#87EB75);
  //for (int i=0; i < 7; i=i+1) {
  //  triangle(19+i*10, 200, 38+i*10, 150, 50+i*10, 200);
  //  triangle(30+i*10, 400, 45+i*10, 350, 70+i*10, 400);
  //  triangle(50+i*10, 500, 65+i*10, 450, 90+i*10, 500);
  //}
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
  textAlign(LEFT);
  fill(#f68680);
  textSize(20);
  text("Stone droped:" + score, 0, 40);
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
void terrain() {
  //background build
  background(230);
  movement+=0.01;
  offset = movement;
  for (int i=0; i<terrain.length; i++) {
    terrain[i] = map(noise(offset), 0, 1, -100, 100);
    offset+=0.01;
  }
  for (int i = -1; i<terrain.length-1; i++) {
    line(i*width/w, height, i*width/w, terrain[i+1]+height/2);
  }
  beginShape();
  vertex(width, height);
  vertex(0, height);
  for (int i=-1; i<terrain.length-1; i++) {
    vertex(i*width/w, terrain[i+1]+height/2);
  }
  endShape();
}
//boolean isCollison() {
//  if (bird.location.x == tubes) {
//    return true;
//  }
//}
