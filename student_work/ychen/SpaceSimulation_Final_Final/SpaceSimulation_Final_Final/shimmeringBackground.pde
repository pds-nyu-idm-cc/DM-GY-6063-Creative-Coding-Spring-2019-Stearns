//draws default shimmering background
void shimmeringBackground() {
  fill(255);
  noStroke();
  strokeWeight(2);
  for (int x = 0; x < width; x = x+ 100) {
    ellipse(random(width), random(height), 1, 1);
  }
  for (int y = 0; y < height; y = y + 100) {
    ellipse(random(width), random(height), 1, 1);
  }
}
