class Clover {
  
  Body body;
  Vec2 bodyCenter;
  ArrayList<Vec2> cloverPos;
  float w;
  float h;
  float x;
  float y;
  
  Clover(float x_, float y_) {
    cloverPos = new ArrayList<Vec2>();
    w = 4;
    h = 20;
    x = x_ + random(-30, 30);
    y = y_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.angle = random(TWO_PI);
    body = box2d.createBody(bd);
    

    PolygonShape stem = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    stem.setAsBox(box2Dw, box2Dh);
    body.createFixture(stem, 1.0);
    
    Vec2[] vertsClover = new Vec2[3];
    
    vertsClover[0] = box2d.vectorPixelsToWorld(new Vec2(0, 0));
    vertsClover[1] = box2d.vectorPixelsToWorld(new Vec2(12, 0));
    vertsClover[2] = box2d.vectorPixelsToWorld(new Vec2(20, -15));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[0]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[1]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[2]));

    PolygonShape c1 = new PolygonShape();
    c1.set(vertsClover, vertsClover.length);
    body.createFixture(c1, 1.0);
 
    vertsClover[0] = box2d.vectorPixelsToWorld(new Vec2(-12, 0));
    vertsClover[1] = box2d.vectorPixelsToWorld(new Vec2(0, 0));
    vertsClover[2] = box2d.vectorPixelsToWorld(new Vec2(-20, -15));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[0]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[1]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[2]));  
    
    PolygonShape c2 = new PolygonShape();
    c2.set(vertsClover, vertsClover.length);
    body.createFixture(c2, 1.0);
    
    vertsClover[0] = box2d.vectorPixelsToWorld(new Vec2(-20, 15));
    vertsClover[1] = box2d.vectorPixelsToWorld(new Vec2(0, 0));
    vertsClover[2] = box2d.vectorPixelsToWorld(new Vec2(-12, 0));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[0]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[1]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[2]));
    
    PolygonShape c3 = new PolygonShape();
    c3.set(vertsClover, vertsClover.length);
    body.createFixture(c3, 1.0);
    
    vertsClover[0] = box2d.vectorPixelsToWorld(new Vec2(0, 0));
    vertsClover[1] = box2d.vectorPixelsToWorld(new Vec2(20, 15));
    vertsClover[2] = box2d.vectorPixelsToWorld(new Vec2(12, 0));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[0]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[1]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[2]));
    
    PolygonShape c4 = new PolygonShape();
    c4.set(vertsClover, vertsClover.length);
    body.createFixture(c4, 1.0);
    
    vertsClover[0] = box2d.vectorPixelsToWorld(new Vec2(0, 0));
    vertsClover[1] = box2d.vectorPixelsToWorld(new Vec2(12, -20));
    vertsClover[2] = box2d.vectorPixelsToWorld(new Vec2(0, -12));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[0]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[1]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[2]));
    
    PolygonShape c5 = new PolygonShape();
    c5.set(vertsClover, vertsClover.length);
    body.createFixture(c5, 1.0);
    
    vertsClover[0] = box2d.vectorPixelsToWorld(new Vec2(0, 0));
    vertsClover[1] = box2d.vectorPixelsToWorld(new Vec2(0, -12));
    vertsClover[2] = box2d.vectorPixelsToWorld(new Vec2(-12, -20));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[0]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[1]));
    cloverPos.add(box2d.vectorWorldToPixels(vertsClover[2]));
    
    PolygonShape c6 = new PolygonShape();
    c6.set(vertsClover, vertsClover.length);
    body.createFixture(c6, 1.0);
    
    body.setAngularVelocity(random(-2, 1));
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float angle = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    fill(34, 165, 29, 180);
    stroke(0);
    rectMode(CENTER);
    rect(0, h/2, w, h);
    fill(51, 255, 44, 255);
    noStroke();
    beginShape(TRIANGLES);
    for(int i = 0; i < cloverPos.size(); i++) {
      Vec2 tempPos = cloverPos.get(i);
      vertex(tempPos.x, tempPos.y);
    }
    endShape();
    popMatrix();
  }
}
