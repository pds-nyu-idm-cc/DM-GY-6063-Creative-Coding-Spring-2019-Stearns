//Create two balls and make the move around on the screen.
Ball ball1;
Ball ball2;

void setup () {
  //background(255);
  size(500, 500);
  ball1 = new Ball(100, 200, 50);
  ball2 = new Ball(50, 60, 70);
}
void draw() {
  fill(#ED3848);
  background(255);
  ball1.display();
  ball2.display();
  ball1.update();
  ball2.update();
}
