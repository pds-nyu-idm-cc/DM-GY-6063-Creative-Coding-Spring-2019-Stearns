class Connection{
  
  Neuron head;
  Neuron tail;
  
  Connection(Neuron _head, Neuron _tail){
    head = _head;
    tail = _tail;
  }
  
  void display(){
    stroke(255,25);
    strokeWeight(.75);
    line(head.position.x, head.position.y, tail.position.x,tail.position.y);
    head.display();
    tail.display();
  }
  
  
}
