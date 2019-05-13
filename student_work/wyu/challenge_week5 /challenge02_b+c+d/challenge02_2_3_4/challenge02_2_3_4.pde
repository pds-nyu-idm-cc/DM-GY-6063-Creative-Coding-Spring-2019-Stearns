//Add functionality that will keep the balls on the screen, simulating a simple collision with a wall.
//Do not let the edge of the balls leave the screen.
//Detect whether the balls overlap and change their direction to simulate a collision.
Ball ball1;
Ball ball2;

void setup () {
  //background(255);
  size(500, 500);
  ball1 = new Ball(100, 200);
  ball2 = new Ball(50, 70);
}
void draw() {
  fill(#ED3848);
  background(255);
  ball1.display();// show balls
  ball2.display();
  ball1.update();
  ball2.update(); // move of the balls
  ball1.collision();//collsion of wall
  ball2.collision();
  ball1.ballCollision(ball2.location.x, ball2.location.y);//Detect whether the balls overlap
    ball2.ballCollision(ball1.location.x, ball1.location.y);//change the direction of two balls
}
