String words = new String("Speed Racer");
Car[] myCars;
float carSize = 150;

void setup() {
  size(500, 500);
  myCars = new Car[4];
 
  myCars[0] = new Car(width/4, height/4, carSize, "car1");
  myCars[1] = new Car(3*width/4, height/4, carSize, "car2");
  myCars[2] = new Car(width/4, 3*height/4, carSize, "car3");
  myCars[3] = new Car(3*width/4, 3*height/4, carSize, "car4");

  background(0);
}

void draw() {
  background(0);
  
  //for(int i = 0 ; i < myCars.length; i++){
  //  myCars[i].display();
  //}
  
  for(Car c : myCars) c.display();
  
}

void keyPressed() {
  switch(key){
    case 'r': // reset the cars to their original sizes
    for(Car c : myCars) c.setSize(carSize);
    break;
  }
}

void mouseClicked(){
  
  for (int i = 0; i < myCars.length; i++) {

    if (myCars[i].isClicked(mouseX, mouseY)) {

      int index = int(random(myCars.length));
      float newSize = random(50, 250);

      if (index != i) myCars[ index ].setSize( newSize );
    }
  }
}
