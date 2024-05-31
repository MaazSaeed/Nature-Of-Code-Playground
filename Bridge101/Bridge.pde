class Bridge {
  float numParticles = 45;
  
  float len = width/numParticles;

  ArrayList<Particle> particles = new ArrayList<Particle>(); 
 
 Bridge() {
   for(int x = 0; x <= width; x += len) {  
     if(x <= 0) {
       particles.add(new Particle(x, height * 0.4, true));
     }
     if(x >= width) {
       particles.add(new Particle(x, height * 0.4, true));
     }
     else {
       particles.add(new Particle(x, height * 0.4, false));
     }
   }

   for(int i = 0; i < particles.size() - 1; i++) {
     
     DistanceJointDef djd = new DistanceJointDef();
     djd.bodyA = particles.get(i).body;
     djd.bodyB = particles.get(i+1).body;
     
     djd.length = box2d.scalarPixelsToWorld(len);
     djd.frequencyHz = 0.0;
     djd.dampingRatio = 1.0;
     
     DistanceJoint dj = (DistanceJoint)box2d.world.createJoint(djd);
   }
 }
  
 void display() {   
   for(int i = 0; i < particles.size() - 1; i++) {
     
     Vec2 pos1 = box2d.getBodyPixelCoord(particles.get(i).body);
     Vec2 pos2 = box2d.getBodyPixelCoord(particles.get(i+1).body);
     
     stroke(0);     
     line(pos1.x, pos1.y, pos2.x, pos2.y);
     
     particles.get(i).display();
     particles.get(i + 1).display();
   }
 }
}
