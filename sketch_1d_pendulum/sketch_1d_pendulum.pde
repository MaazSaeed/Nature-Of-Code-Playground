float period = 360;
float amp = 100;

int startTime;
int totalTime = int((period/60) * 1000);
boolean textT = false;

void setup() {
  size(640, 200);
  startTime = millis();
}

void draw() {
  
  background(255);
  
  int passedTime = millis() - startTime;
  
  fill(200, 0, 0);
  text("time period in seconds is: " + totalTime/1000, mouseX, mouseY);
  
  if(passedTime > totalTime) {
    startTime = millis();
    textT = true;
  }
  float x = sin((TWO_PI * (frameCount/period))) * amp;
  pushMatrix();
  translate(width/2, height/2);
 // ellipse(x, 0, 10, 10);
 fill(100);
  line(0, 0, x, 0);
  ellipse(x, 0, 10, 10);
  popMatrix();
  
  println("total Time passed since sketch started: " + millis()/1000); 
}
