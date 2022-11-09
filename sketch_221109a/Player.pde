class player{
  int x = 80, y = 645;
  int lifes = 3;
  float fuel = 100;
  boolean moving = false;
  boolean jumping = false;
  boolean jetPackCharged = true;
  PImage Player;
  PImage PlayerStill;
  PImage PlayerAnim1;
  PImage PlayerAnim2;
  PImage FlagAnim1;
  PImage FlagAnim2;
  
  int q = 0;
  boolean q1 = false;
  
  void stillAnimation(){
    if(q1){
       Player = FlagAnim1;
       q1=!q1;
    }
    else{
       Player = FlagAnim2;
       q1=!q1;
    }
  }
  
  void checkJetpack(){
    if(fuel > 35){
      jetPackCharged = true;
    }
  }
  
  void movingAnimation(){
    if(q == 0){
      Player = PlayerAnim1;
      q= 1;
    }
    else if(q == 1){
      Player = PlayerStill;
      q= 2;
    }
    else if(q == 2){
      Player = PlayerAnim2;
      q = 3;
    }
    else if(q == 3){
      Player = PlayerStill;
      q = 0;
    }
    
    if(jumping){
      Player = PlayerAnim1;
    }
   }
   
   void drawPlayer(){
     imageMode(CENTER);
     image(Player, x, y);
   }
  
   void drawfuel(){
     fill(250,242,8);
     rect(50, 910, 3 * fuel, 20);
   }
  
   void imageLoad(){
    this.PlayerStill = loadImage("Resource/Images/frame1.png");
    this.PlayerAnim1 = loadImage("Resource/Images/frame2.png");
    this.PlayerAnim2 = loadImage("Resource/Images/frame3.png");
    this.FlagAnim1 = loadImage("Resource/Images/frame_flag_pos1.png");
    this.FlagAnim2 = loadImage("Resource/Images/frame_flag_pos2.png");
    this.Player = this.PlayerAnim1;
  }
  
  void fuelRegen(){
    if(fuel < 100.0){
        fuel+= 0.4;
}
  }
  
  void checkDownBarrier(){
  if(y > 639){
    y = 638;
    jumping = false;
    }
  }
  
  void actions(){
    if(keyPressed && (key == 'D' || key == 'd')){
      moving = true;
      x+=3;
      }
      else if(keyPressed && (key == 'A' || key == 'a')){
        moving = true;
        x-=3;
      }
    else
       moving = false;
 
    if(moving){
      if(frameCount % 10 == 0){
      movingAnimation();
      }
    }
  
    if(keyPressed && key == ' '){
      stroke(255);
      fill(255);
      bullet Bullet = new bullet(Pl.x,Pl.y);
      Bullet.moveBullet(Bullet);
      delay(500);
      }

    if(keyPressed && (key == 'W' || key == 'w') && y>10){
      if(fuel > 4 && jetPackCharged){
      movingAnimation();
      jumping = true;
      y-=7;
      fuel -= 2.2;
      delay(20);
      }
      else{
        jetPackCharged = false;
        if(y < 638){
        y*= 1.018;
        println("Down");
        }
      }
    }
 
    if(keyPressed && (key == 'E' || key == 'e') && y>0){
      movingAnimation();
      jumping = true;
      y-=3;
      x+=4;
      fuel -= 2.5;
      delay(20);
      }
  
  
    if(keyPressed && (key == 'Q' || key == 'q') && y>0){
      movingAnimation();
      jumping = true;
      y-=3;
      x-=4;
      fuel -= 2.5;
      delay(20);
    }
  }
};
