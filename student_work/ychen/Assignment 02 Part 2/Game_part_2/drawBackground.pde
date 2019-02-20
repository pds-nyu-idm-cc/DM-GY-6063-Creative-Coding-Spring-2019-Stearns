void drawBackground() {

  fill(random(255), random(255), random(255));
  noStroke();
  strokeWeight(2);
  for (int x = 0; x < width; x = x+ 800) {
    ellipse(random(width), random(height), 30, 30);
  }
  for (int y = 0; y < height; y = y + 800) {
    ellipse(random(width), random(height), 30, 30);
  }
}
