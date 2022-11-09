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
if(!keyPressed || (keyPressed && key == 'A' || keyPressed && key == 'D' || keyPressed && key == 'a' || keyPressed && key == 'd')){
  if(frameCount % 10 == 0){
    Pl.stillAnimation();
  }
  Pl.y += 5;
}
Pl.drawfuel();
Pl.Player.resize(140,140);
Pl.drawPlayer();
Pl.checkJetpack();
Pl.fuelRegen();
Pl.checkDownBarrier();
Pl.actions();
if(Pl.fuel > 100){
  Pl.fuel = 100;
}
if(Pl.jetPackCharged == true){
fill(255);
text(Pl.fuel + "%", 50, 900);
}
else{
fill(255);
text("Recharging", 50, 900);
}


if(frameCount % 60 == 0){
  println("x: " + Pl.x + " y: " + Pl.y + " Stamina: " + Pl.fuel+ "/100");
  
}
  
}
