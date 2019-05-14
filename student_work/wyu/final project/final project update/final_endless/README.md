#The Endless Reclamation

##Introduction

This project is a game, which idea is from a traditional Chinese Legend called Jingwei.

##Idea
The Legend of Jingwei captures a moment of defiance in the face of impossible odds. 

A young girl drowns but re-emerges as **Jingwei**, a bird who’s determined to fill the Eastern Sea with twigs and pebbles. Despite ridicule from the sea, Jingwei stands boldly to complete her quest so others will not suffer her fate.

##The UI Designs of the Game
###Start screen
![](wyu_images/ui1.png)

###Play Screen
![](wyu_images/ui2.png)

###End Screen

![](wyu_images/ui3.png)

##Logic of the Game

* The player using **keys** to control the bird  
* Drop one **stone** to get one **scores**
* **Three lifes**
* Touch **lightning** lose one **life**
* Touch **sea** and then **game over**
* At the **end** of game will show the **scores**



##Control Button
* Using `w`and `s` to make the bird to move upward and downward.
* **Clicking** around the bird to drop the **stones** in the sea.
* Avoiding the **lightning**⚡️ to keep the bird fly
* Avoiding touching the **sea**

##Challenges
The challenge of building this game is using terrain to build the terrain and add the lightning as obstacles for the bird.

###Terrain
It is my first time to use `noise` to build the terrain, I spent a lot of time in appearciating others' artwork and finding the instructions of the perlin noise.

###Lightning
Using `ArrayList` to add obstacles is the most **difficult** challenge for me. I had to control the variables to make **collision** and **disappear**, and use the functions of `tubes.add()` and `tubes.remove()`, which requires me to have a good **logic** of the game to set the functions in the right place.



