player Pl = new player();

void setup(){
  size(1920, 1080);
  Pl.imageLoad();
}

void drawBullet(){
  bullet Bullet = new bullet(Pl.x,Pl.y);
  Bullet.drawBullet();
  print("Ciao");
  delay(30);
}

void draw(){
background(0);
stroke(255);
line(0, 700, width, 700);
fill(58, 63, 99);
if(!keyPressed){
  if(frameCount % 10 == 0){
    Pl.stillAnimation();
  }
}
Pl.drawStamina();
Pl.Player.resize(140,140);
Pl.drawPlayer();
Pl.staminaRegen();
Pl.checkDownBarrier();
Pl.actions();

if(frameCount % 60 == 0){
  println("x: " + Pl.x + " y: " + Pl.y + " Stamina: " + Pl.stamina+ "/100");
  
}
  
}
