class ParticleSystem {
  
  ArrayList<Particle> particles;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }
  
  void addParticles() {
    float r = random(1);
    
    if(r < 0.5) {
      particles.add(new Confetti(330));
    } else {
      particles.add(new Particle(330));
    }
  }
  
  void run() {
    Iterator<Particle> it = particles.iterator();
    while(it.hasNext()) {
      Particle p = it.next();
      p.run();
      
      if(p.isDead()) {
        println("dead");
        it.remove();
      }
      
    }
  }
  
  void applyRepeller(Repeller r) {
    for(Particle p: particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
  void applyForce(PVector force) {
    for(Particle p: particles) {
      p.applyForce(force);
    }
  }
  
}
