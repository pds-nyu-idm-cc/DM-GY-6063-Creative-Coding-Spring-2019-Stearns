void wallDetection(){
  if (x < 0){
    x = 0;
    rateX = -rateX;
  }
  if (x > width){
    x = width;
    rateX = -rateX;
  }
  if (y > height){
    y = height;
    rateY = -rateY;
  }
  if (y < 0){
    y = 0;
    rateY = -rateY;
  }
}
