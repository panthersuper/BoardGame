/*
Wenzhe Peng
 pwz@berkeley.edu
 */

Grid g;
Table table;
int si = 40;//size for each grid
int col;
int row;

Button NextRoad;
Button DrawRoad;
Button NextBuilding;
Button DrawBuilding;
Button NextGrass;
Button DrawGrass;

Button SAVEFILE;
Export ex;

ArrayList<PLine> plist = new ArrayList();//road list
PLine pl;//current drawing road
ArrayList<Building> blist = new ArrayList();//building list
Building building;//current drawing building
ArrayList<Grassland> glist = new ArrayList();//grass list
Grassland grass;//current drawing building


void setup() {
  smooth();
  table = loadTable("landform.csv");
  col = table.getColumnCount();
  row = table.getRowCount();

  //println(table.getInt(0,0));
  g = new Grid(row, col, si*row, si*col);
  g.setBloV(table);

  NextRoad = new Button(si*row+50, si*col-70, 130, 25, false, "NEXTROAD");
  DrawRoad = new Button(si*row+50, si*col-100, 130, 25, true, "DRAWROAD");
  NextBuilding = new Button(si*row+50, si*col-130, 130, 25, false, "NEXTBUILDING");
  DrawBuilding = new Button(si*row+50, si*col-160, 130, 25, true, "DRAWBUILDING");
  NextGrass = new Button(si*row+50, si*col-190, 130, 25, false, "NEXTGRASS");
  DrawGrass = new Button(si*row+50, si*col-220, 130, 25, true, "DRAWGRASS");
  DrawRoad.setLink(DrawBuilding);
  DrawRoad.setLink(DrawGrass);
  DrawBuilding.setLink(DrawGrass);

  SAVEFILE = new Button(si*row+50, si*col-40, 130, 25, false, "SAVEFILE");
  ;

  size(si*row+400, si*col);

  pl = new PLine();
  building = new Building();
  grass= new Grassland();

  ex = new Export(plist, blist, glist, "");
}

void draw() {
  background(200);
  g.draw();




  /****************************************************************
   DRAW SAVED DATA
   ****************************************************************
   */

  if (this.glist.size()>0) {
    for (Grassland bb : glist) {
      bb.drawFrame(0, 255, 0);
    }
  }

  if (this.blist.size()>0) {
    for (Building bb : blist) {
      bb.drawFrame(0, 0, 255);
    }
  }

  /****************************************************************
   DRAW GRASS CONTROL
   ****************************************************************
   */


  if (DrawGrass.state()) {

    Blo b = g.onBlo(new Vector2d(mouseX, mouseY));

    if (b.inArea (new Vector2d(mouseX, mouseY))) {
      if (mousePressed && mouseButton ==LEFT) {
        this.grass.add(b);
      }
    }
    if (mousePressed && mouseButton ==RIGHT) {
      this.grass.pop();
    }


    this.grass.draw(0, 255, 0);
    b.draw(255, 0, 0);
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
      ll.draw();
    }
  }

  /*
  *****************************************************************
   BUTTON SECTION
   ****************************************************************
   */


  if (NextRoad.state()||DrawBuilding.state()||DrawGrass.state()) {//draw next road

    if (pl.ready()) {
      plist.add(pl);
    }
    pl = new PLine();
  }
  if (NextBuilding.state()||DrawRoad.state()||DrawGrass.state()) {//draw next building

    if (building.ready()) {
      blist.add(building);
    }
    building = new Building();
  }
  if (NextGrass.state()||DrawRoad.state()||DrawBuilding.state()) {//draw next grass

    if (grass.ready()) {
      glist.add(grass);
    }
    grass = new Grassland();
  }

  if (SAVEFILE.state()) {
    if (pl.ready()) {
      plist.add(pl);
    }
    pl = new PLine();
    if (building.ready()) {
      blist.add(building);
    }
    building = new Building();
    if (grass.ready()) {
      glist.add(grass);
    }
    grass = new Grassland();

    ex.out();
  }


  /*
  *****************************************************************
   STATS
   ****************************************************************
   */
  pushStyle();
  int bnum = 0;
  for (Building b : blist) {
    bnum += b.gridList.size();
  }
  int gnum = 0;
  for (Grassland g : glist) {
    gnum += g.gridList.size();
  }

  text("Building Number: "+blist.size(), si*row+30, 50);
  text("Building Grid Number: "+bnum, si*row+30, 70);
  text("Grass Number: "+glist.size(), si*row+30, 90);
  text("Grass Grid Number: "+gnum, si*row+30, 110);

  stroke(255);
  line(si*row+200,0,si*row+200,height);
  
  //rules
  text("Road", si*row+210, 50);
  text("Make sure each grid have a max ", si*row+210, 70);
  text("distance of 4 to road", si*row+210, 85);
  text("Draw it as flat as possible", si*row+210, 100);
  text("Building", si*row+210, 130);
  text("Consists of same height grids", si*row+210, 150);
  text("Draw each Building next to Road", si*row+210, 165);
  text("Can't go over Road", si*row+210, 180);
  text("Grass", si*row+210, 210);
  text("Consists of same height grids", si*row+210, 230);
  text("Place Only near Building", si*row+210, 245);
  text("Place not upon Grass", si*row+210, 260);
  text("Goal", si*row+210, 290);
  text("To place as much building and ", si*row+210, 310);  
  text("grass for each move as possible", si*row+210, 325);

  text("Wenzhe Peng @ Studio One", si*row+210, si*col-15);

  popStyle();



  /*
  *****************************************************************
   LOOP
   ****************************************************************
   */
  println(building.gridList.size());
  NextRoad.iterate();
  NextBuilding.iterate();
  DrawRoad.iterate();
  DrawBuilding.iterate();
  SAVEFILE.iterate();
  NextGrass.iterate();
  DrawGrass.iterate();
}



void keyPressed() {
}

