void mouseDetection(){
  float d = dist(mouseX,mouseY,x,y);
  if (d<50){
    rateX=-rateX;
    rateY=-rateY;
  }
  println(d);
}
