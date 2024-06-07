class Brick{ 
  
int w;
int h; 
PVector location;
color[] colors = {color(210, 43, 43), color(242, 140, 40), color(80, 200, 120), color(0, 150, 255), color(155, 89, 182)};
color c;
int hitsNeeded;
PVector velocity;

Brick(int x, int y, int xVel, int yVel, int wid, int hei, color hue){ 
  location = new PVector(x, y);
  w = wid;
  h = hei;
  velocity = new PVector(xVel, yVel); 
  c = hue;
} 

void move(){
  location = location.add(velocity); 
  if (location.x > w || location.x < 0){ 
    velocity.x *= -1;
  } 
} 
  

void display(){
    stroke(1);
    strokeWeight(2);
    fill(c);
    rect(location.x, location.y, w, h);
  }
} 
