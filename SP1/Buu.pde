class Buu {
  // All my variables for y-positions that are connected with displaying my Buu character, has them related to bodyY, so when bodyY's y-postion changes, so does every other part.  
  // Body
  int bodyX = 200;
  int bodyY = 460;
  int bodyW = 60;
  int bodyH = 80;

  // Head
  int headX = bodyX;
  int headW = bodyW + 15;
  int headH = bodyH - 5;

  // End of antennas
  int hornsX1 = bodyX - 20;
  int hornsX2 = bodyX + 20;
  int hornsW = bodyW - 50;
  int hornsH = bodyH - 70;

  // Eye variables
  int eyeX1 = bodyX;
  int eyeX2 = bodyX + 25;
  int eyeW = bodyW - 40;
  int eyeH = bodyH - 54;

  float eyeR;
  float eyeG;
  float eyeB;

  boolean buuJumping = false; // Variable to check if Buu is jumping (true) or not (false)
  int jumpHeight = 175; // // Variable for how much Buu's y-position changes when he jumps.
  int jumpSpeed = 4; // // Variable for how fast the jumping is.
  int originalY = bodyY; // A new variable to remember the original y-position. Thought it would be a more readable to have a different named variable for my jumping method.
  boolean Up = true; // Variable to help make Buu go from going up in the air, to coming down again. 
  
   // Walking animation variables
  int legMoveOffset = 0; // Variable to see how out of line the position is from the orginal y-postion
  int legMoveUpOrDown = 1; // Variable to make the legs go either down or up 
  int legMoveSpeed = 2; // Speed of the leg movement
  int legMoveMax = 10; // Variable for the maximum distance that the y-postion for the leg will move.




  Buu() {
  }

  void displayBuu() {
    //Buu's body
    rectMode(CENTER);
    stroke(0);
    fill(#F70FEC);
    rect(bodyX, bodyY, bodyW, bodyH);

    //Buu's head
    int headY = bodyY - 80;
    fill(#0BDB5C);
    ellipse(headX, headY, headW, headH);

    // Buu's antennas
    stroke(6);
    line(bodyX - 10, bodyY - 120, bodyX - 20, bodyY - 150);
    line(bodyX + 10, bodyY - 120, bodyX + 20, bodyY - 150);

    // The end of Buu's antennas
    int hornsY = bodyY - 150;
    fill(#0BDB5C);
    ellipse(hornsX1, hornsY, hornsW, hornsH);
    ellipse(hornsX2, hornsY, hornsW, hornsH);

    // Buu's eyes
    int eyeY = bodyY - 80;
    eyeR = random(255);
    eyeG = random(255);
    eyeB = random(255);
    fill(eyeR, eyeG, eyeB);
    ellipse(eyeX1, eyeY, eyeW, eyeH);
    ellipse(eyeX2, eyeY, eyeW, eyeH);

    // Buu's arms
    strokeWeight(7);
    stroke(0);
    line(bodyX - 30, bodyY - 10, bodyX - 80, bodyY - 40);
    line(bodyX + 30, bodyY - 10, bodyX + 80, bodyY - 40);
    
   

    // Buu's legs
    strokeWeight (6);
    stroke(0);
    // LegMoveOffset is added to Buu's arms and and feet, so their y-position will change, when i call on the upcoming method 
    line(bodyX - 20, bodyY + 40, bodyX - 30, bodyY + 90+ legMoveOffset); 
    line(bodyX + 20, bodyY + 40, bodyX + 30, bodyY + 90 - legMoveOffset);
    
     
    // Buu's feet
    line(bodyX - 30, bodyY + 90 + legMoveOffset, bodyX, bodyY + 90 + legMoveOffset);
    line(bodyX + 30, bodyY + 90 - legMoveOffset, bodyX + 60, bodyY + 90 - legMoveOffset);
  }



  void makeBuuRun() {
    if (!buuJumping) { // I'm starting by making this if statement, so it ensures that Buu's legs will only move when he is NOT jumping.
      legMoveOffset += legMoveUpOrDown * legMoveSpeed; // legMoveUpOrDown is getting added to legMoveOffset times legMoveSpeed(to determine how fast it happens) so the y-postion increases 
      
      if (legMoveOffset > legMoveMax || legMoveOffset < -legMoveMax) { // if the y-position goes further than legMoveMax, legMoveUpOrDown is multiplied by -1, so the direction reverses (1* -1 = -1) (-1 * -1 = 1).
        legMoveUpOrDown *= -1;
      }
    }
  }
    
  void makeBuuJump() {
    if (obstacle.x < bodyX + bodyW + 50 && obstacle.x + obstacle.w > bodyX - bodyW / 2 && !buuJumping) { // This if checks if my blackSquares (obstacle) is close to Buu. The reason for writing !buuJumping, is to make sure Buu is not in the middle of a jump.
      buuJumping = true;
    }
    if (buuJumping) {
      if (Up) { // This part makes Buu jump. If the above statement is true. Buu will decrease his y in a set speed, so it looks like he jumps. Then a Up is set to false, so it can begin making Buu land again,
        bodyY -= jumpSpeed;
        if (bodyY <= originalY - jumpHeight) {
          Up = false; // Up is set to false, so next time it looks that above if statement, it will jump down to the else instead.
        }
      } else {
        bodyY += jumpSpeed; // His y position increases, so he goes down again. The below statement is set so he doesn't go below his original y position.
        if (bodyY >= originalY) {
          bodyY = originalY;
          buuJumping = false; // Set to false. So Buu stops jumping. So he only makes one jump.
          Up = true; // Set to true. So he is ready to do this whole code again, Ergo to make another jump.
        }
      }
    }
  }
}
