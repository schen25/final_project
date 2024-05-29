int lives = 3;
int screenNum = 0;
int level = 1;
Ball ball;
Slider slider;

public void setup(){
  size(800, 800);
  ball = new Ball();
  slider = new Slider();
  ball.display();
  slider = new Slider();
  slider.display();
  
  
}

public void draw(){
  background(0);
  slider.move();
  slider.display();
  if (ball.location.y>=height) respawnBall();
  else{
    ball.bounce();
    // bounce upwards
    if ((ball.location.y+ball.radius>=slider.location.y && ball.location.y+ball.radius<slider.location.y+ball.velocity.y) && (ball.location.x>slider.location.x&&ball.location.x<=slider.location.x+slider.w)) ball.velocity.y *= -1;
    // bounce side to side
    //if ((ball.location.x+ball.radius>=slider.location.x && ball.location.x+ball.radius<slider.location.x+ball.velocity.x) && (ball.location.y>slider.location.y&&ball.location.y<=slider.location.y+slider.h)) ball.velocity.x *= -1;
    ball.move();
    ball.display();
  }
  // issue where ball can slide along the slider
  
  //fill(255);
  //text(ball.location.y, 50, 50, 50);
  //text(slider.location.y, 10, 50, 50);
}

public void respawnBall(){
  if (mousePressed){
    ball = new Ball();
    lives--;
  }
}
public void removeBrick(){}
//public void decreaseHits(Brick){}
public void retryScreen(){}
public void directionScreen(){}
public void level1Screen(){}
public void level2Screen(){}
public void level3Screen(){}
//public void keyPressed(){}
public void congratsScreen(){}
