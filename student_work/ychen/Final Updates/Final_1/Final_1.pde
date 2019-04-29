//codes from midterm project
//added positions update (vertex)
//not working

int total = 150;
color bgcolor = color (24, 10, 60);
color pcolor = color (219, 123, 137);
color p1color = color (85, 102, 170);

Particle [] allparticles = new Particle[total];
Particle [] allparticles_1 = new Particle[total];

void setup() {
  size (800, 600);
  background (bgcolor);
  //frameRate(100);
  //randomSeed(0);

  //setting up multiple particles
  for (int i=0; i <total; i++) {
    allparticles[i] = new Particle();
    allparticles_1[i] = new Particle();
  }
}

void draw() {
    background (bgcolor);
  for (int i=0; i <total; i++) {
    fill(pcolor);  
    allparticles[i].move();
    allparticles[i].display();
    //allparticles[i].touchedEdge();
    allparticles[i].changeColor();

    fill(p1color);
    allparticles_1[i].move();
    allparticles_1[i].display();
    //allparticles_1[i].touchedEdge();
    allparticles_1[i].changeColor();
  }
  
  //saveFrame("output/Running_####.png");
}

//void mousePressed() {
//  saveFrame("Running_####.png");
//}
