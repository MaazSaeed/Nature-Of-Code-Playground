import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import java.util.*;

Box2DProcessing box2d;
ArrayList<Lollipop> ls;
Boundary b;
Boundary b2;
Boundary border;

void setup() {
  size(400, 300);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -30);
  ls = new ArrayList<Lollipop>();
  b = new Boundary(width/2 - 25, 280, 280, 10);
  b2 = new Boundary(190, height * 0.3, 140, 10);
  border = new Boundary(15, height/2, 10, height);
}

void draw() {
  background(255);
  
  box2d.step();
  b.display();
  b2.display();
  border.display();
  
  if(frameCount % 60 == 0) {
    ls.add(new Lollipop(random(width*0.15, width*0.9), random(-30, 5)));
  }
  
  Iterator<Lollipop> it = ls.iterator();
  
  while(it.hasNext()) {
    Lollipop p = it.next();
    p.display();
    
    if(p.fellOff()) {
      it.remove();
    }
    
  }
  
  
}

void mousePressed() {
  ls.add(new Lollipop(mouseX, mouseY));
}
