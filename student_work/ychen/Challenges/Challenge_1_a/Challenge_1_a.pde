color circle = color (255);
color highlight = color (255, 0, 0);

void setup() {
  size (300, 300);
  background(0);
}

void draw() {
  ellipseMode(CENTER);
  noStroke();
  fill(circle);
  ellipse(width/2, height/2, 100, 100);
  
  float d = dist(width/2, height/2, mouseX, mouseY);
    if (d <= 50) {
    circle = color (highlight);
    }
  
}
