Particle p1,p2;
ArrayList<Particle> particles;

void setup(){
  size(800,600);
  p1 = new Particle(
  new PVector(50,50),
  new PVector (3,2)
  );
  
  p2 = new Particle(
   new PVector(random(width),random(height)),
  new PVector (-3,5)
  );
  
  particles = new ArrayList<Particle>();
  particles.add(p1);
  particles.add(p2);
  
  println(particles);

}
void draw (){
 //background(0)
 fill (0,10);
 rect(0,0, width, height);
  for(Particle p :particles){
    p.update();
    p.draw();
   }
   //creates circles automatically
    // Particle temp = new Particle(
  //new PVector(mouseX, mouseY),
  //new PVector (3,2)
  //);
  //particles.add(temp);
 // p1.update ();
 // p1.draw();
  
 // p2.update ();
 // p2.draw();
 if(mousePressed){
   Particle temp = new Particle(
  new PVector(mouseX, mouseY),
  new PVector (3,2)
  );
  particles.add(temp);
 }
}
  //interaction (play around with player.pos)
  void mousePressed(){
  }
