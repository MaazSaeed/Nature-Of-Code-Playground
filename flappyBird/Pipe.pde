class Pipe {
  float x;
  float y0; // top pipe
  float w;
  float h0; // top pipe's height
  float h1; // bottom pipe's height
  float y1; // bottom pipe
  float spacing;
    
  Pipe() {
    w = 60;
    x = width + w;
    y0 = -4;
    h0 = random(50, 350);
    spacing = random(80, 120);
    y1 = spacing + h0;
    h1 = height;
  }
  
  void display() {
    stroke(0);
    strokeWeight(3);
    fill(50, 200, 60);
    rect(x, y0, w, h0, 5); // top pipe
    rect(x, y1, w, h1, 5);
  }
  
  void scroll() {
    x -= 2;
  }
  
  float getX() {
    return x;
  }    
  
  boolean collide(Bird b) {    
    float z = b.getW()-23;
    if(b.getX() < (x + w) && b.getX() + z > x && b.getY() < y0+h0 && b.getY() + z > y0 || b.getX() < (x + w) && b.getX() + z > x && b.getY() < y1+h1 && b.getY() + z > y1) {
      return true;
    } else {
      return false;
    }    
  }
  
}