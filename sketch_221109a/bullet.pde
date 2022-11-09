

class bullet{
  float x,y;

  bullet(float x, float y){
    this.x = x;
    this.y = y;
  }

  void body(){
    fill(0,255,0);
    ellipse(x, y, 20, 20);
  }
  
  void move(){
    x+=5;
  }
  
  void display(){
    body();
    move();
  }
  
};
