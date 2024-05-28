class Slider{
  PVector location = new PVector(width/2, height-20);
  color col = 255;
  float h = 10;
  float w = 80;
  float speed = 3;
  Slider(){
  }
  Slider(color c, float a, float b){
    col = c;
    h = a;
    w = b;
  } 
  void keyPressed(){
    if (keyCode == LEFT){
      location.x -= speed;
    }
    if (keyCode == RIGHT){
      location.x += speed;
    }
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
