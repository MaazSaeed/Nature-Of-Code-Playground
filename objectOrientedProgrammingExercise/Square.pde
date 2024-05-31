class Square extends Shape {
  color c;
  
  Square(float x_, float y_, float r_, color c_) {
    super(x_, y_, r_);
    c = c_;
  }
  
  void display() {
    strokeWeight(2);
    stroke(0);
    fill(c);
    rect(x, y, r, r);
  }
}