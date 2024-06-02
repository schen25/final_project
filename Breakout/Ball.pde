class Ball{
  PVector velocity = new PVector(1, 5);
  PVector location = new PVector(width/2, height/2);
  float radius = 10;
  Ball(){
  }
  Ball(PVector vel, PVector loc, float rad){
    velocity = vel;
    location = loc;
    radius = rad;
  }
  // maybe change to range, only checking if center is within range now, but should also check if ends of radius are also within range
  // this bounce might be faulty actually
  void bounce(){
     if (location.x-radius <= 0 || location.x+radius >= width){
       velocity.x *= -1;
     }
     if (location.y-radius <= 0){
       velocity.y *= -1;
     }
  }
  void move(){
    location  = location.add(velocity);
  }
  void display(){
    fill(255);
    ellipse(location.x,location.y, radius*2, radius*2);
  }
}
