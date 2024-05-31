class Surface {
 
  ArrayList<Vec2> surface;
  
  Body body;
  float t = 0;

  Surface() {
    surface = new ArrayList<Vec2>();
    
    for(int x = 0; x <= width; x += 9) {
      float y = map(noise(t), 0, 1, height * 0.1, height);
      surface.add(new Vec2(x, y));
      t += 0.03;
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
  noFill();
  strokeWeight(1);
  beginShape();
  for(Vec2 s: surface) {
    vertex(s.x, s.y);
  }
  endShape();
  }  
}
