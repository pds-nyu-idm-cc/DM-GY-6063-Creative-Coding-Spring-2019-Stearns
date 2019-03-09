int angle=0;
int time=0;
//int random_color = int(random(256));
boolean redo=true;
boolean stopgame=false;
Snake snake; //class object created 
//int stage;

void setup()
{
  snake = new Snake(); //New object initisalise (prevent nullpointerexception)
  snake.restart();
  size(500,500); 
  textAlign(CENTER);
  //stage = 1;
}

void draw() //draw snake while game is not stopped. 
{
  if (stopgame)          
  {} 
  else
  {
  time+=1;
  fill(255,0,0);
  stroke(0);
  rect(snake.targetx,snake.targety,10,10);
  
  if ((time % 5)==0) // control the speed of the snake moving.
  {
    snake.eatfood();
    snake.display();
    snake.dead();              
  }
  }
}

void keyPressed(){ //According to head x and y to determind the movement
  if (key == CODED)
  {
    if (keyCode == UP && angle!=270 && (snake.snake_heady[1]-10)!=snake.snake_heady[2])
    {
      angle=90;
    }
    if (keyCode == DOWN && angle!=90 && (snake.snake_heady[1]+10)!=snake.snake_heady[2])
    {
      angle=270;
    }
    if (keyCode == LEFT && angle!=0 && (snake.snake_headx[1]-10)!=snake.snake_headx[2]){
      angle=180;
    }
    if (keyCode == RIGHT && angle!=180 && (snake.snake_headx[1]+10)!=snake.snake_headx[2]){
      angle=0;
    }
    if (keyCode == SHIFT)
    {
      snake.restart();
    }
  }
}
