int rand = -1;
boolean keyPress = false;

Button b1, b2, b3, b4, b5;

void setup() {
  size (600, 400);
  //background (198);
  b1 = new Button(width*1/6, height/2, color(236, 30, 50), "fortunate");
  b2 = new Button(width*2/6, height/2, color(238, 100, 50), "exciting");
  b3 = new Button(width*3/6, height/2, color(255, 245, 90), "comfortable");
  b4 = new Button(width*4/6, height/2, color(103, 218, 71), "''meh''");
  b5 = new Button(width*5/6, height/2, color(50, 129, 246), "boring");
  //noLoop();
}

void draw() {
  background (198);

  b1.display();
  b2.display();
  b3.display();
  b4.display();
  b5.display();

  displayText();
  movement();
  reset();
  
}

void mouseClicked() {
  rand = int(random(5));
  keyPress = false;
}

void keyPressed() {
  keyPress = true;
  //println(keyPress);
}
