/*
Wenzhe Peng
 pwz@berkeley.edu
 */

Grid g;
Table table;
int si = 40;//size for each grid

Button NextRoad;
Button DrawRoad;
Button NextBuilding;
Button DrawBuilding;

Button SAVEFILE;
Export ex;

ArrayList<PLine> plist = new ArrayList();//road list
PLine pl;//current drawing road
ArrayList<Building> blist = new ArrayList();//building list
Building building;//current drawing building


void setup() {
  smooth();
  table = loadTable("landform.csv");
  int col = table.getColumnCount();
  int row = table.getRowCount();

  //println(table.getInt(0,0));
  g = new Grid(row, col, si*row, si*col);
  g.setBloV(table);

  NextRoad = new Button(si*row+50, si*col-70, 130, 25, false, "NEXTROAD");
  DrawRoad = new Button(si*row+50, si*col-100, 130, 25, true, "DRAWROAD");
  NextBuilding = new Button(si*row+50, si*col-130, 130, 25, false, "NEXTBUILDING");
  DrawBuilding = new Button(si*row+50, si*col-160, 130, 25, true, "DRAWBUILDING");
  DrawRoad.setLink(DrawBuilding);
  SAVEFILE = new Button(si*row+50, si*col-40, 130, 25, false, "SAVEFILE");;
  
  size(si*row+200, si*col);

  pl = new PLine();
  building = new Building();
  
  ex = new Export(plist,blist,"");
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

      if (mousePressed && mouseButton ==LEFT) {
        if (pl.ready()) {
          if (gv.disSQ(pl.getV(pl.size()-1))<(this.si*2)*(this.si*2))
            pl.add(gv);
        } else
          pl.add(gv);
      }
    }
  }


  if (mousePressed && mouseButton ==RIGHT) {
    if (pl.ready()) {
      pl.pop();
    }
  }


  //draw roads
  if (this.pl.ready()) {
    pl.draw();
  }

  if (this.plist.size()>0) {
    for (PLine ll : plist) {
      ll.draw(0, 0, 255);
    }
  }

  /*
  *****************************************************************
   DRAW BUILDING CONTROL
   ****************************************************************
   */
  if (DrawBuilding.state()) {

    Blo b = g.onBlo(new Vector2d(mouseX, mouseY));

    if (b.inArea (new Vector2d(mouseX, mouseY))) {
      if (mousePressed && mouseButton ==LEFT) {
        this.building.add(b);
        
      }
    }
    if (mousePressed && mouseButton ==RIGHT) {
      this.building.pop();
    }


    this.building.draw(0, 0, 255);
    b.draw(255, 0, 0);
  }
  
  if (this.blist.size()>0) {
    for (Building bb : blist) {
      bb.draw(0, 0, 255);
    }
  }


  /*
  *****************************************************************
   BUTTON SECTION
   ****************************************************************
   */


  if (NextRoad.state()||DrawBuilding.state()) {//draw next road

    if (pl.ready()) {
      plist.add(pl);
    }
    pl = new PLine();
  }
  if (NextBuilding.state()||DrawRoad.state()) {//draw next building

    if (building.ready()) {
      blist.add(building);
    }
    building = new Building();
  }

  
    if(SAVEFILE.state()){
      ex.out();
      
      
    }
    
  NextRoad.iterate();
  NextBuilding.iterate();
  DrawRoad.iterate();
  DrawBuilding.iterate();
  SAVEFILE.iterate();
}



void keyPressed() {
}

