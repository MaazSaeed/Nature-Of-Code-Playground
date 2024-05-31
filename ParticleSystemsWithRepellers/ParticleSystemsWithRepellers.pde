import java.util.*;

ParticleSystem ps;
ArrayList<Repeller> repellers;
PVector gravity = new PVector(0, 0.1);

void setup() {
  size(500, 400);
  ps = new ParticleSystem();
  repellers = new ArrayList<Repeller>();
}

void draw() {
  background(255);
  ps.run();
  ps.addParticles();
  ps.applyForce(gravity);
 // ps.applyRepeller(r);
  for(Repeller r: repellers) {
    r.display();
    ps.applyRepeller(r);
  }
}

void mousePressed() {
  repellers.add(new Repeller(new PVector(mouseX, mouseY), random(20, 150)));
}
