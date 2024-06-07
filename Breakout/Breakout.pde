int lives = 3;
int screenNum = 0;
int level = 1;
ArrayList<Brick> wall = new ArrayList<Brick>();
ArrayList<Brick> wallCopy = new ArrayList<Brick>();
PFont font;
PImage fullHeart;
PImage emptyHeart;
Ball ball;
Slider slider;
boolean fallen;
int bricksLeft;
// for text color stuff
int textAnimCol = 255;
boolean gradientDirection = false;

public void setup(){
  size(800, 800);
  ball = new Ball();
  slider = new Slider();
  font = createFont("PressStart2P-Regular.ttf", 50);
  for (int i = 200; i < 325; i+=25){ 
    for (int j = 0; j < 800; j+= 80){ 
      Brick a = new Brick(j, i, 0, 0, 80, 25);
      wall.add(a);
      bricksLeft++;
    } 
  }
  wallCopy = (ArrayList)wall.clone();
  fullHeart = loadImage("fullHeart.png");
  emptyHeart = loadImage("emptyHeart.png");
  fallen=true;
  frameRate(100);
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
  else if (screenNum == 6) retryScreen();
  else if (screenNum == 7) nextLevelScreen();
  
  
}

public void respawnBall(){
  // text color animation thing
  fill(textAnimCol);
  if (gradientDirection)textAnimCol+=4;
  else textAnimCol-=4;
  if (textAnimCol > 255){
    textAnimCol = 255;
    gradientDirection = false;
  }
  if (textAnimCol <30){
    textAnimCol = 30;
    gradientDirection = true;
  }
  //respawn stuff
  stroke(0);
  strokeWeight(1);
  text("Click to spawn ball.", width/2, height/2+100);
  if (mousePressed){
    ball = new Ball();
    ball.velocity.x = (random(0,4))-2; //randomize direction
    fallen = false;
  }
}
public void removeBrick(){}
public void decreaseHits(Brick b){}
public void retryScreen(){
  // screen6
  fill(55);
  stroke(255);
  strokeWeight(5);
  rect(width/2-325, height/2-150, 650, 300, 28);
  if (mouseX>=width/2+10 && mouseX<= width/2+130 && mouseY>=height/2+40 && mouseY<=height/2+120){
    fill(75);
    if (mousePressed) {
      screenNum = level;
      lives = 3;
      mousePressed = false;
      wall = (ArrayList)wallCopy.clone();
      slider.location = new PVector(width/2-45, height-50);
    }
  }else fill(55);
  rect(width/2+10, height/2+40, 120, 80, 28);
  if (mouseX>=width/2-130 && mouseX<= width/2-10 && mouseY>=height/2+40 && mouseY<=height/2+120) {
    fill(75);
    if (mousePressed){screenNum = 0;
    lives = 3;
    mousePressed = false;
    wall = (ArrayList)wallCopy.clone(); // make copy of orig array?
    slider.location = new PVector(width/2-45, height-50);
    }
  }else fill(55);
  rect(width/2-130, height/2+40, 120, 80, 28);
  fill(255);
  text("You lost all your life!", width/2, height/2-25);
  textSize(20);
  text("Retry", width/2+70, height/2+90);
  text("Back", width/2-70, height/2+90);
  textSize(25);
}
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
  //text(ball.location.y, 100, 100);
  //text(fallen + "", 100, 150);
  // screen 1
  for (Brick b : wall){
    b.display();
  }
  if (ball.location.y>=height) {
    lives--;
    ball.location = new PVector(-100, -100);
    ball.velocity = new PVector(0,0);
    fallen = true;
  }
  else{
    if (fallen) respawnBall();
    else{
    ball.bounce();
    // bounce upwards
    if ((ball.location.y+ball.radius>=slider.location.y && ball.location.y+ball.radius<slider.location.y+slider.h) && (ball.location.x+ball.radius>=slider.location.x&&ball.location.x-ball.radius<=slider.location.x+slider.w)){
      ball.velocity.y *= -1;
      ball.velocity.x = (random(0,4))-2; //if random bounce
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
    for (Brick b : wall){  //maybe make it less than radius
      // bottom brick hit
      if (((ball.location.y-ball.radius<=b.location.y+b.h && ball.location.y-ball.radius>b.location.y) && (ball.location.x+ball.radius>=b.location.x&&ball.location.x-ball.radius<b.location.x+b.w)) ){
        ball.velocity.y = 5;
        ball.velocity.x = (random(0,5))-2;
        b.location = new PVector(-100, -100);
        bricksLeft--;
      }
      //top brick hit
      if ((ball.location.y+ball.radius>=b.location.y && ball.location.y+ball.radius<b.location.y+b.h) && (ball.location.x+ball.radius>=b.location.x&&ball.location.x-ball.radius<b.location.x+b.w)){
        ball.velocity.y = -5;
        ball.velocity.x = (random(0,5))-2;
        b.location = new PVector(-100, -100);
        bricksLeft--;
      }
      // right hit
      if ((ball.location.x-ball.radius<=b.location.x+b.w && ball.location.x-ball.radius>b.location.x) && (ball.location.y+ball.radius>=b.location.y&&ball.location.y-ball.radius<b.location.y+b.h)){
        ball.velocity.x =1;
        b.location = new PVector(-100, -100);
        bricksLeft--;
      }
      // left hit
      if ((ball.location.x+ball.radius>=b.location.x && ball.location.x+ball.radius<b.location.x+b.w) && (ball.location.y+ball.radius>=b.location.y&&ball.location.y-ball.radius<b.location.y+b.h)){
        ball.velocity.x =-1 ;
        b.location = new PVector(-100, -100);
        bricksLeft--;
      }
        //} // can take out three, maybe check
    } // brick + ball collision, check this, may be buggy
    ball.move();
    ball.display();
  }
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
  if (bricksLeft == 0) screenNum = 7;
  if (lives == 0) screenNum = 6;
} 
public void level2Screen(){} // screen 2
public void level3Screen(){} // screen 3
//public void keyPressed(){}
public void congratsScreen(){} // screen 5
public void nextLevelScreen(){
  // screen 7
  level++;
  fill(55);
  stroke(255);
  strokeWeight(5);
  rect(width/2-325, height/2-150, 650, 300, 28);
  if (mouseX>=width/2+10 && mouseX<= width/2+130 && mouseY>=height/2+40 && mouseY<=height/2+120){
    fill(75);
    if (mousePressed) screenNum++;
  }else fill(55);
  rect(width/2+10, height/2+40, 120, 80, 28);
  if (mouseX>=width/2-130 && mouseX<= width/2-10 && mouseY>=height/2+40 && mouseY<=height/2+120) {
    fill(75);
    if (mousePressed){screenNum = 0;
    mousePressed = false;}
  }else fill(55);
  rect(width/2-130, height/2+40, 120, 80, 28);
  fill(255);
  text("You passed this level!\nMove on to the next\nlevel.", width/2, height/2-75);
  textSize(20);
  text("▶", width/2+70, height/2+90);
  text("Back", width/2-70, height/2+90);
  textSize(25);
} 
public void homeScreen(){
    // screen 0
  textSize(50);
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
  if (mouseX>=width/2-175 && mouseX<= width/2+175 && mouseY>=height/2-50 && mouseY<=height/2+15 && mousePressed) {
    screenNum = level;
    mousePressed = false;
  }
  if (mouseX>=width/2-175 && mouseX<= width/2+175 && mouseY>=height/2+40 && mouseY<=height/2+115 && mousePressed) screenNum = 4;
  
}
