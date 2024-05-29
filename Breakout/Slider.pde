class Slider{
  PVector location = new PVector(width/2, height-50);
  color col = 255;
  float h = 15;
  float w = 90;
  float speed = 5;
  Slider(){
  }
  Slider(color c, float a, float b, float s){
    col = c;
    h = a;
    w = b;
    speed = s;
  } 
  void keyPressed(){
    if (keyCode == LEFT){
      location.x = location.x-speed;
    }
    if (keyCode == RIGHT){
      location.x = location.x+speed;
    }
    if (location.x <= 0) location.x = 0;
    if (location.x+w >= width) location.x = width-w;
  }
  void move(){
    if (keyPressed){
      keyPressed();
    }
  }
  void display(){
    fill(col);
    rect(location.x, location.y, w, h);
  }

}
