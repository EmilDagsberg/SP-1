int triangleValues[][] = {  // I wanted to try to store a bunch of values into a double array. Probably not more readable, but I just wanted to experiment a little.
  {0, 750, 1500, 750, 750, 100}, // All these values are used for all the instances of the Mountain class.
  {-500, 750, 900, 750, 375, 250},
  {750, 750, 1900, 750, 1100, 250},
  {630, 200, 870, 200, 750, 100},
  {285, 300, 430, 300, 375, 250},
  {1060, 300, 1185, 300, 1100, 250}
};

// Instances of my Mountain class
Mountain mountains1;
Mountain mountains2;
Mountain mountains3;
Mountain Snow1;
Mountain Snow2;
Mountain Snow3;

Sun mySun = new Sun();// Instance for my Sun class

Cloud[] myClouds = new Cloud [3]; // Instance for my Cloud class, which I made into an array, because this was an easy way to use it here. Each Cloud instance just need to start at a different x position. 

// Instances for my Surface class
Surface ground1 = new Surface(-1, 550, 651, 300, color(5, 160, 57)); 
Surface ground2 = new Surface(849, 550, 651, 300, color(5, 160, 57));
Surface ground3 = new Surface(1499, 550, 651, 300, color(4, 160, 57));

// Instance for my Surface class, where it displays the black hole obstacle
Surface obstacle = new Surface(-1, 550, 651, 300, color(5, 160, 57)); // 

// Instance for my Buu class
Buu player = new Buu();



void setup() {
  size(1500, 750);
  // Mountains for the background // To make it less ugly (slightly) for using many randon numbers, i am calling calling back to my double array.  
  mountains1 = new Mountain(triangleValues[0][0], triangleValues[0][1], triangleValues[0][2], triangleValues[0][3], triangleValues[0][4], triangleValues[0][5]);
  mountains2 = new Mountain(triangleValues[1][0], triangleValues[1][1], triangleValues[1][2], triangleValues[1][3], triangleValues[1][4], triangleValues[1][5]);
  mountains3 = new Mountain(triangleValues[2][0], triangleValues[2][1], triangleValues[2][2], triangleValues[2][3], triangleValues[2][4], triangleValues[2][5]);
  // Used my Mountain object to make tiny white "mountains" to simulate snow on the mountaintop
  Snow1 = new Mountain(triangleValues[3][0], triangleValues[3][1], triangleValues[3][2], triangleValues[3][3], triangleValues[3][4], triangleValues[3][5]);
  Snow2 = new Mountain(triangleValues[4][0], triangleValues[4][1], triangleValues[4][2], triangleValues[4][3], triangleValues[4][4], triangleValues[4][5]);
  Snow3 = new Mountain(triangleValues[5][0], triangleValues[5][1], triangleValues[5][2], triangleValues[5][3], triangleValues[5][4], triangleValues[5][5]);

  // Loop that goes through each instance in my Cloud array, where it changes the started the start x-position in each instance.
  for (int i = 0; i < myClouds.length; i++) {
    myClouds[i] = new Cloud(i*width/3, 50, 200, 70, color(255));
  }
}

void draw() {
  background(13, 188, 255);

  mountains1.display();
  mountains2.display();
  mountains3.display();

  Snow1.displaySnow();
  Snow2.displaySnow();
  Snow3.displaySnow();

  mySun.displaySun();

  // A loop so it calls the methods in each instance of the Cloud class through the array.
  for (int i = 0; i < myClouds.length; i++) {
    myClouds[i].displayCloud();
    myClouds[i].moveClouds();
  }
  
  ground1.displayGround();
  ground2.displayGround();
  ground3.displayGround();

  ground1.moveGround();
  ground2.moveGround();
  ground3.moveGround();

  obstacle.displayBlackSquares();

  player.displayBuu();
  player.makeBuuRun();
  player.makeBuuJump();
}
