class Slider{
  PVector location = new PVector(width/2, height+10);
  color col = 255;
  float h = 10;
  float w = 30;
  Slider(){
  }
  Slider(color c, float a, float b){
    col = c;
    h = a;
    w = b;
  } 
  void keyPressed(){
    if (keyCode == LEFT){
      location.x--;
    }
    if (keyCode == RIGHT){
      location.x++;
    }
  }
  void move(){
    keyPressed();
  }
  void display(){
    fill(col);
    rect(location.x, location.y, w, h);
  }

}
