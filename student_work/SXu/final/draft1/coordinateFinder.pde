void whereAmI(){
  stroke(127);
  line(mouseX,0,mouseX,height);
  line(0, mouseY, width, mouseY);
  fill(255);
  String text = "("+mouseX+","+mouseY+")";
  text(text, mouseX, mouseY);
}
