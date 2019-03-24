/*Create two balls and make the move around on the screen.
 Add functionality that will keep the balls on the screen, simulating a simple collision with a wall.
 Do not let the edge of the balls leave the screen.
 Detect whether the balls overlap and change their direction to simulate a collision.
 */
int r = 50;
int speedX = 4;
int speedY = 2;
int posX, posY;

void setup() {
  size(500, 500);

  smooth();
  posX = width/2;
}

void draw() {
  background(200, 205, 150);

  posX+=speedX;
  println(posX);
  noStroke();  

  if (posX+r/2 >= width) {
    posX -= speedX;
    
  } 
 
  fill(50);
  ellipse(posX, posY, r, r);
 
}
