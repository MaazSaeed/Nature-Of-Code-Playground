class Pipe {
  float x;
  float y;
  float w;
  float h;
  float spacing;
  
  Pipe() {
    x = width+w;
    y = -3;
    w = 60;
    h = random(100, 350); 
    spacing = h/1.5;
  }
  
  void drawPipe() {
    stroke(0);
    strokeWeight(3);
    fill(50, 240, 35);
    rect(x, y, w, h, 8); // upper pipe
    rect(x, h + spacing, w, height, 8); // lower pipe
  }
  
  void scrollPipe() {
    x -= 2;
  }
  
  float getW() {
    return w;
  }
  
  float getX() {
    return x;
  }
}