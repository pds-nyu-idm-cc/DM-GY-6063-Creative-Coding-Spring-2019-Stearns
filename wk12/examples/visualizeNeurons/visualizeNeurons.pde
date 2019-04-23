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
  colorMode(HSB, 255);
  
  initializeNeurons();
  
  initializeConnections();
  
  println("Neurons in dataset: "+neurons.length);
  println("Connections between them: "+connections.length);
  
  background(64);
  
}

////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  
  background(64);
  
  for(Connection c : connections){
    c.display();
  }
  
}
