class Timer
{
  int totalTime;
  int startTime;
  
  Timer(int totalTime_)
  {
    totalTime = totalTime_;
  }
  
  void startTimer()
  {
    startTime = millis();
  }
  
  boolean isFinished()
  {
    int passedTime = millis() - startTime;
    
    if(passedTime > totalTime)
    {
      return true;
    }
    else
    {
      return false;
    }
    
  }
  
}
