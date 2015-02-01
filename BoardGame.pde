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
  g.setBloV(table);
  size(si*row, si*col);

}

void draw() {
  g.draw();
  g.onBlo(new Vector2d(mouseX, mouseY)).draw(0, 0, 0);
}







