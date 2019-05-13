class TriWave {
  boolean dir = true;
  int count=0;
  int max = 100;
  int min = 0;
  float val = 0;


  TriWave() {
  }
  
  TriWave(int _max){
    max = _max;
  }
 
  void update() {

    val = map(count, min, max, 0, 1);
    if (dir && count < max) {
      count++;
      //count %= max+1;
    } else if (dir && count == max) {
      dir = false;
      count--;
    } else if (!dir && count > min) {
      count--;
    } else if (!dir && count == min) {
      dir = true;
      count++;
     
    }

    println("count:" +count);
  }

  float get() {
    return val;
  }
}
