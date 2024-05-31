import java.util.*;

ParticleSystem p;
ArrayList<ParticleSystem> systems;
void setup() {
  size(400, 500);
  p = new ParticleSystem(new PVector(width/2, 10));
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);
  p.run();
  p.addParticle();
  
  for(ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
  }
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
