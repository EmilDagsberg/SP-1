class Mountain {
  int x1;
  int y1;
  int x2;
  int y2;
  int x3;
  int y3;

  Mountain(int tempX1, int tempY1, int tempX2, int tempY2, int tempX3, int tempY3) {
    x1 = tempX1;
    y1 = tempY1;
    x2 = tempX2;
    y2 = tempY2;
    x3 = tempX3;
    y3 = tempY3;
  }

  void display() {
    fill(155, 104, 37);
    noStroke();
    triangle(x1, y1, x2, y2, x3, y3);
  }

  void displaySnow() {
    fill(255);
    triangle(x1, y1, x2, y2, x3, y3);
  }
}
