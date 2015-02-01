class PLine {
  ArrayList<Vector2d> VList;

  PLine() {
    this.VList = new ArrayList();
  }

  PLine(ArrayList<Vector2d> VList) {
    this.VList = VList;
  }

  void add(Vector2d v) {
    VList.add(v);
  }

  Vector2d getV(int i){
  return this.VList.get(i);    
  }
  
  int size(){
   return this.VList.size(); 
  }
  
  boolean ready() {
    if (this.VList.size()>0) return true;
    else return false;
  }

  void draw() {
    pushStyle();
    noFill();
    stroke(255,0,0);
    strokeWeight(3);
    beginShape();
    
    
    
    for (Vector2d v:VList){
          vertex((float)v.x, (float)v.y);

    }
    endShape();

    popStyle();
  }
}

