//Tried to add lines between the particles as they move


int total = 200;
color bgcolor = color (24, 10, 60);
color pcolor = color (219, 123, 137);
color p1color = color (85, 102, 170);
float maxDist = 70;
float minDist = 30;

Particle [] allparticles = new Particle[total];
Particle [] allparticles_1 = new Particle[total];

void setup() {
  //fullScreen();
  size (800, 600);
  background (bgcolor);
  frameRate(20);
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
    for (int j=i+1; j<total; j++) {
      if (allparticles[i].distance(allparticles[j]) < maxDist) {
        stroke(pcolor);
        strokeWeight(1);
        allparticles[i].drawLine(allparticles[j]);
      }else if (allparticles[i].distance(allparticles[j]) > minDist){
        noStroke();
      }
      if (allparticles_1[i].distance(allparticles_1[j]) < maxDist) {
        stroke(p1color);
        strokeWeight(1);
        allparticles_1[i].drawLine(allparticles_1[j]);
      }else if (allparticles_1[i].distance(allparticles_1[j]) > minDist){
        noStroke();
      }
    }
  }

  for (int i=0; i <total; i++) {
    fill(pcolor);  
    allparticles[i].move();
    allparticles[i].display();
    allparticles[i].touchedEdge();
    allparticles[i].changeColor();

    fill(p1color);
    allparticles_1[i].move();
    allparticles_1[i].display();
    allparticles_1[i].touchedEdge();
    allparticles_1[i].changeColor();
  }

  //saveFrame("output/Running_####.png");
}

//void mousePressed() {
//  saveFrame("Running_####.png");
//}
