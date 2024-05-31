class Cell {
  PImage img;
  float x;
  float y;  
  boolean showState = false;
  boolean tuned = false; 
  Timer timer;
  String fileName;
   
  Cell(float x_, float y_, String img_) {
    x = x_;
    y = y_;
    fileName = img_;
    img = loadImage(fileName);
    timer = new Timer();
  }
  
  void display() {
    fill(255);
    stroke(0);
    strokeWeight(2);
    rect(x, y, grid, grid);
    if(showState || tuned) {
      image(img, x, y, grid, grid);
    }
  }
  
  boolean isMouseInside(float mx, float my) {
    if(mx > x && mx < x + grid && my > y && my < y + grid) {
      return true;
    } else {
      return false;
    }
  }
  
  void setShowState(boolean val) {
    showState = val;
  }
  
  boolean getShowState() {
    return showState;    
  }
  
  String getFileName() {
    return fileName;
  }
  
  void setTunedState(boolean val) {
    tuned = val;
  }
}