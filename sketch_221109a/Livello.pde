class Livello1{
  PImage s=loadImage("sfondo.png");
  float x,y;
  boolean [] q={true,true,true,false,false,false,true,true,true,false,true,true,true,false,false,false,true,true,true,true,true,true,true,true};
  
  Livello1(){}
  
  Blocco[] create1(){
    Blocco[] a=new Blocco[24];
    for(int i=0; i<24; i++)
      a[i]=new Blocco(250*i,height-130,q[i]);
    return a;
  }
  
  Blocco[] create2(){
    Blocco[] a=new Blocco[24];
    for(int i=0; i<24; i++)
      a[i]=new Blocco(250*i,height/2+100,!q[i]);
    return a;
  }
  
  Blocco [] b1=create1();
  Blocco [] b2=create2();
  
  void body(){
    imageMode(CORNER);
    image(s,x,y);
    for(int i=0; i<24; i++){
      b1[i].display(); 
      b2[i].display();
    }
  }
  
  void displayFuel(){
    displayFuel = (int)Pl.fuel; //Assegno ad un intero il varole a virgola mobile del fuel tramite un cast (int)
    if (Pl.fuel > 100) { //Per evitare false rappresentazioni, se il fuel dovesse superare il valore 100, gli viene riassegnato il medesimo valore.
      Pl.fuel = 100;
    }
    if (Pl.jetPackCharged == true) { //Se il jetpack è utilizzabile viene stampato il fuel rimanente
      fill(255);
      text(displayFuel + "%", 55, 40);
    } else { //Altrimenti viene stampato "Recharging" finchè non sarà nuovamente riutilizzabile
      fill(255);
      text("Recharging", 55, 40);
    }

  }
  
  void drawPlayer(){
      Pl.drawPlayer(); //Viene stampato nella canvas il giocatore
      if (!keyPressed || (keyPressed && key == 'A' || keyPressed && key == 'D' || keyPressed && key == 'a' || keyPressed && key == 'd')) { //Se non vengono premuti tasti o se vengono premuti i tasti per effettuare il movimento
        if (frameCount % 10 == 0) { //Ogni 10 frame effettuo l'animazione della bandiera
          if (Pl.turnedRight) {
            Pl.stillAnimation();
          } else {
            Pl.stillLeftAnimation();
          }
        }
      }
  }
  
  void playerAction(){
    Pl.actions(); //Vengono eseguite tutte le funzioni che permettono la giocabilità del Giocatore   
    Pl.jumpAnimation();
    Pl.jumpReset();
    Pl.drawfuel(); //Stampo nella canvas l'indicatore del fuel
    Pl.checkJetpack(); //Viene controllata la capacità rimanente del fuel
    Pl.fuelRegen(); //Viene rigenerato il fuel gradualmente

    
  }
  
  void display(){
    body();
    //move();
  }
}
