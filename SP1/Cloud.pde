class Cloud {
  color c;
  int x;
  int y;
  int w;
  int h;

  Cloud(int tempX, int tempY, int tempW, int tempH, color tempC) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempC;
  }

  void displayCloud() {
    fill(c);
    noStroke();
    saturation(150);
    ellipse(x, y, w, h);
  }

  void moveClouds() {
    int speed = 1;
    int state = 0;
    if (state==0) { // Simple if statement to make the clouds move indefinitely
      x = x + speed;
      if (x > width+100) { // If stament to move the clods back when they go further than width+100.
        x = -100;
      }
    }
  }
}
