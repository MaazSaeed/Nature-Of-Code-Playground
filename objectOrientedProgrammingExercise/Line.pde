class Line extends Shape {
  float x2;
  float y2;
  
  Line(float x_, float y_, float r_, float x2_, float y2_) {
    super(x_, y_, r_);
    x2 = x2_;
    y2 = y2_;
  }
  
  void display() {
    strokeWeight(r);
    line(x, y, x2, y2);
  }
  
  void jiggle() {
    x += random(-1, 1);
    y += random(-1, 1);
    x2 += random(-1, 1);
    y2 += random(-1, 1);
  }
}