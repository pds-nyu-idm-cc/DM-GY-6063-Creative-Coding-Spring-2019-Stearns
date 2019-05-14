/* 
this project is inspired by those online prediction apps that 
predicts your luck and future. Needless to say those are mostly
random results, or even generalized results, but people always
are very hyped by them.

Click on the screen then one of the button will move up to the
top, which is how the "test taker's" day will be. Then press any
button to reset.

*/

int rand = -1;
boolean keyPress = false;

Button b1, b2, b3, b4, b5;

void setup() {
  size (600, 400);
  
  //passing location+color+string values to the Button object
  b1 = new Button(width*1/6, height/2, color(236, 30, 50), "fortunate");
  b2 = new Button(width*2/6, height/2, color(238, 100, 50), "exciting");
  b3 = new Button(width*3/6, height/2, color(255, 245, 90), "comfortable");
  b4 = new Button(width*4/6, height/2, color(103, 218, 71), "''meh''");
  b5 = new Button(width*5/6, height/2, color(50, 129, 246), "boring");
}

void draw() {
  background (198);//refresh background
  
  //display each button
  b1.display();
  b2.display();
  b3.display();
  b4.display();
  b5.display();

  displayText();
  
  //movement will be triggered only when mouse is clicked
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
