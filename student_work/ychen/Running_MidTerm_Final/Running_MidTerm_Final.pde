//This project shows moving particles on the screen in a "running river" type of motion.
//As the mouse moves around, the colors will change depending on the locaton of the mouse.
//When any key is pressed and held, particles turn into the background color
//to create an illusion of "erasing" the previous path.
//Took the element from the drawing machine assignment—press the mouse the save frame.

int total = 150;
color bgcolor = color (24, 10, 60);
color pcolor = color (219, 123, 137);
color p1color = color (85, 102, 170);

Particle [] allparticles = new Particle[total];
Particle [] allparticles_1 = new Particle[total];

void setup() {
  size (800, 600);
  background (bgcolor);

  //setting up multiple particles

  for (int i=0; i <total; i++) {
    allparticles[i] = new Particle();
    allparticles_1[i] = new Particle();
  }
}

void draw() {
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
}

void mousePressed() {
  saveFrame("MP-####.png");
}
