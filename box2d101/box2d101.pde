import java.util.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Box2DProcessing box2d;
Boundary boundary;
Boundary boundary1;

void setup() {
  size(720, 360);
  smooth();
  // create a box2d world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);
  boxes = new ArrayList<Box>();
  boundary = new Boundary(200, height * 0.9, 500, 10);
  boundary1 = new Boundary(700, height *0.6, 300, 10);
}

void draw() {
  background(255);
  box2d.step();
  
  boundary.display();
  boundary1.display();
  
  if(frameCount % 7.5 == 0) {
    boxes.add(new Box(random(width), random(-20, 10)));
  }
  Iterator<Box> it = boxes.iterator();
  
  while(it.hasNext()) {
    Box b = it.next();
    b.display();
    
    if(b.fellOff()) {
      it.remove();
    }
  }
}

void mousePressed() {
  Box b = new Box(mouseX, mouseY);
  boxes.add(b);
}
