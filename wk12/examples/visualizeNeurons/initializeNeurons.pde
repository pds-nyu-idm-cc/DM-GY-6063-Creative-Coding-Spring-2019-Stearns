void initializeNeurons(){
  
  data = loadTable("neurodata.txt", "tsv"); // tsv means the data is tab delimited (separated by tabs)
  
  // iterate through the table and create a Neuron for each unique one encountered
  for (TableRow row : data.rows()) {
    
    //Neuron names are given in the 1st and 2nd columns
    String neuron1 = row.getString(0);
    String neuron2 = row.getString(1);
 
    if (!neuronIsInArray(neuron1)) {
      Neuron n = new Neuron(neuron1);
      n.addConnection(neuron2);
      neurons = (Neuron[])append(neurons, n);
    } else {
      Neuron n = neurons[whichNeuron(neuron1)];
      n.addConnection(neuron2);
    }

    if (!neuronIsInArray(neuron2)) {
      Neuron n = new Neuron(neuron2);
      n.addConnection(neuron1);
      neurons = (Neuron[])append(neurons, n);
    } else {
      Neuron n = neurons[whichNeuron(neuron2)];
      n.addConnection(neuron1);
    }

  }
  
  // arrange neurons in a circle and set their fillcolor
  for(int i = 0 ; i < neurons.length; i++){
    float y = (width/2) + (width/2.5)*sin(i*(2*PI/neurons.length));
    float x = (height/2) + (height/2.5)*cos(i*(2*PI/neurons.length));
    neurons[i].position = new PVector(x,y);
    neurons[i].fillColor = color( 255*i/(neurons.length-1), 255, 255, 10); 
  }

  //for (Neuron n : neurons) {
  //  println("Neuron "+n.name+" connections:");
  //  for(String s : n.connections){
  //    print(s+" ");
  //  }
  //  println();
  //}
  
}

////////////////////////////////////////////////////////////////////////////////////////
//HELPER FUNCTIONS

// a function that checks if a candidate neuron is already in the list
boolean neuronIsInArray(String _name) {
  boolean foundNeuron = false;
  for (int i = 0; i < neurons.length; i++) {
    foundNeuron |= neurons[i].name.equals(_name);
  }
  return foundNeuron;
}

// this functions returns the index associated with a name
int whichNeuron(String _name) {
  for (int i = 0; i < neurons.length; i++) {
    if (neurons[i].name.equals(_name)) return i;
  }
  return -1;
}
