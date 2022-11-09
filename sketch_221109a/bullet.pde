

class bullet{
  int x, y;
  int bulletSpeed = 2;
  
    
  bullet(int x1, int y1){
    this.x=x1 + 22;
    this.y = y1;
  }
  void drawBullet(){
    circle(x+45, y-8, 10);
  }
  
  int getX(){
    return x;
  }
  
  void moveBullet(bullet Bullet){
    if(Bullet.getX() < 2000){
      //if(frameCount % 30 == 0){
        println("Moving Bullet!");
        drawBullet();
        Bullet.x += bulletSpeed;
      //}
    }
  }
  
  
};
