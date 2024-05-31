class Timer {
  int savedTime;
  int totalTime;
  
  Timer() {
    totalTime = 2000;
  }
  
  void startTimer() {
    savedTime = millis();
  }
  
  boolean isFinished() {
    int passedTime = millis() - savedTime;
    if(passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }

}