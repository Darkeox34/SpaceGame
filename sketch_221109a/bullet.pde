

class bullet{
  float x,y; //Vengono dichiarate le coordinate del proiettile

  bullet(float x, float y){ //Quando l'oggetto bullet viene inizializzato, il costruttore assegna la posizione del giocatore al proiettile
    this.x = x;
    this.y = y;
  }

  void body(){ //Draw del proiettile
    fill(0,255,0); 
    ellipse(x, y, 20, 20);
  }
  
  void move(){ //Movimento del proiettile
    x+=12;
  }
  
  void display(){ //Viene incrementata la x del proiettile e viene stampato il modello
    body();
    move();
  }
  
};
