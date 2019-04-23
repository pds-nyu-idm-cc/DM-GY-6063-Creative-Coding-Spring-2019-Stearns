Table coordinates;

void setup(){ 
coordinates = loadTable("coordinates.lst" ,"csv");
  println(coordinates.getRowCount() + " total rows in table"); 
  for (TableRow coordinate : coordinates.rows()) {   
    println("x: "+coordinate.getInt(0)+", y: "+coordinate.getInt(1));
  }
}
