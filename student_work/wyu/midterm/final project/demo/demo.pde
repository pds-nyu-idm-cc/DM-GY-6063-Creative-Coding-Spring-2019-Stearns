PImage cloud;
//import processing.sound.*;
//SoundFile file;
//import ddf.minim.*;
//Minim minim;
//AudioSample water;
ArrayList<Tube> tubes;
int score;
ArrayList<Stone> stones;
float[] terrain;
int life = 3;
float offset;
float movement = random(0, 10000);
int w =200;
float thr = 1/100.0;
int gameScreen=0;
float globalWidth = 25;
float globalHeight = 50;
boolean gameover= false;
botton b;
Bird bird;
void setup() {
  //file = new SoundFile(this, "music.mp3");
  ////file.play();
  //minim = new Minim(this);
  //water = minim.loadSample("music.mp3");
  cloud=loadImage("cloud2.png");
  tubes = new ArrayList<Tube>();
  terrain = new float[w+2];
  b = new botton();
  stones = new ArrayList<Stone>();
  bird = new Bird(new PVector(0, 200));
  imageMode(CENTER);
  size(800, 600);
  ellipseMode(CENTER);
  //why tubes only have one on the screen???not working ?????
  //for (int i=0; i<100; i++) {
  //  tubes.add(new Tube());
}
void draw() {
  // the logic of the game
  if (gameScreen == 0) {
    initialScreen();
  } else if (gameScreen == 1) {
    //fill(255);
    //file.play();
    playScreen();
    //text
    textAlign(LEFT);
    fill(#f68680);
    textSize(20);
    text("Stone droped:" + score, 0, 40);
    text("Your Life:" + life, 0, 80);
  }
  if (gameover) {
    endScreen();
  }
}

//else if (gameScreen == 2) {
//endScreen();
//}

//drop stones
void mouseReleased() {
  b.pop();
  if (gameScreen ==0) {
    startgame();
  }
  if ( bird.isClicked() ) {
    dropStone();
    score++;
  }
  if (gameover) {
    gameover = false;
    life = 3;
  }
}
//void keyPressed(){

//if ( bird.isClicked() ) {
//    dropStone();
//    score++;
//  }
//}
//void dropStone() {
//stones.add(new Stone(new PVector(mouseX, mouseY)));
//}
//stone statues
void stoneStatues() {
  for (int i = stones.size()-1; i>=0; i--) {
    Stone p = stones.get(i);
    p.update();
    p.display();
    //if (p.isDead()) {
    // stones.remove(i);
    //}
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
  //water.trigger();
  //background
  fill(#B3CBE9);
  addRandomTube();
  terrain();
  ////fill(#FFD985);
  //tubes settings: color / move / hit / remove
  fill(#FFD985);
  //the display of bird
  bird.display();
  bird.update();
  for (Tube o : tubes) {
    o.move();
    o.display();
  }
  for (int i = tubes.size()-1; i >= 0; i--) {
    Tube o = tubes.get(i);
    //if ( o.isHit(bird.location.x, bird.location.y) || o.pos.x<-o.w/2) {
    if  (o.isHit(bird.location.x, bird.location.y)) {
      tubes.remove(i);
      life --;
      if (life==0) {
        gameover = true;
      }
    }
  }
  //sky and cloud
  image(cloud, 200, 100);
  //the display of bird
  bird.display();
  bird.update();
  //the display of all stones
  stoneStatues();
  for (Stone stones : stones) {
    stones.display();
  }
}
//endgame screen
void endScreen() {
  background(#fdeed7);
  textAlign(CENTER);
  //fill(236, 240, 241);
  textSize(80);
  text("Your Score:"+ score, width/2, height/2 - 120);
  //textSize(130);
  //text(score, width/2, height/2);
  textSize(15);
  text("Click Anywhere to Restart", width/2, height-100);
}

//other contents function
void startgame() {
  gameScreen=1;
}
//void gameover() {
//  gameScreen=2;
//}
//void restart() {
//  gameScreen=1;

void terrain() {
  //background build
  float sky = map(bird.location.x, 0, width, 255, 0);
  background(sky, 50);
  movement+=0.01;
  offset = movement;
  for (int i=0; i<terrain.length; i++) {
    terrain[i] = map(noise(offset), 0, 1, -30, 100);
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

void addRandomTube() {
  if (random(1) < thr ) {
    println("should create a new obstacle");
    tubes.add(new Tube(width + (globalWidth/2), random(0, height/2)));
  }
}

void keyPressed() {
  if (key == 'w') {
    bird.up();
  } 
  if (key == 's') {
    bird.down();
  }
}
