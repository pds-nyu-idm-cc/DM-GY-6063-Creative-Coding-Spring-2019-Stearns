// A tiny primer on classes
// Classes are a fundamental of object oriented programming.
//
// In the world, objects are things that have properties and behaviors
// and are calssified base on these.
//
// In programming, objects are also things that have properties, called Fields,
// and behaviors, called methods. Objects are members of a class. 
//
// Each time an Object is declared, an instance of it is created
// These instances must be initialized. Constuctors determine how this is done.
//
// To invoke internal fields and methods, one unses the name of the instance
// followed by a "." and then the field or method.
//
// MyClass.field = "You can assign..."
// println(MyClass.field+" as well as access fields");
// and call methods:
// MyClass.printField()

// create an instance of a MyClass object
MyClass objectInstance;

void setup() {
  
  size(200,200);
  
  //initialize out MyClass instance, objectInstance
  objectInstance = new MyClass();
  
  noLoop();
  
}

void draw(){
  
  objectInstance.printField();
  objectInstance.field="Fields can be changed and retrieved.";
  println(objectInstance.field);
  //calling methods is a lot like retrieving fields
  objectInstance.printSomeNumbers();
  objectInstance.sortSomeNumbers();
  objectInstance.printSomeNumbers();
  
}


// define the class, MyClass. Notice there are no ()!
class MyClass{
  
  // fields
  
  // these are declared just like variables and their scope
  // is contained within their location in the class
  String field;
  float aValue;
  int[] someNumbers;
  
  // constructors
  
  // describe how an instance is initialized
  MyClass(){
    // can have a default initialization
    field="Fields are properties an object possesses.";
    aValue=0; // they can be hard coded in the constructor
    someNumbers = new int[10];
    randomizeSomeNumbers();
  }
  
  MyClass(String _name, float _size, int _qty){
    // or allow for different fields to be initialized
    field=_name;
    aValue=_size;
    someNumbers = new int[_qty];
  }
  
  // methods
  
  // are functions that are "built-in" to the class,
  // and can be invoked on the objectInstance
  void randomizeSomeNumbers(){
    for(int i = 0 ; i < someNumbers.length; i++){
      someNumbers[i]=int(random(someNumbers.length));
    }
  }

  void sortSomeNumbers(){
    someNumbers=sort(someNumbers);
  }
  
  void printField(){
    println(field);
  }
  
  void printSomeNumbers(){
    print("someNumbers={");
    for(int i = 0 ; i < someNumbers.length ; i++){
      print(someNumbers[i]);
      if(i < someNumbers.length-1) print(", ");
    }
    println("}");
  }
}
