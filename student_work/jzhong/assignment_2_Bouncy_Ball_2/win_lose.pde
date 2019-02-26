void result() {
  int process= 0;
  if (life <=0) {
    /*refresh background and display game over*/
    background(0);
    String gameOver = "GAME OVER";
    String retry = "CLICK ANYWHERE TO RETRY";
    textAlign(CENTER);
    textSize(40);
    fill(255);
    text(gameOver, width/2, height*2/5);
    /*retry instruction*/
    textSize(18);
    text(retry, width/2, height*3/5);
  }
  
  if (score >=10) {
    background(0);
    String gameOver = "YOU WON!";
    String retry = "CLICK ANYWHERE TO RETRY";
    textAlign(CENTER);
    textSize(40);
    fill(255);
    text(gameOver, width/2, height*2/5);
    /*retry instruction*/
    textSize(18);
    text(retry, width/2, height*3/5);
  }

    if (mousePressed) {
      life = 10;
      gamePlay();
    }
}
