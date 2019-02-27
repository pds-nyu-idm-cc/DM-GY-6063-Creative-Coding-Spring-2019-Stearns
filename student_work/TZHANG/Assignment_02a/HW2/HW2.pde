PImage startimage;
PFont game_title;
int screenx, screeny, stage, targetx, targety, target_move_x, target_move_y;
PImage field;

void setup(){
  stage = 1;
  screenx = 500;
  screeny = 500;
  surface.setSize(screenx, screeny);
  startimage = loadImage("mario_start.jpg");
  image(startimage, 0, 0, screenx, screeny);
  game_title = createFont("Georgia", 1000, true);
  targetx = round (screenx/2);
  targety = round (screeny/2);
  target_move_x = targetx;
  target_move_y = targety;
}

void draw(){
  if(stage == 1){
    textAlign(CENTER);
    text("Mario_Go", 100, 150);
    text("Press any key to start game", 100, 170);
    if(keyPressed == true){
      stage = 2;
    }  
  }
  if(stage == 2){
    field = loadImage("mario_map.jpg");
    image(field, 0, 0, screenx, screeny);
    fill(255,255,0);
    stroke(255,255,0);
    rectMode(CENTER);
    ellipse(targetx, targety, 20, 20);
    targetx = targetx + ((target_move_x - targetx) / (50));
    targety = targety + ((target_move_y - targety) / (50));
    fill (0,255,255,25);
    stroke(0,255,255,25);
    rect(target_move_x, target_move_y, 10, 10);
  } 
}

void mousePressed(){
  if(mouseButton == RIGHT){
    target_move_x = mouseX;
    target_move_y = mouseY;
  }
}
