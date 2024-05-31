class Vehicle {
  
  RevoluteJoint rightWheelJoint;
  RevoluteJoint leftWheelJoint;
  
  Frame frame;
  Wheel rightWheel;
  Wheel leftWheel;
  
  
  Vehicle(float x, float y) {
    
    frame = new Frame(x, y, 60, 20);
    rightWheel = new Wheel(x, y, frame, "RIGHT");
    leftWheel = new Wheel(x, y, frame, "LEFT");
    
    RevoluteJointDef rightWJoint = new RevoluteJointDef();
    RevoluteJointDef leftWJoint = new RevoluteJointDef();
    
    rightWJoint.initialize(rightWheel.body, frame.body, rightWheel.body.getWorldCenter());
    leftWJoint.initialize(leftWheel.body, frame.body, leftWheel.body.getWorldCenter());
    
    rightWJoint.motorSpeed = PI * 5;
    rightWJoint.maxMotorTorque = 1000000.0;
    rightWJoint.enableMotor = true;
    
    leftWJoint.motorSpeed = PI * 5;
    leftWJoint.maxMotorTorque = 1000000.0;
    leftWJoint.enableMotor = true;
    
    rightWheelJoint = (RevoluteJoint) box2d.world.createJoint(rightWJoint);
    leftWheelJoint = (RevoluteJoint) box2d.world.createJoint(leftWJoint);
  }
  
  void display() {
    frame.display();
    rightWheel.display();
    leftWheel.display();
  } 
  
  void toggleMotor() {
    boolean leftWheelStatus = leftWheelJoint.isMotorEnabled();
    boolean rightWheelStatus = rightWheelJoint.isMotorEnabled();
    
    leftWheelJoint.enableMotor(!leftWheelStatus);
    rightWheelJoint.enableMotor(!rightWheelStatus);   
  }
}
