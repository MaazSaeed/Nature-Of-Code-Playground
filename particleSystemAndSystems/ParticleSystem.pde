class ParticleSystem {
  
  ArrayList particles;
  PVector origin;
  
  ParticleSystem(PVector origin_) {
    particles = new ArrayList();
    origin = origin_.copy();
  }
  
  
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  void run() {
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()) {
      Particle p = it.next();
      p.run();
      PVector gravity = new PVector(0, 0.1);
      p.applyForce(gravity);
      if(p.isDead()) {
        it.remove();
      }
    }
  }
  

}
