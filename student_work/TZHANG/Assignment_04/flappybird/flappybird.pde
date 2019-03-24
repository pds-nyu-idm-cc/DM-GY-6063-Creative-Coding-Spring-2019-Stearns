PImage startImg;
PImage gameImg;
PImage startbutton;
boolean gamestage = false;
int buttonWidth = 120;
int buttonHeight = 80;

Bird b;
Pipe p;
int empty = 500;
boolean jumping = false;
PVector gravity = new PVector(0, 0.5);
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

void setup() {
  size(1000, 667);
  startImg = loadImage("flappybird.jpg");
  gameImg= loadImage("gameimg.png");
  startbutton = loadImage("button.png");
  b = new Bird();
  p = new Pipe();
  pipes.add(new Pipe());
}

void draw() {
  if(gamestage == false){
    background(startImg);
    image(startbutton, 435, 550, buttonWidth, buttonHeight);
    stageUpdate();
  }
  if(gamestage){
    background(gameImg);
    image(startbutton, 850, 550, buttonWidth, buttonHeight);
  
    if (frameCount % 40 == 0) {
      pipes.add(new Pipe());
    }
    if (mousePressed && mouseX > 850 && mouseX < 970 && mouseY > 550 && mouseY < 630) {
      PVector up = new PVector(0, -5);
      b.birdFly(up);
    }
  
    b.birdUpdate();
    b.flappybird();
    for (int i = pipes.size()-1; i>0; i--) {
      Pipe p = pipes.get(i);
      p.pipeUpdate();
      
      if (p.collide(b)) {
        p.checkcollision(true);
      } else {
        p.checkcollision(false);
      }
  
      if (p.pipex < -p.pipewidth) {
        pipes.remove(i);
      }
    }
  }
}

void stageUpdate(){
  if(mousePressed && mouseX > 435 && mouseX < 555 && mouseY > 550 && mouseY < 630){
    background(gameImg);
    gamestage = true;
  }
}

void keyPressed(){
  saveFrame("pic.tif");
}

void restart(){
}
