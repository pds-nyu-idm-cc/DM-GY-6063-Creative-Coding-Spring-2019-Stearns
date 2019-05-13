TriWave red;
TriWave grn;
TriWave blu;

void setup() {
  size(100, 100);
  background(0);
  
  red = new TriWave(300);
  grn = new TriWave(450);
  blu = new TriWave(575);
  
}

void draw() {
  background(color(red.get()*255,grn.get()*255,blu.get()*255));

  red.update();
  grn.update();
  blu.update();
}
