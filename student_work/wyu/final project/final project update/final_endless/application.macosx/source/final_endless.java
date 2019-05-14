import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class final_endless extends PApplet {

//this is a game with the idea from a traditional Chinese legend called "jingwei"
//use "w" and "s" to keep the bird upward and downward
//press the bird to drop stones to get more scores
//when the bird touch the water, game over
//when the bird meet the lightning, lose one life
//produced by Wen Yu

PImage cloud;
float terrainhei;
//add background music
 
Minim minim;       
AudioPlayer player;
AudioPlayer water;
AudioPlayer bomb;
AudioPlayer start;
ArrayList<Tube> tubes;
ArrayList<Stone> stones;
float[] terrain;
float offset;
float movement = random(0, 10000);
float thr = 1/100.0f;
float globalWidth = 25;
float globalHeight = 50;
int gameScreen=0;
int w =200;
int life = 3;
int score;
boolean gameover= false;
botton b;
Bird bird;
public void setup() {
  minim = new
    Minim(this); 
  start = minim.loadFile("start.wav");
  minim = new
    Minim(this); 
  player = minim.loadFile("play.wav");
  minim = new
    Minim(this); 
  water = minim.loadFile("water.wav");
  minim = new
    Minim(this);
  bomb = minim.loadFile("bomb.wav");
  cloud=loadImage("cloud2.png");
  tubes = new ArrayList<Tube>();
  terrain = new float[w+2];
  b = new botton();
  stones = new ArrayList<Stone>();
  bird = new Bird(new PVector(0, 200));
  imageMode(CENTER);
  
  ellipseMode(CENTER);
}
public void draw() {
  // the logic of the game
  if (gameScreen == 0) {
    initialScreen();
  } else if (gameScreen == 1) {
    playScreen();   //screen of play screen
    textAlign(LEFT);
    fill(0xfff68680);
    textSize(20);
    text("Stone droped:" + score, 20, 40);
    text("Your Life:" + life, 20, 80);
  }
  if (gameover) {
    endScreen();  //end screen
  }
}

//drop stones
public void mouseReleased() {
  b.pop();
  if (gameScreen ==0) {  
    startgame();
  }
  if ( bird.isClicked() ) {
    dropStone();           //score add
    score++;
  }
  if (gameover) {          // restart and reset
    gameover = false;
    life = 3;
    score = 0;
  }
}

public void stoneStatues() {
  for (int i = stones.size()-1; i>=0; i--) {
    Stone p = stones.get(i);
    p.update();
    p.display();           //stone 
    //if (p.isDead()) {
    // stones.remove(i);
    //}
  }
}

//initial screen
public void initialScreen() {
  start.play();
  background(0xfffdeed7);
  b.display();
  textAlign(CENTER);
  fill(0xfff68680);
  textSize(50);
  text("The Endless Reclamation", width/2, height/2-50);
  textSize(20); 
  text("Click the botton to start", width/2, height-30);
}

//play screen
public void playScreen() {
  if (start.isPlaying()) {
    start.close();
  }
  player.play();
  fill(0xffB3CBE9);
  addRandomTube();
  terrain();
  fill(0xffFFD985);

  //the display of bird
  bird.display();
  bird.update();

  //tubes settings: color / move / hit / remove
  for (Tube o : tubes) {
    o.move();
    o.display();
  }
  for (int i = tubes.size()-1; i >= 0; i--) {
    Tube o = tubes.get(i);
    if  (o.isHit(bird.location.x, bird.location.y)) {
      tubes.remove(i);   //disappear tubes
      bomb.loop();   // the music of collision
      bomb.play();    
      life --;       // reduce life 
      if (life==0) {
        gameover = true; //gameover
      }
    }
  }

  //bird hit the water and die
  if (bird.isTouchedWater(terrainhei)) {
    water.loop();
    water.play();   //fall into water and the sound of water
    gameover = true;
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
public void endScreen() {
  if (player.isPlaying()) {   //control of music
    player.rewind();
  }
  if (bomb.isPlaying()) {
    player.rewind();
  }
  //text setting
  background(0xfffdeed7);
  textAlign(CENTER);
  textSize(80);
  text("Your Score:"+ score, width/2, height/2 - 120);
  textSize(15);
  text("Click Anywhere to Restart", width/2, height-100);
}

//other contents function
public void startgame() {
  gameScreen=1;
}

//terrain build
public void terrain() {
  float sky = map(bird.location.x, 0, width, 255, 0);
  background(sky, 50);
  movement+=0.01f;
  offset = movement;
  for (int i=0; i<terrain.length; i++) {
    terrain[i] = map(noise(offset), 0, 1, -30, 100);
    offset+=0.01f;
  }
  for (int i = -1; i<terrain.length-1; i++) {
    line(i*width/w, height, i*width/w, terrain[i+1]+height/2);
  }
  beginShape();
  vertex(width, height);
  vertex(0, height);
  for (int i=-1; i<terrain.length-1; i++) {
    vertex(i*width/w, terrain[i+1]+height/2);
    terrainhei = terrain[i+1]+height/2;
  }
  endShape();
}

// add tubes
public void addRandomTube() {
  if (random(1) < thr ) {
    println("should create a new obstacle");
    tubes.add(new Tube(width + (globalWidth/2), random(0, height/2)));
  }
}

// control of bird
public void keyPressed() {
  if (key == 'w') {
    bird.up();
  } 
  if (key == 's') {
    bird.down();
  }
  //save the score and picture
  if (key == 'm') {
    saveFrame("img-" + score +".jpg");
  }
}

//close the minim
public void stop() {
  player.close();
  minim.stop();
  super.stop();
}
class Bird {
  PImage bird;
  PVector acceleration;
  PVector velocity;
  PVector location;
  PVector position;
  float someDistance = 50;
  float xpos, ypos;
  Bird(PVector l) {
    bird=loadImage("niao.png");
    //acceleration = new PVector(0.05, 0);
    velocity = new PVector(2, 0);
    location = l.copy();
  }
  public void update() {
    //velocity.add(acceleration);
    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      location.x= 0;
      location.y= random(20, 300);
    }
  }

  public void display() {
    bird.resize(100, 0);
    // xpos= mouseX;
    // ypos = mouseY;

    image(bird, location.x, location.y);
    //position = new PVector(xpos, ypos);
  }
  
public Boolean isTouchedWater(float watery) {
  float water = watery;
  return (location.y >= water);
}
  public void up() {
    location.y = location.y-10;
  }
  public void down() {
    location.y = location.y+10;
  }
  public boolean isClicked() {
    return PVector.dist(location, new PVector(mouseX, mouseY)) < someDistance;
  }
}
public void dropStone() {
  stones.add( new Stone(new PVector( mouseX, mouseY)));
}
class Tube {
  PImage light;
  PVector pos;
  PVector vel;
  float globalWidth = 25;
  float globalHeight = 50;
  float w= globalWidth;
  float h = globalHeight;
  Tube(float _x, float _y) {
    light=loadImage("light.png");
    pos = new PVector(_x, _y);
    vel = new PVector(-1, 0);
  }
  public void move() {
    pos.add(vel);
  }
  public void display() {
    rectMode(CENTER);
    light.resize(100, 0);
    //rect(pos.x, pos.y, w, h);
    image(light,pos.x,pos.y);
    //plane.resize(20, 0);
  }
  public void setfill(int _c) {
    fill(_c);
  }
  public boolean isNotActive() {
    return pos.x < -w/2;
  }
  public boolean isHit(float _x, float _y) {
    float x1 = _x-w/2;
    float x2 = _x+w/2;
    float y1 = _y-h/2;
    float y2 = _y+h/2;
    float  r=dist(_x, _y, pos.x, pos.y);
    //return (pos.x > x1 && pos.x< x2) && ( pos.y > y1 && pos.y < y2);
    // return dist(x, y, _x, _y);
   return (pos.x > x1 && pos.x< x2) && ( pos.y > y1 && pos.y < y2)&& (r <= 100);
     //return;
    }
 
  }
class botton {

  int c;
  float recX1= width/2;
  float recY1= height-146;
  float h1=10;
  float h2=18;
  float w1=5;
  float w2=7;
  float recX2= width/2;
  float recY2= height-140;
  botton() {
    c=color(0xffef5751);
  }
  public void display()
  {
    fill(c);
    rectMode(CENTER);
    noStroke();
    rect(recX1, recY1, h1, w1);
    rect(recX2, recY2, h2, w2);
  }
  public void pop() {
    if (mousePressed == true) {
      w1=w1-3;
    } else {
      c = color(255, 0, 0);
    }
  }
}
class Stone {
  PVector acceleration;
  PVector velocity;
  PVector location;
  float lifespan=255;
  Stone(PVector l) {
    acceleration = new PVector(0, 0.05f);
    velocity = new PVector(random(-1, 1), random(-1, 0));
    location = l.copy();
  }
  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if (location.y > height) {
      // We're reducing velocity ever so slightly 
      // when it hits the bottom of the window
      velocity.y = velocity.y * -0.05f; 
      location.y = height;
    }
    //lifespan-=2;
  }
  public boolean isDead() {
    if (location.x <= 300) {
      return true;
    } else {
      return false;
    }
  }
  public void display() {
    //stroke(0, lifespan);
    //strokeWeight(2);
    noStroke();
    fill(127, lifespan);
    ellipse(location.x, location.y, 12, 12);
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "final_endless" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
