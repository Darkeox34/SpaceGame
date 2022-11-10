class player{
  int x = 80, y = 645; //Coordinate Giocatore
  int lifes = 3; //Vite Player
  float fuel = 100; //Fuel Player
  boolean moving = false; //Se il giocatore si sta muovendo
  boolean jumping = false; //Se il giocatore è in volo o sta saltando
  boolean jetPackCharged = true; //Se il jetpack ha superato il 35%
  PImage Player; //L'immagine che viene stampata nella canvas del giocatore
  PImage PlayerStill; //Immagine del giocatore fermo
  PImage PlayerAnim1; //Primo frame dell'animazione per camminare
  PImage PlayerAnim2; //Secondo frame dell'animazione per camminare
  PImage FlagAnim1; //Primo frame della bandiera animata
  PImage FlagAnim2; //Secondo frame della bandiera animata
  int q = 0; //Switch per i frame dell'animazione del movimento
  boolean q1 = false; //Booleano per i frame dell'animazione della bandiera
  boolean keyIsReleased = true; //Booleano per capire se un pulsante è stato rilasciato
  bullet b; //Creazione dell'oggetto b della classe Bullet
  
  ArrayList<bullet> bs = new ArrayList<bullet>(); //Arraylist di bullet 
  
  
  void shoot(){ //Aggiunge un nuovo oggetto bullet all'arraylist
      bs.add(new bullet(x,y));
  }
  
  void stillAnimation(){ //Animazione per la bandiera
    if(q1){
       Player = FlagAnim1;
       q1=!q1;
    }
    else{
       Player = FlagAnim2;
       q1=!q1;
    }
  }
  
  void checkJetpack(){ //Controlla se il jetpack ha abbastanza fuel per essere riutilizzato
    if(fuel > 35){
      jetPackCharged = true;
    }
  }
  
  void movingAnimation(){ //Animazione del movimento
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
    
    if(jumping){  //Se il player sta saltando, viene utilizzato il frame del salto
      Player = PlayerAnim1;
    }
   }
   
   void drawPlayer(){  //Funzione per stampare nella canvas il player
     imageMode(CENTER);
     image(Player, x, y);
   }
  
   void drawfuel(){  //Funzione per stampare nella canvas l'indicatore del fuel
     fill(250,242,8);
     rect(50, 910, 3 * fuel, 20);
   }
  
   void imageLoad(){  //Funzione assegnare alle PImage le corrispettive immagini
    this.PlayerStill = loadImage("Resource/Images/frame1.png");
    this.PlayerAnim1 = loadImage("Resource/Images/frame2.png");
    this.PlayerAnim2 = loadImage("Resource/Images/frame3.png");
    this.FlagAnim1 = loadImage("Resource/Images/frame_flag_pos1.png");
    this.FlagAnim2 = loadImage("Resource/Images/frame_flag_pos2.png");
    this.Player = this.PlayerAnim1;
  }
  
  void fuelRegen(){  //Se il fuel non ha raggiunto il pieno, viene ricaricato gradualmente
    if(fuel < 100.0){
        fuel+= 0.4;
}
  }
  
  void checkDownBarrier(){  //Se il giocatore prova a superare la barriera del terreno, viene riassegnato al limite del terreno
  if(y > 639){
    y = 638;
    jumping = false;
    }
  }
  
  void actions(){ //Funzione che contiene i vari movimenti delle entità quali Proiettili e movimenti vari del giocatore
  
    if(keyIsReleased == false){
      frameCounter++;
      if(frameCounter > 50){
        keyIsReleased = true;
      }
    }
  
      for(bullet b:bs){  //Questo ciclo viene ripetuto finchè il bullet esiste
        b.display();
      }
    
    if(dPressed && !aPressed && !ePressed && !wPressed /* &&!spacePressed*/ && !qPressed){  //Se un tasto viene premuto ed il tasto premuto corrisponde a D, il giocatore si muoverà verso destra
      moving = true; 
      x+=3; //Incremento della coordinata x per permettere lo spostamento del giocatore verso destra
      }
    else if(aPressed && !dPressed && !ePressed && !wPressed /*&&!spacePressed*/ && !qPressed){
      moving = true;
      x-=3; //Decremento della coordinata x per permettere lo spostamento del giocatore verso sinistra
      }
    else
       moving = false;
 
    if(moving && !jumping){ //Se il giocatore si sta muovendo, allora viene eseguita l'animazione del movimento ogni 10 frame
      if(frameCount % 10 == 0){
      movingAnimation();
      }
    }
  

      if(spacePressed && /*!aPressed && !dPressed &&*/ !ePressed && !qPressed){ //Se viene premuto il tasto SPACEBAR, viene sparato un proiettile
        {
          if(keyIsReleased){
            thread("shoot"); //Esegue la funzione shoot in un altro thread per ottimizzare il gameplay e permettere di eseguire più azioni contemporaneamente
            keyIsReleased = false;
          }
        }
      }

    if((wPressed && !dPressed && !ePressed && !spacePressed && !qPressed) && y>10){ //Se il tasto W viene premuto ed il giocatore non ha superato il bordo superiore del mondo, viene incrementata la coordinata Y attivando il jetpack
      if(fuel > 4 && jetPackCharged){ //Se il fuel è maggiore di 4 ed il jetpack è carico
      movingAnimation(); //Viene eseguita l'animazione del movimento
      jumping = true; //Viene assegnato true alla variabile jumping per riconoscere quando un giocatore è in volo
      y-=4; //Viene decrementata la variabile y per permettere di spostarsi verso l'alto
      fuel -= 1.5; //Viene decrementato il fuel in modo graduale
      //delay(20); //Delay per evitare di avere falsi input
      }
      else{
        jetPackCharged = false; //Se il fuel è minore di 4 allora il jetpack ha bisogno di essere caricato
        if(y < 638){
        y*= 1.018;  //Un moltiplicatore per incrementare la Y e simulare la gravità
        }
      }
    }
 
    if((ePressed && !dPressed && !qPressed && !spacePressed && !qPressed) && y>10){ //Se il tasto E viene premuto, questa funzione permette di spostarsi sia nell'asse delle Y sia nell'asse delle X, effettuando uno spostamento in diagonale
      if(fuel > 4 && jetPackCharged){ //Stesso funzionamento descritto nella funzione precedente per il resto del codice
      movingAnimation();
      jumping = true;
      y-=3.5;
      x+=4;
      fuel -= 2.5;
      delay(20);
      }
      else{
        jetPackCharged = false;
        if(y < 638){
          y*=1.018;
        }
      }
      }
  
  
    if(keyPressed && (key == 'Q' || key == 'q') && y>10){
      if(fuel > 4 && jetPackCharged){
      movingAnimation();
      jumping = true;
      y-=3;
      x-=4;
      fuel -= 2.5;
      delay(20);
      }
      else{
        jetPackCharged = false;
        if(y < 638){
          y*=1.018;
        }
      }

    }
  }
};
