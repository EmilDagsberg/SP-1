class Sun {
  color c = color(255, 244, 15);
  int x = width/2;
  int y = 0;
  int w = 250;
  int h = 250;

  Sun () {
  }

  void displaySun() {
    fill(c);
    saturation(150);
    ellipse(x, y, w, h);
  }
}
