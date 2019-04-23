class Connection{
  
  Neuron head;
  Neuron tail;
  color strokeColor=color(255,25);
  
  Connection(Neuron _head, Neuron _tail){
    head = _head;
    tail = _tail;
  }
  
  void display(){
    stroke(color(hue(head.fillColor),191,255,96));
    strokeWeight(0.5);
    line(head.position.x, head.position.y, tail.position.x,tail.position.y);
    head.display();
    tail.display();
  }
}
