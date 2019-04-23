////////////////////////////////////////////////////////////////////////////////////////

class Neuron {
  
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  String name;
  ArrayList<String> connections = new ArrayList<String>();
  float size=5;
  float scaleDiv=5;
  color strokeColor=color(255,50);
  color fillColor;
  
  Neuron(String _name) {
    name = _name;
  }
  
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
    stroke(strokeColor);
    strokeWeight(0);
    fill(fillColor);
    circle( position.x,position.y, size+(size*connections.size()/scaleDiv));
  }
  
  void showName(){
    textAlign(CENTER,CENTER);
    fill(0);
    text(name, position.x,position.y);
  }
  
}
