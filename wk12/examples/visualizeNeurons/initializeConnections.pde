void initializeConnections() {
  for (Neuron n : neurons) {
    for (String name : n.connections) {
      if (!connectionExists(n.name, name)) {
        connections = (Connection[])append(connections, new Connection(neurons[whichNeuron(n.name)], neurons[whichNeuron(name)]));
      }
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////
//HELPER FUNCTIONS

boolean connectionExists(String _n1Name, String _n2Name){
  for (Connection c : connections){
    if ((c.head.name.equals(_n1Name) && c.tail.name.equals(_n2Name)) || (c.tail.name.equals(_n1Name) && c.head.name.equals(_n2Name))) return true;
  }
  return false;
}
