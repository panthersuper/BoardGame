Grid g;
Table table;
int si = 40;//size for each grid

void setup() {
  smooth();
  table = loadTable("landform.csv");
  int col = table.getColumnCount();
  int row = table.getRowCount();
  
  println(table.getInt(0,0));
  g = new Grid(row, col, si*row, si*col);
  size(si*row, si*col);

}

void draw() {
  g.draw();
  g.onBlo(new Vector2d(mouseX, mouseY)).draw(0, 0, 0);
}







class Blo {

  int x;//x coodinate
  int y;//y coodinate
  double w;//width for a unit
  double h;//height for a unit
  Vector2d l_t;//each vertex for the block
  Vector2d l_b;//each vertex for the block
  Vector2d r_t;//each vertex for the block
  Vector2d r_b;//each vertex for the block
  int value;//the layer value of this block


  Blo(int x, int y, double w, double h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.l_t = new Vector2d(x*w, y*h);
    this.l_b = new Vector2d(x*w, y*h+h);
    this.r_t = new Vector2d(x*w+w, y*h);
    this.r_b = new Vector2d(x*w+w, y*h+h);
    this.value = 0;
  }
  
  void setValue(int v){
    this.value = v;
  }

  void draw() {
    pushStyle();
    fill(200);
    stroke(255);
    strokeWeight(2.5f);
    rect((float)(x*w), (float)(y*h), (float)w, (float)h);
    stroke(0);
    strokeWeight(1.5f);
    float r = 5;
    ellipse((float)l_t.x, (float)l_t.y, r, r);
    ellipse((float)l_b.x, (float)l_b.y, r, r);
    ellipse((float)r_t.x, (float)r_t.y, r, r);
    ellipse((float)r_b.x, (float)r_b.y, r, r);
    fill(100);
    text(value, (float)(x*w+w/2-3), (float)(y*h+h/2+5));
    popStyle();
  }
  
  void draw(int r, int g, int b) {
    pushStyle();
    fill(r, g, b);
    rect((float)(x*w), (float)(y*h), (float)w, (float)h);
    fill(255);
    ellipse((float)l_t.x, (float)l_t.y, 3, 3);
    ellipse((float)l_b.x, (float)l_b.y, 3, 3);
    ellipse((float)r_t.x, (float)r_t.y, 3, 3);
    ellipse((float)r_b.x, (float)r_b.y, 3, 3);
    popStyle();
  }
}

class Blos{
 //an abstract class that handles a collection of blos that are ajacent woth each other 
  ArrayList gridList = new ArrayList();;
  

}
class Building extends Blos{
  //building defined by consecutive blocks
  
  Building(ArrayList lst){
    
    
    
  }
  
  
  
  
  
}
class Grassland extends Blos{
    //grassland defined by consecutive blocks

    Grassland(ArrayList lst){
    
    
    
  }
  
  
  
  
}
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


  void setBloV(Table table){
    //set the value of each block
    
    
    
    
    
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

class PLine{
  
  
  
  
  
}
class Road{
  //road defined by a polyline
  
  
  
  
}
class Vector2d {
  double x;
  double y;

  Vector2d(double x, double y) {
    this.x = x;
    this.y = y;
  }

  double getX() {
    return this.x;
  }
  double getY() {
    return this.y;
  }
  void setX(double x){
    this.x = x;
  }
  void setY(double y){
    this.y = y;
  }
}


