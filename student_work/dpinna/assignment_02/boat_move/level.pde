class Level {

  //TODO move to class object to define sky and sea pattern in jpeg/png or better in gif
  color lightBlue = color(208, 255, 255);
  color sky = color(141, 187, 231);
  Obstacle wreck1, wreck2, wreck3, wreck4;
  Island newIsland;

  Level(int level, String name, int islandX, int islandY, int wreck1Xpos, int wreck1Ypos, int wreck2Xpos, int wreck2Ypos, int wreck3Xpos, int wreck3Ypos, int wreck4Xpos, int wreck4Ypos) {
    newIsland = new Island(islandX, islandY);
    wreck1 = new Obstacle(wreck1Xpos, wreck1Ypos);
    wreck2 = new Obstacle(wreck2Xpos, wreck2Ypos);
    wreck3 = new Obstacle(wreck3Xpos, wreck3Ypos);
    wreck4 = new Obstacle(wreck4Xpos, wreck4Ypos);
  }

  void winningScenario() {

    if (level == 1 || level == 2) {
      if (myBoat.xpos>=0-newIsland.xpos-150 && myBoat.xpos<newIsland.xpos+200 && myBoat.ypos>=newIsland.ypos && myBoat.ypos<=newIsland.ypos+200) {
        status = "completed";
        showText();
      } else if (level ==3) {
        if (myBoat.xpos>=0-newIsland.xpos-150 && myBoat.xpos<newIsland.xpos+200 && myBoat.ypos>=newIsland.ypos && myBoat.ypos<=newIsland.ypos+200) {
          status = "completed";
          showText();
          //showGameOver();
        }
      }
    }
  }

  void display() {
    //simple background
    background(lightBlue);
    noStroke();
    fill(sky);
    rect(0, 0, 800, 150);


    //alternative background
    //noStroke();
    //PImage img = loadImage("sea.JPG");
    //beginShape();
    //texture(img);
    //vertex(0, 0, 0, 0);
    //vertex(800, 0, 3200, 0);
    //vertex(800, 150, 3200, 1650);
    //vertex(0, 150, 0, 1650);
    //endShape();

    //beginShape();
    //texture(img);
    //vertex(0, 150, 0, 1650);
    //vertex(800, 150, 3000, 1650);
    //vertex(800, 800, 3000, 2400);
    //vertex(0, 800, 0, 2400);
    //endShape();

    newIsland.display();
    wreck1.display();
    wreck2.display();
    wreck3.display();
    wreck4.display();
  }
}
