int rect_height;
int offset_Y;
color base;
float red;
float green;
float blue;

void setup() {
  size (500, 700);
  //rect_height = int(height/random(10, 25));
  //base = color(random(10, 245), random(10, 245), random(10, 245));
  //red = red(base);
  //green = green(base);
  //blue = blue(base);
}

void draw() { 
  //inspired by Agnes Martin's work
  //divide the canvas with rectangles that take the full width
  //from a base colour, generate an alternative colour by only variating the amount of red)
  rect_height = int(height/random(10, 25));
  generateRectangles(rect_height);
}

void generateRectangles(int a) {
  base = color(random(10, 245), random(10, 245), random(10, 245));
  red = red(base);
  green = green(base);
  blue = blue(base);
  for (int i=0; i<a; i++) {
    fill(red, green, blue);
    noStroke();
    rect(0, offset_Y, width, rect_height);
    offset_Y +=rect_height;
    if (red>200 && red < 255){
      red-=100;
    } else if (red < 200 && red > 10){
      red +=50;
    }
    
  }
}

void keyPressed() {

  if (key == 's') {
    //export canvas to png
    saveFrame("assignment_03_########.png");
  }
}
