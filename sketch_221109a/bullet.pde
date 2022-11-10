class bullet{
  float x,y; //Vengono dichiarate le coordinate del proiettile
  PImage Bullet = loadImage("Resource/Images/PlayerBullet.png");
  PImage RedBullet = loadImage("Resource/Images/ominocarretto/redbullet.png");
  PImage model;
  String type;
  bullet(float x, float y, String s){ //Quando l'oggetto bullet viene inizializzato, il costruttore assegna la posizione del giocatore al proiettile
    this.x = x;
    this.y = y;
    type = s;
    if(type == "Player")
      model = Bullet;
    else
      model = RedBullet;
    
  }
 
  float getX(){ return x;}
 
  void body(){ //Draw del proiettile
    imageMode(CENTER);
    model.resize(30,30);
    image(model,x+65,y-8);
  }
  
  void bodyLeft(){
    imageMode(CENTER);
    model.resize(30,30);
    image(model,x-50,y-5);
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
  }
  
  void displayLeft(){
    bodyLeft();
    moveLeft();
  }
  
};
