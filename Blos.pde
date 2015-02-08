/*
Wenzhe Peng
 pwz@berkeley.edu
 */

class Blos {
  //an abstract class that handles a collection of blos that are ajacent woth each other 
  ArrayList<Blo> gridList = new ArrayList();
  ;
  int limit;


  void add(Blo bl) {
    if (!oversize() && !this.gridList.contains(bl)) {
      if (this.gridList.size()==0) {
        Blo bbl = bl.copy();
        this.gridList.add(bbl);
        bbl.addValue();
        bl.addValue();
      } else if (this.near(bl) && this.gridList.get(0).value - 1 == bl.value) {
        Blo bbl = bl.copy();
        this.gridList.add(bbl);
        bbl.addValue();
        bl.addValue();
      }
    }
  }

  boolean ready() {
    if (this.gridList.size()>0)
      return true;
    else return false;
  }

  boolean near(Blo b) {
    int count = 0;
    for (Blo bb : this.gridList) {
      if (bb.near(b)) count++;
    }
    if (count > 0) return true;
    else return false;
  }


  void pop() {
    if (this.gridList.size()>0)
      this.gridList.remove(this.gridList.size()-1);
  }

  boolean oversize() {
    if (this.gridList.size()>limit)
      return true;
    else
      return false;
  }
  void draw(int rr, int gg, int bb) {
    for (Blo b : this.gridList) {
      b.draw(rr, gg, bb);
    }
  }
}

