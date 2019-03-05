spot[] spot = new spot[10000];// calling the spot class

int total = 0;

void setup(){
  
  size(800,800);
  for(int i =0; i< spot.length; i++){ // spot length = 10,000 spots  
    spot[i] = new spot(random(5,100)); // dynamic size of the diameter between 5 & 100
  }

}

void mousePressed(){
  
  total = total + 5; // adds 5 circle to the canvas

}

void keyPressed(){

  total = total - 10; //subtracts 10 circles from the canvas 
}

void draw(){

    background(255);
    for(int i = 0; i < total; i++){ //drawing the total pressed by mouse or key 
     spot[i].display();// calling display from class
    }

}
