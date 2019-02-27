class Island {

  PShape island, leaves;
  int xpos, ypos;


  Island(
    int tempXpos, int tempYpos) {

    shapeMode(CENTER);
    island = loadShape("island.svg");
    leaves = loadShape("leaf.svg");

    xpos = tempXpos ;
    ypos = tempYpos;
  }

  void display() {
    shape(island, xpos, ypos);
    shape(leaves, xpos+73, ypos-83);
  }
}
