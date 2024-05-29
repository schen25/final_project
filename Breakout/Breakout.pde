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
  ball.bounce();
  if ((ball.location.y>=slider.location.y) && (ball.location.x>slider.location.x&&ball.location.x<=slider.location.x+slider.w)) ball.velocity.y *= -1;
  ball.move();
  ball.display();
  slider.move();
  slider.display();
  //fill(255);
  //text(ball.location.y, 50, 50, 50);
  //text(slider.location.y, 10, 50, 50);
}

public void respawnBall(){}
public void removeBrick(){}
