class Ball{
  PVector velocity = new PVector(1,1);
  PVector location = new PVector(width/2, height/2);
  float radius = 20;
  Ball(){
  }
  Ball(PVector vel, PVector loc, float rad){
    velocity = vel;
    location = loc;
    radius = rad;
  }
  void bounce(){
     if (location.x <= 0 || location.x >= width){
       velocity.x *= -1;
     }
     if (location.y <= 0 || location.y >= height){
       velocity.y *= -1;
     }
  }
  void move(){
    location  = location.add(velocity);
  }
  void display(){
    fill(255);
    ellipse(location.x,location.y, radius, radius);
  }
}
