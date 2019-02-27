void drawShape() {
  for (float x = 100, a = 300, c = 0, m = 1; c<225; x++, a-=2, m+=5) {
    c=abs(m);
    stroke(abs(c));
    strokeWeight(2);
    rect(x, x, a, a, 30);
    //c=(c-m); 
    println("color: "+c);
    println("a = "+a);
  }
  //for (int x = 125, a = 252, c = 255, m = 0; c>0; x++, a-=2, m-=1){
  //  stroke(c);
  //  strokeWeight(2);
  //  rect(x, x, a, a, 30);
  //  c=(c+m);
  //  println("color: "+c);
  //  println("a = "+a);
  //}
}
