# Final Project: Space Simulation

Yuanting (Iris) Chen  
05/13/19

## Project Explained

This final project was based on my midterm sketch, which used the particle system and array to create patterns of lines. From my pitch presentation, my goals for the final were to 

* 1) add texture to the patterns so it can create some sort of 3D effects;  
* 2) add sound to make it more dynamic; 
* 3) if I have enough time (and energy), use control P5 to make the sketch more interactive.

I completed the first two goals. Unfortunately, the third goal is too advanced and complicated for me to work on right now. 

**To add texture:**

Inspirated by teamLab's [Waves of light](https://www.teamlab.art/w/waves-of-light/), I added lines between the particles to make the movement more dynamic. 

**To add sound:**

The whole sketch somehow reminds me of space so I decided to import some space white noise to the background.

**To change the color:**

I used the lerpColor() function which changes from the original color to a new color at every 1.5 step. 


## Challenges

The two biggest challenges I had when working on this project were how to get the noise background and make the colors less flashy. 

**noise:**

It was very helpful to know the breakdown of how the noise is guiding the movement. I do think I need to work on it once again for a new sketch so that I know how to use it next time. 

**colors:**

I actually tried to add another class—TriWave()—to change the colors (_see Final 5. pde_). This method creates a fading effect.

For the final project submission, I actually used lerpColor() because I wanted to see if I can change the colors randomly over time. I'm glad that it's working smoothly.