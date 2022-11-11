class enemyBullet{
  float x, y;
  float s;
  Blocco b;
  PImage model = loadImage("Resource/Images/ominocarretto/redbullet.png");
  boolean v=true;
  boolean hit = false;
  
  enemyBullet(float X, float Y){
    this.x = X;
    this.y = Y;
    s=x;
  }
  
  void move(){
    x-=10;
    if(x+150 <= l.x ){
      x =  s;
      hit = false;
    }
    if(!hit){
    if(dist(x+l.x+60,y+60,Pl.x+60,Pl.y) <=30){
      Pl.lifes-=1;
      print(Pl.lifes);
      hit = true;
    }
    }
  }
  
  void body(){
    if(v==false)
      for(int j=0; j<model.pixels.length; j++)
        model.pixels[j]=color(0,0,0,0);
    model.resize(100,100);
    image(model, x+l.x,y);
  }
  
  void display(){
    body();
    move();
  }
}
