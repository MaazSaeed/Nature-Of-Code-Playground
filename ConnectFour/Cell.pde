class Cell {
  float x;
  float y;
  float cellW;
  String usable;  
  String drawState;

  Cell(float x_, float y_) {
    x = x_;
    y = y_;
    cellW = 100;
    usable = "";
    drawState = "";
  }

  void display() {
    noFill();
    stroke(0);
    strokeWeight(2);
    rectMode(CORNER);
    rect(x, y, cellW, cellW);

    if (drawState.equals("circle")) {
      fill(0);
      ellipse(x+50, y+50, 70, 70);
    } else if (drawState.equals("rect")) {
      rectMode(CENTER);
      rect(x+50, y+50, 70, 70);
    }
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  String getUsable() {
    return usable;
  }

  void setUsable(String usable_) {
    usable = usable_;
  }

  void setDrawState(String drawState_) {
    drawState = drawState_;
  }
}