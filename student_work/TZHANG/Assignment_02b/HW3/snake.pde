class Snake{
  int targetx;
  int targety;
  int[] snake_headx;
  int[] snake_heady;
  int snakesize;
  
  Snake(){
    targetx=(round(random(47))+1)*10;
    targety=(round(random(47))+1)*10;
    snake_headx= new int[5000]; // It declares a pointer to a dynamic array of type int and size n
    snake_heady= new int[5000];
    snakesize=5; // start point of snake size.
  }
  
  void eatfood(){
    for(int i=snakesize;i>0;i--){
      if (i!=1){
        snake_headx[i]=snake_headx[i-1];
        snake_heady[i]=snake_heady[i-1];
    }
      else{
        switch(angle){
          case 0:
          snake.snake_headx[1]+=10;
          break;
          case 90:
          snake.snake_heady[1]-=10;
          break;
          case 180:
          snake.snake_headx[1]-=10;
          break;
          case 270:
          snake.snake_heady[1]+=10;
          break;
      }
    }
  }  
}
  void display(){
  if (snake_headx[1]==targetx && snake_heady[1]==targety)
  {
    snakesize+=round(random(3)+1);
    redo=true;
    while(redo)
    {
      targetx=(round(random(47))+1)*10;
      targety=(round(random(47))+1)*10;
      for(int i=1;i<snakesize;i++)
      {     
        if (targetx==snake_headx[i] && targety==snake_heady[i])
        {
          redo=true;
        }
        else
        {
          redo=false;
          i=1000;
        }
      }
    }
  }
  stroke(255,255,255);
  fill(0);
  rect(snake_headx[1],snake_heady[1],10,10);
  fill(255);
  rect(snake_headx[snakesize],snake_heady[snakesize],10,10);
}


  void dead(){
  for(int i=2;i<=snakesize;i++)
  {
    if (snake_headx[1]==snake_headx[i] && snake_heady[1]==snake_heady[i])
    {
      fill(255);
      rect(125,125,160,100);
      fill(0);
      text("GAME OVER",200,100);
      text("Score:  "+str(snakesize-1)+" apples eaten",200,175);
      text("Press SHIFT to RESTART",200,200);
      stopgame=true;
    }
    if (snake_headx[1]>=(width) || snake_heady[1]>=(height) || snake_headx[1]<=0 || snake_heady[1]<=0)
    {
      fill(255);
      rect(125,125,160,100);
      fill(0);
      text("GAME OVER",200,100);
      text("Score:  "+str(snakesize-1)+" apples eaten",200,175);
      text("Press SHIFT to RESTART",200,200);
      stopgame=true;
    }
  }
}

  void restart(){
    background(255);
    snake_headx[1]=200;
    snake_heady[1]=200;
    for(int i=2;i<1000;i++){
      snake_headx[i]=0;
      snake_heady[i]=0;
    }
    stopgame=false;
    targetx=(round(random(47))+1)*10;
    targety=(round(random(47))+1)*10;
    snakesize=5;
    time=0;
    angle=0;
    redo=true;
  }
}
