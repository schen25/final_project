class Brick{ 
  
int width;
int height; 
int xCor; 
int yCor;
color c;
int hitsNeeded;
PVector velocity;

void move(){ 
  
} 

void display(){
    stroke(1);
    strokeWeight(2);
    fill(c);
    rect(xCor, xCor, width, height);
  }
  
} 
