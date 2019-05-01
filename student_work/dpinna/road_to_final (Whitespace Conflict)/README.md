##Final project write-up

For my final project, I am going to implement a user interface (UI) to help users configure and set up the game I created for my midterm. 

The interface is going to leverage the 3D capabilities offered by p5js and WebGL. The UI is going to be placed into four planes - like a stage that is in charge to introduce the game. 

The four planes are a part of an open cube: the camera is going to show the first right in front of the user, and if they click on it, they will start the game. The right, left and bottom planes offer one option each and users can either interact directly with them or rotate the camera (or the open cube itself) towards the selected face and the interact with it.

The options available are: 

- select speed/difficulty;
- choose music on/off;
- switch between colors or b/w;

Each option will have a hover status, to indicate to users whether the option is ready to be interacted on. The UI status will also immediately change to present whether the user's request has been processed. No error status is included in this deliverable. 

Once users have made the needed changes, they can select 'play game' and start the gameplay.

