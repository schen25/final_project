class Brick{
 
int w;
int h;
PVector location;
int origX;
color c;
int hitsNeeded;
PVector velocity;

Brick(int x, int y, float xVel, float yVel, int wid, int hei, color hue){
  location = new PVector(x, y);
  w = wid;
  h = hei;
  velocity = new PVector(xVel, yVel);
  c = hue;
}

Brick(int x, int y, float xVel, float yVel, int wid, int hei, color hue, int oX, int hits){ 
  location = new PVector(x, y);
  w = wid;
  h = hei;
  velocity = new PVector(xVel, yVel); 
  c = hue;
  origX = oX;
  hitsNeeded = hits;
} 

Brick(int x, int y, float xVel, float yVel, int wid, int hei, color hue, int hits){
  location = new PVector(x, y);
  w = wid;
  h = hei;
  velocity = new PVector(xVel, yVel);
  c = hue;
  hitsNeeded = hits;
}

void move(){
  location = location.add(velocity);
  if (location.x >origX+120 || location.x <origX){
    velocity.x *= -1;
  }
}
 

void display() {
    stroke(1);
    strokeWeight(2);
    fill(c);
    rect(location.x, location.y, w, h);
    textSize(10);
    fill(255);
    text(hitsNeeded, location.x + w/2, location.y + h/2); // Display hitsNeeded in the middle of the brick
}
 
void display(color hue){
  stroke(1);
  strokeWeight(2);
  fill(c);
  rect(location.x, location.y, w, h);
  textSize(10);
    fill(hue);
  text(hitsNeeded, location.x+50, location.y+15);
  c = hue;
 } 
}
