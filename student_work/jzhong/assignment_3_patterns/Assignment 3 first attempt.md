### Assignment 3 first attempt

I was planning to duplicate this wall drawing on Processing:

![wallDrawing](https://massmoca.org/wp-content/uploads/2015/12/1260-1.jpg)<br> [Link to Original Website] (https://massmoca.org/event/walldrawing1260/)

I was able to imitate the change of color from the outside of the square to the middle where the color graduately turned white, but couldn't figure out the math to do the middle half.

I used a forLoop, but couldn't figure out the reverse.

```
for (float x = 100, a = 300, c = 0, m = 1; c<225; x++, a-=2, m+=5) {
    c=abs(m);
    stroke(c);
    strokeWeight(2);
    rect(x, x, a, a, 30);
    //c=(c-m); 
    println("color: "+c);
    println("a = "+a);
  }
```
* the reason I have both m and c value is because I was trying to use a "c=m^2"`c=sq(m)`function, so that the change of the color is not linear.
  
  