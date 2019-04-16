ArrayList<Stone> stones;
Bird bird;
void setup() {
  stones = new ArrayList<Stone>();
  bird = new Bird(new PVector(0,100));
  imageMode(CENTER);
  size(800, 600);
  ellipseMode(CENTER);
}
void draw() {
  //background
   strokeWeight(3);
  stroke(0, 0, 0);
  smooth();
  background(#B3CBE9);
  //beach
  fill(#FFCA79);
  noStroke();
  rect(0,0,300,600);
  //grass
  fill(#87EB75);
  for (int i=0; i < 7; i=i+1) {
    triangle(19+i*10, 200, 38+i*10, 150, 50+i*10, 200);
    triangle(30+i*10, 400, 45+i*10, 350, 70+i*10, 400);
    triangle(50+i*10, 500, 65+i*10, 450, 90+i*10, 500);
  }
   //the statues of stones
   stoneStatues();
  //the display of bird
   bird.display();
   bird.update();
   //the display of all stones
   for (Stone stones : stones) {
    stones.display();  
  }
  //text
  textAlign(CENTER);
  fill(#f68680);
  textSize(50);
  text("The Endless Reclamation", width/2, height/2);
}

//drop stones
void mousePressed() {
  if ( bird.isClicked() ) {
    dropStone();
  }
}
//void dropStone() {
  //stones.add(new Stone(new PVector(mouseX, mouseY)));
//}
//stone statues
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
