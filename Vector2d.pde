/*
Wenzhe Peng
 pwz@berkeley.edu
 */

class Vector2d {
  private double x;
  private double y;

  Vector2d(double x, double y) {
    this.x = x;
    this.y = y;
  }

  double getX() {
    return this.x;
  }
  double getY() {
    return this.y;
  }
  void setX(double x){
    this.x = x;
  }
  void setY(double y){
    this.y = y;
  }
  double disSQ(Vector2d v){
    return (this.x-v.x)*(this.x-v.x)+(this.y-v.y)*(this.y-v.y);
  }
  double dis(Vector2d v){
   return sqrt((float)disSQ(v)); 
    
  }
  
  String toString(){
   return "["+this.x+","+this.y+"]" ;
  }
  
  void draw(){
    pushStyle();
    fill(255,0,0);
    stroke(255,0,0);
    ellipse((float)x,(float)y,5,5);
    
    popStyle();
    
  }
  
}

