class bullet{
  float x,y; //Vengono dichiarate le coordinate del proiettile
  PImage Bullet = loadImage("Resource/Images/PlayerBullet.png");
  bullet(float x, float y){ //Quando l'oggetto bullet viene inizializzato, il costruttore assegna la posizione del giocatore al proiettile
    this.x = x;
    this.y = y;
  }
  
 
  void body(){ //Draw del proiettile
    imageMode(CENTER);
    Bullet.resize(30,30);
    image(Bullet,x+50,y-5);
  }
  
  void bodyLeft(){
    imageMode(CENTER);
    Bullet.resize(30,30);
    image(Bullet,x-50,y-5);
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
