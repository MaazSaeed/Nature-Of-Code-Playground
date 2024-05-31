import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Bridge b;
ArrayList<Box> boxes;

void setup() {
  size(360, 180);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  b  = new Bridge();
  boxes = new ArrayList<Box>();  
}

void draw() {
  background(255);
  box2d.step();
  
  textSize(10);
  fill(0);
  text("click to add boxes", 10, height * 0.9);
    
  b.display();
  
  for(Box b: boxes) {
    b.display();
  }
}

void mousePressed() {
  boxes.add(new Box(mouseX, mouseY));
}
