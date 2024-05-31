import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import java.util.*;

Box2DProcessing box2d;
Windmill w;
ArrayList<Particle> particles;
void setup() {
  size(400, 300);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  w = new Windmill();
  particles = new ArrayList<Particle>();
}

void draw() {
   background(255);
   box2d.step();
   
   w.display();
   fill(0);
   textSize(12);
   text("click to toggle windmill on and off" , 10, height * 0.96);
   
   if(frameCount % 10 == 0) {
     particles.add(new Particle(random(width * 0.4, width* 0.55), random(-20, -10)));
   }

   Iterator<Particle> it = particles.iterator();
   while(it.hasNext()) {
     Particle p = it.next();
     p.display();
     if(p.fellOff()) {
       it.remove();
     }
   }
}

void mousePressed() {
  w.toggleMotor();
}
