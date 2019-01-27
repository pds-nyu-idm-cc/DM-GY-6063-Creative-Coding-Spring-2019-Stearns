println("Hello world!");

/*

The code above isn't technically a program, but it is code.
Press run and it prints text to the Processing console.

println() is a function. Functions are blocks of code
that take arguments and do different things.

Processing is programmed in Java and uses many functions
to make complicated tasks simple.

This is what is known as a high level programming language.

Our println() function takes a String data type as an
argument and prints it to the console followed by a line break.
print() does the same but without the line break.

*/

// some different approaches to declaring and initializing String variables


String reply1;
reply1 = "World says, ";
print(reply1);

// In order to include " we need to escape it with \ hence \"
String reply2 = new String("\"Hi!\"");
println(reply2);

// We can concatonate strings using the + symbol
String reply3 = reply1+reply2;
// Strings also have a few handy methods
// See https://processing.org/reference/String.html for more
// Below we use a for loop to print each char to the console
for(int i = 0 ; i < reply3.length() ; i++){
  print(reply3.charAt(i));
}
println();

// Why on earth would you do this?!
char[] chars = {'T','h','i','s',' ','i','s',' ','a',' ','S','t','r','i','n','g','.'};
String string = new String(chars);
for(int i = 0 ; i < string.length() ; i++){
  print(string.charAt(i));
}
println();
