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
  ball.move();
  ball.display();
  slider.move();
  slider.display();
}

public void respawnBall(){}
public void removeBrick(){}
