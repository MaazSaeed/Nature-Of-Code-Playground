int angle = 20;
float r = 30;
float g = 50;
float b = 70;

int startTime;
int totalTime = (360/120) * 1000;

void setup() {
  size(200, 200);
  background(255);
  smooth();
  noStroke();
  startTime = millis();
}

void draw(){
  int timePassed = millis() - startTime;
  
  if(timePassed > totalTime) {
    background(255);
    startTime = millis();
    println("Time Passed: " + millis()/1000 + " seconds");
  }
  
  if(frameCount % 10 == 0) {
    fill(r, g, b);
    translate(100, 100);
    rotate(radians(angle));
    rect(0, 0, 80, 20);
    angle += 20;
    r += 30;
    g += 50;
    b += 70;
  }
  
      if(r >= 255) {
      r = 0;
    }
    
    if(g >= 255) {
      g = 0;
    }
    
    if(b >= 255) {
      b = 0;
    }
}
