int lives = 3;
int screenNum = 0;
int level = 1;

public void setup(){
  size(800, 800);
  ArrayList<Brick> wall = new ArrayList<Brick>(160);
for (int i = 0; i < 200; i+=25){ 
  for (int j = 0; j < 800; j+= 80){ 
    Brick a = new Brick(j, i, 0, 0, 80, 25);
    wall.add(a);
    a.display();
  } 
}
}
    
    

public void draw(){
}
