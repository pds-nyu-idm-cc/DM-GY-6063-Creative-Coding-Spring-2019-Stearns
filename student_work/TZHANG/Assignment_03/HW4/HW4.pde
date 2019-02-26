Box[][] grid; 
int cols = 30;
int rows = 30;

void setup() {
  size(600,600);
  background(0);
  grid = new Box[cols][rows];
  
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      grid[i][j] = new Box(i*20,j*20,30,50,i+j);
    }
  }
  colorGrid();
}

void draw() {

  for (int i = 0; i < cols; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      grid[i][j].update();
    }
  }
}

void colorGrid(){
   for (int i = 0; i < cols; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      grid[i][j].display();
    }
  }
}

void keyPressed(){
  saveFrame("pic.tif");
}
