class TriWave {
  
  boolean dir = true; // if true, index up, if false, index down
  int max = 1000;
  int min = 0;
  int index = 0;
  float val = 0;

  TriWave(){
  }
  
  TriWave(int _max){
    max = _max;
  }

  void update() {
    val = map(index, min, max, 0, 1);
    if (dir && index < max ) {
      index++;
    } else if (dir && index == max) {
      dir = false;
      index--;
    } else if ( !dir && index > min ) {
      index--;
    } else if ( !dir && index == min) {
      dir=true;
      index++;
    }
  }
  
  float get(){
    return val;
  }

  void display() {
    textAlign(CENTER, CENTER);
    fill(255);
    text("Count: "+index, width/2, height/2);
    text("Map: "+val, width/2, height/2 + 20);
  }
}
