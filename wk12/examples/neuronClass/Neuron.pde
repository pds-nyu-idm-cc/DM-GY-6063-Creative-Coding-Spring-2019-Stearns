class Neuron {
  PVector position;
  PVector velocity;
  PVector acceleration;
  String name;
  ArrayList<String> connections = new ArrayList<String>();

  Neuron(String _name, PVector _position) {
    name = _name;
    position=_position.copy();
  }

  void addConnection(String _name) {
    if ( !isInConnections(connections, _name) ) {
      connections.add(_name);
    }
  }

  boolean isInConnections(ArrayList<String> _list, String _name) {
    boolean isInList = false;
    for (String n : _list) {
     
      isInList |=n.equals(_name);
    }
    return isInList;
  }
}
