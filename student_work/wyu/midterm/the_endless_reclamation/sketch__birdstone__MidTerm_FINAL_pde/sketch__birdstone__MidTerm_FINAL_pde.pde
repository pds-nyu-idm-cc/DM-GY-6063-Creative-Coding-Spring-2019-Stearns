
ArrayList<Stone> stones;
Bird bird;

void setup() {
  imageMode(CENTER);
  size(800, 600);
  ellipseMode(CENTER);
  rectMode(CENTER);
  stones = new ArrayList<Stone>();
  bird = new Bird();
}

void draw() {
  //the display of bird
  bird.display();
  strokeWeight(3);
  stroke(0, 0, 0);
  smooth();
  background(#B3CBE9);
  //beach
  fill(#FFCA79);
  noStroke();
  triangle(0, 600, 0, 0, 400, 600);
  //grass
  fill(#87EB75);
  for (int i=0; i < 7; i=i+1) {
    triangle(19+i*10, 200, 38+i*10, 150, 50+i*10, 200);
    triangle(30+i*10, 400, 45+i*10, 350, 70+i*10, 400);
    triangle(50+i*10, 500, 65+i*10, 450, 90+i*10, 500);
  }


  //the image of bottle
  //fill(#BDD2E9);
  //line(width/2-25, height/2+3, width/2-25, height/2+65);
  //line(width/2+25, height/2+3, width/2+25, height/2+65);
  //ellipse(width/2, height/2+3, 50, 15);
  //rect(width/2, height/2+80, 90, 100, 7);
  //stroke(255);
  //for (int i=0; i < 7; i=i+1) {
  //  line(width/2+10*i-35, height/2+80, width/2+10*i-25, height/2+90);
  //  line(width/2+10*i-35, height/2+80+20, width/2+10*i-25, height/2+90+20);
  //} 
  stoneStatues();
}
//the image of bird
void stoneStatues() {
  for (int i = stones.size()-1; i>=0; i--) {
    Stone p = stones.get(i);
    p.update();
    p.display();
    if (p.isDead()) {
      stones.remove(i);
    }
  }
}

void mousePressed() {
  if ( bird.isClicked() ) {
    dropStone();
  }
}
void dropStone() {
  stones.add(new Stone(new PVector(mouseX, mouseY)));
}
