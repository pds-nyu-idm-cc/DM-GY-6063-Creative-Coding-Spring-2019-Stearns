/**
 A sketch to demonstrate the use of Table to work with external datasets
 
 Table allows you to create or import, modify and export data with multiple rows and columns
 Table and TableRow are used here to import the data of neuron connections of the c. elegans worm
 */

// create a Table to hold data
Table data; // https://processing.org/reference/Table.html

// create list to store neuron names
String[] neuronList = new String[0]; // creates an empty 0 element array


// create an array Neuron
Neuron[] neurons = new Neuron[0];
Connection[] connections = new Connection[0];

void setup() {
  size(800, 800);

  initializeNeurons();
  
  for(Neuron n: neurons){
    for(String name : n.connections){
      if(!connectionExists(n.name,name)){
      connections = (Connection[])append(connections, new Connection(neurons[whichNeuron(n.name)], neurons[whichNeuron(name)]));
      }
    }
  }
  
  background(64);
  println("Neurons in dataset: "+neurons.length);
  println("Connections between them: "+connections.length);
  
  for(int i = 0 ; i < neurons.length; i++){
    float y = (width/2) + (width/2.5)*sin(i*(2*PI/neurons.length));
    float x = (height/2) + (height/2.5)*cos(i*(2*PI/neurons.length));
    neurons[i].position = new PVector(x,y);
  }
  
}

boolean connectionExists(String _n1Name, String _n2Name){
  for (Connection c : connections){
    if ((c.head.name.equals(_n1Name) && c.tail.name.equals(_n2Name)) || (c.tail.name.equals(_n1Name) && c.head.name.equals(_n2Name))) return true;
  }
  return false;
}

////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  background(64);
  
  for(Connection c : connections){
    c.display();
  }
  
}
