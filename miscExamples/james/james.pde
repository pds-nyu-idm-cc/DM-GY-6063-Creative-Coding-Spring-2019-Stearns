// let's say that each of your visualizers is a mode...
int qtyModes; // however many different modes you want to display
boolean[] modes;

void setup() {

  size(800, 800);
  qtyModes=3;
  modes = new boolean[qtyModes];

  for (int i = 0; i < modes.length; i++) {
    modes[i] = false;
  }
}

void draw() {
  if (modes[0]) draw_histogram();
  if (modes[1]) draw_circles();
  if (modes[2]) draw_balls();
}

void keyPressed() {
  switch(key) {
    case'0':
    modes[0] = !modes[0];
    break;
    case'1':
    modes[1] = !modes[1];
    break;
    case'2':
    modes[2] = !modes[2];
    break;
    default:
    println("Mode not programmed yet!");
    break;
  }
}
