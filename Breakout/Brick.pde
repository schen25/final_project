class Brick{ 
  
int w;
int h; 
PVector location;
int origX;
color c;
float hitsNeeded;
PVector velocity;

Brick(int x, int y, float xVel, float yVel, int wid, int hei){ 
  location = new PVector(x, y);
  w = wid;
  h = hei;
  velocity = new PVector(xVel, yVel); 
  c = color(155, 89, 182);
} 


Brick(int x, int y, float xVel, float yVel, int wid, int hei, color hue){ 
  location = new PVector(x, y);
  w = wid;
  h = hei;
  velocity = new PVector(xVel, yVel); 
  c = hue;
} 


Brick(int x, int y, float xVel, float yVel, int wid, int hei, float hits, color hue){ 
  location = new PVector(x, y);
  w = wid;
  h = hei;
  velocity = new PVector(xVel, yVel); 
  c = hue;
  hitsNeeded = hits;
} 

Brick(int x, int y, float xVel, float yVel, int wid, int hei, color hue, int oX){ 
  location = new PVector(x, y);
  w = wid;
  h = hei;
  velocity = new PVector(xVel, yVel); 
  c = hue;
  origX = oX;
} 

void move(){
  location = location.add(velocity); 
  if (location.x >origX+120 || location.x <origX){ 
    velocity.x *= -1;
  } 
} 
  

void display(){
    stroke(1);
    strokeWeight(2);
    fill(c);
    rect(location.x, location.y, w, h);
  }
  
void display(int hits){ 
  stroke(1);
  strokeWeight(2);
  fill(c);
  rect(location.x, location.y, w, h);
  text(hits, location.x, location.y);
} 
