class Polygon {
  
  Body body;
  ArrayList<Vec2> verts;
  
  Polygon(float x_, float y_) {
    
    PolygonShape ps = new PolygonShape();
    
    Vec2[] vertices = new Vec2[6];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(0, 25));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(15, 15));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(15, -15));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(0, -25));
    vertices[4] = box2d.vectorPixelsToWorld(new Vec2(-15, -15));
    vertices[5] = box2d.vectorPixelsToWorld(new Vec2(-15, 15));
   // vertices[6] = box2d.vectorPixelsToWorld(new Vec2(-5, -5));
   // vertices[7] = box2d.vectorPixelsToWorld(new Vec2(-7, 10));

    
    verts = new ArrayList<Vec2>();
    
    for(int i = 0; i < vertices.length; i++) {
      verts.add(box2d.vectorWorldToPixels(vertices[i]));
    }
    
    ps.set(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));
    bd.type = BodyType.DYNAMIC;
    bd.angle = random(PI);
    
    body = box2d.createBody(bd);
    body.createFixture(ps, 1.0);
    
    body.setAngularVelocity(random(0.1, 0.6));
    body.setLinearVelocity(new Vec2(random(-5, 5), random(-6, 8)));
  }
  
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    noStroke();
    fill(169);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    beginShape();
    for(Vec2 v: verts) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);     
    popMatrix();
    }
    
    void destroyBody() {
      box2d.destroyBody(body);
    }
    
    boolean fellOff() {
      Vec2 pos = box2d.getBodyPixelCoord(body);

      if(pos.y > height) {
        return true;
      } else {
        return false;
      }
    }
}
