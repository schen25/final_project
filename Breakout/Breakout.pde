int lives = 3;
int screenNum = 0;
int level = 1;
Ball ball;

public void setup(){
  size(800, 800);
  ball = new Ball();
  ball.display();
  
}

public void draw(){
  background(0);
  ball.bounce();
  ball.move();
  ball.display();
}

public void respawnBall(){}
public void removeBrick(){}
