class bullet{
  float x,y; //Vengono dichiarate le coordinate del proiettile
  PImage Bullet = loadImage("Resource/Images/PlayerBullet.png");
  PImage model;
  String type;
  boolean v=true;
  bullet(float x, float y, String s){ //Quando l'oggetto bullet viene inizializzato, il costruttore assegna la posizione del giocatore al proiettile
    this.x = x;
    this.y = y;
    type = s;
    if(type == "Player")
      model = Bullet;
    
  }
 
  float getX(){ return x;}
 
  void body(){ //Draw del proiettile
    model.resize(50,50);
    image(model,x+115,y-42);
  }
  
  void bodyLeft(){
    model.resize(50,50);
    image(model,x-60,y-42);
  }
  
  void move(){ //Movimento del proiettile
    x+=12;
  }
  
  void moveLeft(){
    x-=12;
  }
  
  void display(){ //Viene incrementata la x del proiettile e viene stampato il modello
    body();
    move();
    for(int i = 0; i < 3; i++){
    if(dist(x+125,y-5,l.om[i].x+100+l.x,l.om[i].y+50) <=30 && x+125 <= width && v==true){
      l.om[i].v=false;
      l.bullet[i].v=false;
      v=false;
    }
    }
    for(int i = 0; i < 5; i++){
    if(dist(x+125,y-5,l.r[i].x+70+l.x,l.r[i].y+50) <=30 && x+125 <= width && v==true){
      l.r[i].v=false;
      v=false;
    }
    }
  }
  
  void displayLeft(){
    bodyLeft();
    moveLeft();
    for(int i = 0; i < 3; i++){
    if(dist(x+125,y-5,l.om[i].x+100+l.x,l.om[i].y+50) <=30 && x+125 <= width && v==true){
      l.om[i].v=false;
      l.bullet[i].v=false;
      v=false;
    }
    }
    for(int i = 0; i < 5; i++){
    if(dist(x+125,y-5,l.r[i].x+70+l.x,l.r[i].y+50) <=30 && x+125 <= width && v==true){
      l.r[i].v=false;
      v=false;
    }
    }
  }

  
};
