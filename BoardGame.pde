/*
Wenzhe Peng
 pwz@berkeley.edu
 */




Grid g;
Table table;
int si = 40;//size for each grid
PLine pl;

Button reset;
Button DrawRoad;
Button DrawBuilding;





void setup() {
  smooth();
  table = loadTable("landform.csv");
  int col = table.getColumnCount();
  int row = table.getRowCount();

  //println(table.getInt(0,0));
  g = new Grid(row, col, si*row, si*col);
  g.setBloV(table);

  reset = new Button(si*row+50, si*col-100, 100, 25, false, "RESET");
  DrawRoad = new Button(si*row+50, si*col-150, 100, 25, true, "DRAWROAD");
  DrawBuilding = new Button(si*row+50, si*col-200, 100, 25, true, "DRAWBUILDING");
  DrawRoad.setLink(DrawBuilding);

  size(si*row+200, si*col);




  pl = new PLine();
}

void draw() {
  background(200);
  g.draw();


  /*
  *****************************************************************
   DRAW ROAD CONTROL
   ****************************************************************
   */
  if (DrawRoad.state()) {

    Vector2d gv = g.onVertex(new Vector2d(mouseX, mouseY));//the vertex that mouse is on
    if (gv!=null) {
      gv.draw();

      if (mousePressed) {
        if (pl.ready()) {
          if (gv.disSQ(pl.getV(pl.size()-1))<(this.si*2)*(this.si*2))
            pl.add(gv);
        } else
          pl.add(gv);
      }
    }
  }


  /*
  *****************************************************************
   DRAW BUILDING CONTROL
   ****************************************************************
   */
  if (DrawBuilding.state()) {

    Vector2d gv = g.onVertex(new Vector2d(mouseX, mouseY));//the vertex that mouse is on

    g.onBlo(new Vector2d(mouseX, mouseY)).draw(255, 0, 0);
  }




  if (this.pl.ready()) {
    pl.draw();
  }


  /*
  *****************************************************************
   BUTTON SECTION
   ****************************************************************
   */


  if (reset.state()) pl.clear();

  reset.iterate();
  DrawRoad.iterate();
  DrawBuilding.iterate();
}



void keyPressed() {
  if (key == 's'||key == 'S') {//submit
  }
  if (key == 'c'||key == 'C') {//clear
  }
}

