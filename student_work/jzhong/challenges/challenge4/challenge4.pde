ArrayList<Button> buttons;


void setup() {
  size (500, 500);

  buttons = new ArrayList<Button>();

  for (int i=0; i<5; i++) {
    buttons.add(new Button(
      random(width), random(height), random(30, 50), color (random(255), random(255), random(255))
      )
      );
  }
}

void draw() {
  background(0);

  for (Button b : buttons) {
    b.display();
    if (mousePressed == true) {
      b.update();
    }
  }
}
