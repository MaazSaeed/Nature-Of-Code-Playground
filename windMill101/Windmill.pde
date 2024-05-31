class Windmill {
  
  Box box1;
  Box box2;
  RevoluteJoint joint;
  Windmill() {
    
    box1 = new Box(width/2, height/2, 100, 10, false);
    box2 = new Box(width/2, height/2 + 15, 10, 40, true);
    
    RevoluteJointDef rjd = new RevoluteJointDef();
    
    rjd.initialize(box1.body, box2.body, box1.body.getWorldCenter());
    
    rjd.motorSpeed = PI * 2.0;
    rjd.maxMotorTorque = 1000.0;
    rjd.enableMotor = false;
    
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }
  
  void display() {
    box2.display();
    box1.display();
    //println(joint.isMotorEnabled());
  }
  
  void toggleMotor() {
    boolean motorStatus = joint.isMotorEnabled();
    joint.enableMotor(!motorStatus);
  } 
}
