Grid g;
Table table;
int si = 40;//size for each grid
PLine pl;
int mouse=0;

void setup() {
  smooth();
  table = loadTable("landform.csv");
  int col = table.getColumnCount();
  int row = table.getRowCount();

  //println(table.getInt(0,0));
  g = new Grid(row, col, si*row, si*col);
  g.setBloV(table);
  size(si*row+200, si*col);




  pl = new PLine();
}

void draw() {
  g.draw();
  Vector2d gv = g.onVertex(new Vector2d(mouseX, mouseY));//the vertex that mouse is on


  if (gv!=null) {
    gv.draw();

    if (mouse==1) {
      mouse = 0;
      if (pl.ready()) {
        if (gv.disSQ(pl.getV(pl.size()-1))<(this.si*2)*(this.si*2))
          pl.add(gv);
      } else
        pl.add(gv);
    }
  } 
  
  
  else {
    g.onBlo(new Vector2d(mouseX, mouseY)).draw(255, 0, 0);
  }

  if (this.pl.ready()) {
    pl.draw();
  }
}

void mouseReleased() {
  if (mouse == 0) {
    mouse = 1;
  }
}

void keyPressed(){
  if(key == 's'||key == 'S'){//submit
    
    
    
  }
  if(key == 'c'||key == 'C'){//clear
    
    
    
  }
}

