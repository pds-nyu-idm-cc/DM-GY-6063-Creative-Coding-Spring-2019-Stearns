/**
 A sketch to demonstrate the use of Table to work with external datasets
 
 Table allows you to create or import, modify and export data with multiple rows and columns
 Table and TableRow are used here to import the data of neuron connections of the c. elegans worm
 */

// create a Table to hold data
Table connections; // https://processing.org/reference/Table.html

// create list to store neuron names
String[] neuronList = new String[0]; // creates an empty 0 element array

// IntDict allows us to store numbers indexed by their name
IntDict connectionCount = new IntDict();

void setup() {
  size(10, 10);

  //load data into the table
  connections = loadTable("neurodata.txt", "tsv"); // tsv means the data is tab delimited (separated by tabs)

  // demonstration of a short hand way to iterate through a table and print its contents
  for (TableRow connection : connections.rows()) {
    String row = new String();
    for (int i = 0; i < connection.getColumnCount(); i++) {
      row+=connection.getString(i)+"  ";
    }
    println(row);
  }

  // demonstration of a long hand way to iterate through a table
  for (int i = 0; i < connections.getRowCount(); i++) {
    TableRow connection = connections.getRow(i);
    // create a list of unique neurons
    for (int j = 0; j < 2; j++) {
      // if the neuron isn't in our list, add it
      String neuron = connection.getString(j);
      if (!neuronIsInList(neuronList, neuron)) {
        neuronList = append(neuronList, neuron);
        connectionCount.set(neuron, 1);
      } else {
        connectionCount.increment(neuron);
      }
    }
  }

  // let's see what we got!
  for (int i = 0; i < neuronList.length; i++) {
    println(neuronList[i]+"\t"+connectionCount.get(neuronList[i]));
  }
}

// made a function that will quick check if a candidate neuron is already in the list
boolean neuronIsInList(String[] _list, String _neuron) {
  boolean foundNeuron = false;
  for (int i = 0; i < _list.length; i++) {
    foundNeuron |= _list[i].equals(_neuron);
  }
  return foundNeuron;
}
