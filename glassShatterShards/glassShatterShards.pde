// click to break and reset 
Material m;
PVector gravity = new PVector(0, 0.02);
boolean clicked = true;

void setup() {
  size(400, 300);
  m = new Material();
}

void draw() {
  background(255);
  m.display();
}

void mousePressed() {
  if(m.shatterBool == false) {
      m.shatter(new PVector(mouseX, mouseY));
      m.addShards();
  }
  
  else{
    m = new Material();
  }
}
