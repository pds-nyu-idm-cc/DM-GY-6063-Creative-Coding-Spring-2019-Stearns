class Tube{
float x;
float y;
Tube(){
  x= width-50;
  y =height/2; 
}
void display(){
  fill(0);
 rect(x,y,50,50);
}
void accend(){
 x--;
 }
}
