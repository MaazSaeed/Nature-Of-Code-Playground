class Lollipop {
  
  Body body;
  
  float x;
  float y;
  float angle;
  float w;
  float h;
  float r;
  
  Lollipop(float x_, float y_) {
    x = x_;
    y = y_;
    w = 7;
    h = 15;
    r = 7;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.angle = random(TWO_PI);
    
    body = box2d.createBody(bd);  
    
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    
    ps.setAsBox(box2Dw, box2Dh);
       
    CircleShape circle = new CircleShape();
    circle.m_radius = box2d.scalarPixelsToWorld(r);
    
    Vec2 offset = new Vec2(0, -h/2);
    offset = box2d.vectorPixelsToWorld(offset);
    circle.m_p.set(offset.x, offset.y);
    
    /*
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    
    FixtureDef fd1 = new FixtureDef();
    fd1.shape = circle;
    fd1.density = 1;
    */
    
    body.createFixture(ps, 1.0);
    body.createFixture(circle, 1.0);
    
    body.setAngularVelocity(random(-0.1, 0.4));
    body.setLinearVelocity(new Vec2(random(-1, 3), random(-2, 4)));
    
    body.setAngularVelocity(0.1);
    //body = box2d.createBody(bd);   
  }
  
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    stroke(0);
    fill(230, 255, 0, 100);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    rectMode(CENTER);
    rect(0, 0, w, h);
    ellipse(0, -h/2, r*2, r*2);
    popMatrix();
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
