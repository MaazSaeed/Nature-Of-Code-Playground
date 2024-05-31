class Cell {
  float x;
  float y;
  String drawState; 
  boolean usable;
  float w;
    
  Cell(float x_, float y_) {
    x = x_;
    y = y_;
    usable = true;
    drawState = "";
    w = 50;
  }
  
  void display() {
    if(drawState.equals("tic")) {
      stroke(0);
      strokeWeight(3);
      line(x+7, y+(w*0.5), x+12, y+(w*0.7));
      line(x+12, y+(w*0.7), x+40, y+15);
    } else if(drawState.equals("circle")) {
      fill(255);
      ellipse(x+(w*0.5), y+(w*0.5), 40, 40);
    }
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(x, y, w, w);  
 }
 
   boolean isMouseInside(float mx, float my) {
     if(mx > x && mx < x + w && my > y && my < y + w) {
       return true;
     } else {
       return false;
     }
   }
 
   void setDrawState(String state_) {
     drawState = state_;     
   }
   
   void setUsable(boolean value) {
     usable = value;
   }
   
   boolean getUsable() {
     return usable;
   }
   
   String getDrawState() {
     return drawState;
   }
}