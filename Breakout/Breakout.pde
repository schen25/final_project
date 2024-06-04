int lives = 3;
int screenNum = 0;
int level = 1;
ArrayList<Brick> wall = new ArrayList<Brick>();
PFont font;
PImage fullHeart;
PImage emptyHeart;
Ball ball;
Slider slider;

public void setup(){
  size(800, 800);
  ball = new Ball();
  slider = new Slider();
  slider = new Slider();
  font = createFont("PressStart2P-Regular.ttf", 50);
  for (int i = 200; i < 325; i+=25){ 
    for (int j = 0; j < 800; j+= 80){ 
      Brick a = new Brick(j, i, 0, 0, 80, 25);
      wall.add(a);
    } 
  }
  fullHeart = loadImage("fullHeart.png");
  emptyHeart = loadImage("emptyHeart.png");
}

public void draw(){
  background(0);
  fill(255);
  if (screenNum == 0) homeScreen();
  else if (screenNum == 1) level1Screen();
  else if (screenNum == 2) level2Screen();
  else if (screenNum == 3) level3Screen();
  else if (screenNum == 4) directionScreen();
  else if (screenNum == 5) congratsScreen();
  
  
}

public void respawnBall(){
  if (mousePressed){
    ball = new Ball();
    lives--;
  }
}
public void removeBrick(){}
public void decreaseHits(Brick b){}
public void retryScreen(){}
public void directionScreen(){
  // screen 4
    // back button
  if (mouseX>=50 && mouseX<= 245 && mouseY>=50 && mouseY<=115)fill(55);
  else fill(0);
  stroke(255);
  strokeWeight(5);
  rect(50, 50, 195, 65, 28);
  fill(255);
  textSize(25);
  text("◀ BACK", 150, 95);
  if (mouseX>=50 && mouseX<= 245 && mouseY>=50 && mouseY<=115 &&mousePressed) screenNum = 0;
}
public void level1Screen(){
  // screen 1
  for (Brick b : wall){
    b.display();
  }
  if (ball.location.y>=height) respawnBall();
  else{
    ball.bounce();
    // bounce upwards
    if ((ball.location.y+ball.radius>=slider.location.y && ball.location.y+ball.radius<slider.location.y+slider.h) && (ball.location.x+ball.radius>=slider.location.x&&ball.location.x-ball.radius<=slider.location.x+slider.w)){
      ball.velocity.y *= -1;
      //ball.velocity.x = random(-3, 3) + 1; if random bounce
      ball.location.y = slider.location.y-ball.radius-1;
    } 
    if ((ball.location.x+ball.radius>=slider.location.x && ball.location.x+ball.radius<slider.location.x+slider.w) && (ball.location.y+ball.radius>=slider.location.y&&ball.location.y-ball.radius<=slider.location.y+slider.h)) {
      ball.velocity.x = -1*slider.speed;
      ball.location.x = slider.location.x-ball.radius-1; // slider x speed is faster so if move, it'll stick
    }
    if ((ball.location.x-ball.radius<=slider.location.x+slider.w && ball.location.x-ball.radius>slider.location.x) && (ball.location.y+ball.radius>=slider.location.y&&ball.location.y-ball.radius<=slider.location.y+slider.h)){
      ball.velocity.x = slider.speed;
      ball.location.x = slider.location.x+slider.w+ball.radius+1;
    } 
    for (Brick b : wall){
      // bottom brick hit
      if (((ball.location.y-ball.radius<=b.location.y+b.h && ball.location.y-ball.radius>b.location.y) && (ball.location.x+ball.radius>=b.location.x&&ball.location.x-ball.radius<b.location.x+b.w)) ){
        ball.velocity.y = 5;
        b.location = new PVector(-100, -100);
      }
      //top brick hit
      if ((ball.location.y+ball.radius>=b.location.y && ball.location.y+ball.radius<b.location.y+b.h) && (ball.location.x+ball.radius>=b.location.x&&ball.location.x-ball.radius<b.location.x+b.w)){
        ball.velocity.y = -5;
        b.location = new PVector(-100, -100);
      }
      // right hit
      if ((ball.location.x-ball.radius<=b.location.x+b.w && ball.location.x-ball.radius>b.location.x) && (ball.location.y+ball.radius>=b.location.y&&ball.location.y-ball.radius<b.location.y+b.h)){
        ball.velocity.x =1;
        b.location = new PVector(-100, -100);
      }
      // left hit
      if ((ball.location.x+ball.radius>=b.location.x && ball.location.x+ball.radius<b.location.x+b.w) && (ball.location.y+ball.radius>=b.location.y&&ball.location.y-ball.radius<b.location.y+b.h)){
        ball.velocity.x =-1 ;
        b.location = new PVector(-100, -100);
      }
        //} // can take out three, maybe check
    } // brick + ball collision, check this, may be buggy
    ball.move();
    ball.display();
  }
  // issue where ball can slide along the slider
  slider.move();
  slider.display();
  fill(100, 21, 0);
  //fill(255);
  //text(ball.location.y, 50, 50, 50);
  //text(slider.location.y, 10, 50, 50);
  
  // hearts
  if (lives > 0)image(fullHeart, 30, 30);
  else image(emptyHeart, 30, 30);
  if (lives > 1)image(fullHeart, 90, 30);
  else image(emptyHeart, 90, 30);
  if (lives > 2)image(fullHeart, 150, 30);
  else image(emptyHeart, 150, 30);
} 
public void level2Screen(){} // screen 2
public void level3Screen(){} // screen 3
//public void keyPressed(){}
public void congratsScreen(){} // screen 5
public void homeScreen(){
    // screen 0
  background(0);
  fill(255);
  textFont(font);
  textAlign(CENTER);
  text("Atari\nBreakout", width/2, height/2-200);
    // play button
  if (mouseX>=width/2-175 && mouseX<= width/2+175 && mouseY>=height/2-50 && mouseY<=height/2+15){
    fill(200);
    stroke(200);
  }
  else {
    fill(255);
    stroke(255);
  }
  rect(width/2-175, height/2-50, 350, 65, 28);
  fill(0);
  textSize(25);
  text("PLAY ▶", width/2, height/2);
    // directions button
  if (mouseX>=width/2-175 && mouseX<= width/2+175 && mouseY>=height/2+40 && mouseY<=height/2+115)fill(55);
  else fill(0);
  stroke(255);
  strokeWeight(5);
  rect(width/2-175, height/2+40, 350, 65, 28);
  fill(255);
  textSize(25);
  text("DIRECTIONS", width/2, height/2+90);
    // if play button is clicked go to level1Screen
  if (mouseX>=width/2-175 && mouseX<= width/2+175 && mouseY>=height/2-50 && mouseY<=height/2+15 && mousePressed) screenNum = 1;
  if (mouseX>=width/2-175 && mouseX<= width/2+175 && mouseY>=height/2+40 && mouseY<=height/2+115 && mousePressed) screenNum = 4;
  
}
