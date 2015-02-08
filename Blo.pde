/*
Wenzhe Peng
 pwz@berkeley.edu
 */

class Blo {

  int x;//x coodinate
  int y;//y coodinate
  double w;//width for a unit
  double h;//height for a unit
  Vector2d l_t;//each vertex for the block
  Vector2d l_b;//each vertex for the block
  Vector2d r_t;//each vertex for the block
  Vector2d r_b;//each vertex for the block
  Vector2d center;//the center of this block
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
    this.center = new Vector2d(x*w+w/2,y*h+h/2);
    this.value = 0;
  }

  void setValue(int v) {
    this.value = v;
  }
  
  void addValue(){
    this.value ++;
    
  }

  Blo copy(){
    Blo b = new Blo(this.x,this.y,this.w,this.h);
    b.setValue(this.value);
    return b;
    
  }
   
  Vector2d Center(){
    return this.center;
  }
   
  boolean inArea(Vector2d v) {
    //judge whether v is inside of this block
    if (v.getX()>this.x*w && v.getX()<this.x*w+this.w) {
      if (v.getY()>this.y*h && v.getY()<this.y*h+this.h) {
        return true;
      }
    }
    return false;
  }

  boolean near(Blo b) {
    if (((x+1==b.x || x-1==b.x)&&y == b.y)||((y+1==b.y || y-1==b.y)&&x == b.x)) {
      return true;
    } else {
      return false;
    }
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
    stroke(255);
    strokeWeight(2.5f);
    rect((float)(x*w), (float)(y*h), (float)w, (float)h);
    stroke(0);
    strokeWeight(1.5f);
    float rr = 5;

    rect((float)(x*w), (float)(y*h), (float)w, (float)h);
    fill(255);
    ellipse((float)l_t.x, (float)l_t.y, rr, rr);
    ellipse((float)l_b.x, (float)l_b.y, rr, rr);
    ellipse((float)r_t.x, (float)r_t.y, rr, rr);
    ellipse((float)r_b.x, (float)r_b.y, rr, rr);
    fill(255);
    text(value, (float)(x*w+w/2-3), (float)(y*h+h/2+5));

    popStyle();
  }
  
  void drawGreyscale(){
    draw(255-25*value,255-25*value,255-25*value);
  }
}

