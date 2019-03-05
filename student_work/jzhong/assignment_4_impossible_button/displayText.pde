void displayText(){
  //adding background
  noStroke();
  fill(0);
  rect(100,15,400,35);
  //displaying title text
  textSize(24);
  textAlign(CENTER);
  fill(88,188,65);
  text("Welcome to Your Life Simulator", width/2, 40);
  //displaying instruction
  textSize(18);
  fill(0);
  text("How is your day today?", width/2, 75);
  text("Click on your mouse to find out!", width/2, 325);
  //maybe add a selection box later?
}
