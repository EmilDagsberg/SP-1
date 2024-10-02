class Surface {
  int rectX;
  int rectY;
  int rectW;
  int rectH;
  color c;
  int x = 650;
  int y = 550;
  int w = 200;
  int h = 5;

  Surface(int tempX, int tempY, int tempW, int tempH, color tempC) {
    rectX = tempX;
    rectY = tempY;
    rectW = tempW;
    rectH = tempH;
    c = tempC;
  }

  void displayGround() {
    fill(c);
    rectMode(CORNER);
    rect(rectX, rectY, rectW, rectH);
  }

  void displayBlackSquares() {
    int y = 550;
    int w = 200;
    int h = 5;
    int op = 0;
    int squareState = 0;
    while (y < height) { // The "Black sqaures" are multiple squares that I make with this loop. It also helps me so I can slowly increase the opacity, which gives a nice effect.
      fill(0, 0, 0, op);
      noStroke();
      rect(x, y, w, h);
      y+=5;
      op+=10;
    }
    if (squareState == 0) { // Simple if-statement to keep making my surface rectangles move indefinitely. 
      x -= 5;
      if (x < 0-649) { // An if statement, so when my surface blocks make it to a specific point they will move to end of my canvas.
        x = 1500;
      }
    }
  }


  void moveGround() {
    int state = 0;
    if (state == 0) { // Again an if-statement to make the surface move. 
      rectX -= 5;
      if (rectX < 0-649) { // An if statement, so when my surface blocks make it to a specific point they will move to end of my canvas.
        rectX = 1500;
      }
    }
  }
}
