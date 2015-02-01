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
    blos = new Blo[x][y];

      for(int i = 0; i<x; i++) {
      for(int j=0; j<y; j++) {
        blos[i][j] = new Blo(i, j, this.ww, this.hh);
      }
    }
  }


  Blo onBlo(Vector2d pos) {
    //return the block which the pos is on
    double mx = pos.getX();
    double my = pos.getY();
    int numX = (int) Math.floor(mx / ww);
    int numY = (int) Math.floor(my / hh);
    int[] lst = new int[2];

    return this.blos[numX][numY];
  }

  void drawOn(Vector2d pos) {
    //draw the block which the pos is on
    Blo b = onBlo(pos);
    
    b.draw();
  }

  void draw() {

    pushStyle();
    for (int i = 0; i < x; i++) {
      for (int j = 0; j < y; j++) {
        blos[i][j].draw();
      }
    }
    popStyle();
  }
}

