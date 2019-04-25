/*Create two balls and make the move around on the screen.
 Add functionality that will keep the balls on the screen, simulating a simple collision with a wall.
 Do not let the edge of the balls leave the screen.
 Detect whether the balls overlap and change their direction to simulate a collision.
 */
int r = 50;
//setting direction to int to avoid getting stuck
int a_speedX = int(random(1, 8));
int a_speedY = int(random(2, 7));
int b_speedX = int(random(3, 6));
int b_speedY = int(random(4, 5));
int a_posX, a_posY, b_posX, b_posY;


void setup() {
  size(500, 500);
  smooth();

  a_posX = width/2;
  a_posY = height/2;
  b_posX = width/3;
  b_posY = height/3;
}

void draw() {
  background(200, 205, 150);
  noStroke();  

  //generating two balls only
  fill(99, 91, 193);
  ellipse(a_posX, a_posY, r, r);
  fill(150, 59, 50);
  ellipse(b_posX, b_posY, r, r);

  //make them move
  bounceBall();
}

void bounceBall() {
  a_posX+=a_speedX;
  a_posY+=a_speedY;
  b_posX+=b_speedX*1.2;
  b_posY+=b_speedY*1.2;

  //invert direction if ball_a reaches the horizontal edges
  if (a_posX >= width-r/2 || a_posX <= r/2) {
    a_speedX = -a_speedX;
    whatssup();
  }

  //invert direction if ball_b reaches the horizontal edges
  if (b_posX >= width-r/2 || b_posX <= r/2) {
    b_speedX = -b_speedX;
    whatssup();
  }

  //invert direction if ball_a reaches the vertical edges
  if (a_posY >= height-r/2 || a_posY <= r/2) {
    a_speedY = -a_speedY;
    whatssup();
  }
  //invert direction if ball_b reaches the vertical edges
  if (b_posY >= height-r/2 || b_posY <= r/2) {
    b_speedY = -b_speedY;
    whatssup();
  }
} 

void whatssup() {
  println("boing");
}
