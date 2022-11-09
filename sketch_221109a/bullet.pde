

class bullet{
  int x, y;
  
    
  bullet(int x1, int y1){
    x=x1;
    y = y1;
  }
  void drawBullet(){
    circle(x+45, y-8, 10);
  }
  
};
