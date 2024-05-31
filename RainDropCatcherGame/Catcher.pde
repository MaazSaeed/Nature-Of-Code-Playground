class Catcher
{
  float x; // x-position of catcher
  float y; // y-poistion of catcher
  float r; // radius of catcher
  String label;
  int score;
  
  Catcher(float r_)
  {
    r = r_;
    label = "Score";
  }
  
  void display(float x_, float y_)
  {
    x = x_; 
    y = y_;
    
    noStroke();
    fill(200, 200, 200, 200);
    
    ellipse(x, y, r*2, r*2);
    textAlign(CENTER);
    textSize(15);
    fill(100, 0, 0);
    text(score, x, y-5);
    
  }
  
  
  void incrementScore()
  {
    score++;
  }
  
  void resetScore()
  {
    score = 0;
  }
  
  
}
