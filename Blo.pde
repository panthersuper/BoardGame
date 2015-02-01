class Blo{
  
  int x;//x coodinate
  int y;//y coodinate
  double w;//width for a unit
  double h;//height for a unit
  Vector2d l_t;//each vertex for the block
  Vector2d l_b;//each vertex for the block
  Vector2d r_t;//each vertex for the block
  Vector2d r_b;//each vertex for the block
  
  
  Blo(int x,int y,double w,double h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.l_t = new Vector2d(x*w,y*h);
    this.l_b = new Vector2d(x*w,y*h+h);
    this.r_t = new Vector2d(x*w+w,y*h);
    this.r_b = new Vector2d(x*w+w,y*h+h);
  }
  
  
  void draw(){
    pushStyle();
    rect((float)(x*w),(float)(y*h),(float)w,(float)h);
    ellipse((float)l_t.x,(float)l_t.y,3,3);
    ellipse((float)l_b.x,(float)l_b.y,3,3);
    ellipse((float)r_t.x,(float)r_t.y,3,3);
    ellipse((float)r_b.x,(float)r_b.y,3,3);
    popStyle();
  }
    void draw(int r,int g,int b){
    pushStyle();
    fill(r,g,b);
    rect((float)(x*w),(float)(y*h),(float)w,(float)h);
    fill(255);
    ellipse((float)l_t.x,(float)l_t.y,3,3);
    ellipse((float)l_b.x,(float)l_b.y,3,3);
    ellipse((float)r_t.x,(float)r_t.y,3,3);
    ellipse((float)r_b.x,(float)r_b.y,3,3);
    popStyle();
  }
}
