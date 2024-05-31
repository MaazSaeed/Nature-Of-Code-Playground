class Surface {
 
  ArrayList<Vec2> surface;
  
  Body body;
  float t = 0;

  Surface() {
    surface = new ArrayList<Vec2>();
    
    for(int x = 15; x <= width; x += 8) {
      float y = map(noise(t), 0, 1, height * 0.1, height * 0.98);
      surface.add(new Vec2(x, y));
      t += 0.08;
    }
    
    
    Vec2[] vertices = new Vec2[surface.size()];
    for(int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    
    ChainShape chain = new ChainShape();
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    FixtureDef fd = new FixtureDef();
    fd.shape = chain;
    fd.friction = 2;
    
    body = box2d.createBody(bd);
    body.createFixture(fd);   
  }
  
  void display() {
  
  stroke(0);
  fill(255);
  strokeWeight(3);
  beginShape();
  for(Vec2 s: surface) {
    vertex(s.x, s.y);
  }
  endShape();
  }  
}
