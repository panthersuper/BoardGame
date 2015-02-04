/*
Wenzhe Peng
 pwz@berkeley.edu
 */

class Button {
  double x;//position x
  double y;//position y
  double w;//width
  double h;//height
  boolean state0;//default state of this button
  String name;
  boolean state;
  boolean type;//is it a condition maintained button or not
  ArrayList<Button> linked = new ArrayList();

  Button(double x, double y, double w, double h, boolean t, String name) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.state0 = false;
    this.state = state0;
    this.name = name;
    this.type = t;
  }

  boolean inZone() {
    if (mouseX>x && mouseX<x+w &&mouseY>y && mouseY<y+h) 
      return true;
    else
      return false;
  }

  void set(boolean ss){
    this.state = ss;
    
  }
  
  void setLink(Button b){
    this.linked.add(b);
    b.linked.add(this);
  }
  
  
  void iterate() {//functin inside the loop main function
  if (!type){
    if (mousePressed && inZone()) {
      state = !state0;
      draw(true);
    } else {
      state = state0;
      draw(false);
    }
  }else{
    if (mousePressed && inZone()) {
      state = !state;
      draw(true);
      if (this.linked.size()>0){
        state = true;
        for (Button b : this.linked){
          b.set(false);
          
        }
      }
    }
    else
    draw(false);
  }
    
    
  }

  void draw(boolean black) {
    pushStyle();
    stroke(255);
    if (black)
    fill(230);
    else fill(100);
    rect((float)x, (float)y, (float)w, (float)h);
    if (black)
    fill(100);
    else
    fill(230);
    text(name, (float)(x+w/2-name.length()*3.5f), (float)(y+h/2+5));

    popStyle();
  }

  boolean state() {
    return this.state;
  }
}

