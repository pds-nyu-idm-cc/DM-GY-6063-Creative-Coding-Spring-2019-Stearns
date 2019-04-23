/**
 A sketch to demonstrate the use of Table to work with external datasets
 
 Table allows you to create or import, modify and export data with multiple rows and columns
 Table and TableRow are used here to import the data of neuron connections of the c. elegans worm
 */

// create a Table to hold data
Table connections; // https://processing.org/reference/Table.html

// create list to store neuron names
String[] neuronList = new String[0]; // creates an empty 0 element array

// create an array Neuron
Neuron[] neurons = new Neuron[0];

void setup() {
  size(10, 10);

  connections = loadTable("neurodata.txt", "tsv"); // tsv means the data is tab delimited (separated by tabs)

  for (TableRow connection : connections.rows()) {
    
    // each row has the names of two connected neurons:
    String neuron1 = connection.getString(0);
    String neuron2 = connection.getString(1);

    // for each connection, we check whether one neuron is already listed
    if (!neuronIsInArray(neuron1)) {
      // if not, we create a new one
      Neuron n = new Neuron(neuron1, new PVector(random(width), random(height)));
      // add the other neuron as a connection to it
      n.addConnection(neuron2);
      // append it to the array of neurons
      neurons = (Neuron[])append(neurons, n);
    } else {
      // otherwise, add the other neuron as a connection 
      neurons[whichNeuron(neuron1)].addConnection(neuron2);
    }

    if (!neuronIsInArray(neuron2)) {
      Neuron n = new Neuron(neuron2, new PVector(random(width), random(height)));
      n.addConnection(neuron1);
      neurons = (Neuron[])append(neurons, n);
    } else {
      neurons[whichNeuron(neuron2)].addConnection(neuron1);
    }

  }
  
  //print the neuron name and its connected neurons
  for (Neuron n : neurons) {
    println("Neuron "+n.name+" connections:");
    for(String s : n.connections){
      print(s+" ");
    }
    println();
  }
  
}

// a function that checks if a candidate neuron is already in the list
boolean neuronIsInArray(String _name) {
  boolean foundNeuron = false;
  for (int i = 0; i < neurons.length; i++) {
    foundNeuron |= neurons[i].name.equals(_name);
  }
  return foundNeuron;
}

// returns the index associated with a name
int whichNeuron(String _name) {
  for (int i = 0; i < neurons.length; i++) {
    if (neurons[i].name.equals(_name)) return i;
  }
  return -1;
}


////////////////////////////////////////////////////////////////////////////////////////

void draw() {
}
