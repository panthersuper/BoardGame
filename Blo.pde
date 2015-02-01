class Blo{
  
  int x;
  int y;
  double w;
  double h;
  
  Blo(int x,int y,double w,double h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
  }
  
  void draw(){
    pushStyle();
    fill(0);
    rect((float)(x*w),(float)(y*h),(float)w,(float)h);
    popStyle();
  }
  
}
