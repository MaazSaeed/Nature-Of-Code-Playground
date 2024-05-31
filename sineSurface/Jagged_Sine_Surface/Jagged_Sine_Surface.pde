import java.util.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Box2DProcessing box2d;
Surface s;

void setup() {
  size(640, 300);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -18);
  boxes = new ArrayList<Box>();
  s = new Surface();
}

void draw() {
  background(255);
  box2d.step();
  s.display();
  println("time passed in sec: " + millis()/1000);
  
  if(frameCount % 60 == 0) {
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
