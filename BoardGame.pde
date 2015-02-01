  Grid g;
  Blo b;
  
  
   void setup(){
    size(500,500);
    g = new Grid(10,10,500,500);
    b = new Blo(0,0,50,50);
  }
  
   void draw(){
    g.draw();
    g.onBlo(new Vector2d(mouseX, mouseY)).draw(0,0,0);
    
  }
  
  
  
  
  
  
  


