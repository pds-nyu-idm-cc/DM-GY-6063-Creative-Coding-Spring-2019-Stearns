////////////////////////////////////////////////////////////////////////////////////////

class Neuron {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  String name;
  ArrayList<String> connections = new ArrayList<String>();
  float size=5;
  Neuron(String _name, PVector _position) {
    name = _name;
    position=_position.copy();
  }

  void addConnection(String _name) {
    if ( !isAConnection(connections, _name) ) {
      connections.add(_name);
    }
  }

  boolean isAConnection(ArrayList<String> _list, String _name) {
    boolean isInList = false;
    for (String n : _list) {
     
      isInList |=n.equals(_name);
    }
    return isInList;
  }
  
  void display(){
    stroke(127);
    strokeWeight(0);
    fill(255);
    circle( position.x,position.y, size+(size*connections.size()/12));
  }
  
  void showName(){
    textAlign(CENTER,CENTER);
    fill(0);
    text(name, position.x,position.y);
  }
  
}
