class Grid {

  int x;// number
  int y;// number
  double w;// total width
  double h;// total height
  double ww;// width for unit
  double hh;// height for unit
  Blo[][] blos;//blocks as a matrix

  Grid(int x, int y, double w, double h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.ww = w / x;
    this.hh = h / y;
  }

  int[] onGrid(double mx, double my) {
    // mouseX,mouseY
    int numX = (int) Math.floor(mx / ww);
    int numY = (int) Math.floor(my / hh);
    int[] lst = new int[2];
    lst[0] = numX;
    lst[1] = numY;

    return lst;
  }

  void drawOn(double mx, double my) {
    int[] lst = onGrid(mx, my);

    pushStyle();
    fill(178);
    rect((float) (lst[0]*ww), (float) (lst[1]*hh), (float) ww, (float) hh);
    popStyle();
  }

  void draw() {

    pushStyle();

    for (int i = 0; i < x; i++) {
      for (int j = 0; j < y; j++) {
        rect((float) (i*ww), (float) (j*hh), (float) ww, (float) hh);
      }
    }
        popStyle();

  }
}
