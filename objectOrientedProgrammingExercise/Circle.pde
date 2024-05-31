class Circle extends Shape {
  color c;
  
  Circle(float x_, float y_, float r_, color c_) {
    super(x_, y_, r_);
    c = c_;
  }
  
  void display() {
    stroke(0);
    strokeWeight(3);
    fill(c);
    ellipse(x, y, r, r);
  }
  
  void jiggle() {
    super.jiggle();
    r += random(-5, 5);
    r = constrain(r, 0, 100);
  }
  
  void changeColor() {
    c = color(random(255), random(255), random(255));
  }
}