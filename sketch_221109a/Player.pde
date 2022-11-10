class player{
  int x = 80, y = 645; //Coordinate Giocatore
  int lifes = 3; //Vite Player
  float fuel = 100; //Fuel Player
  boolean moving = false; //Se il giocatore si sta muovendo
  boolean jumping = false; //Se il giocatore è in volo o sta saltando
  boolean jetPackCharged = true; //Se il jetpack ha superato il 35%
  PImage Player; //L'immagine che viene stampata nella canvas del giocatore
  PImage RightPlayerStill; //Immagine del giocatore fermo
  PImage RightPlayerFrame1; //Primo frame dell'animazione per camminare
  PImage RightPlayerFrame2; //Secondo frame dell'animazione per camminare
  PImage LeftPlayerStill;
  PImage LeftPlayerFrame1;
  PImage LeftPlayerFrame2;
  PImage LeftFlagAnim1;
  PImage LeftFlagAnim2;
  PImage RightFlagAnim1; //Primo frame della bandiera animata
  PImage RightFlagAnim2; //Secondo frame della bandiera animata
  int qR = 0; //Switch per i frame dell'animazione del movimento
  int qL = 0;
  boolean q1 = false; //Booleano per i frame dell'animazione della bandiera
  boolean qL1 = false;
  boolean keyIsReleased = true; //Booleano per capire se un pulsante è stato rilasciato
  boolean turnedLeft = false;
  boolean turnedRight = true;
  bullet b; //Creazione dell'oggetto b della classe Bullet
  
  ArrayList<bullet> bsR = new ArrayList<bullet>(); //Arraylist di bullet per muoversi verso destra
  ArrayList<bullet> bsL = new ArrayList<bullet>(); //Arraylist di bullet per muoversi verso sinistra 
  
  
  void shootRight(){ //Aggiunge un nuovo oggetto bullet all'arraylist
      bsR.add(new bullet(x,y));
  }
  
  void shootLeft(){
      bsL.add(new bullet(x,y));
  }
  
  void stillAnimation(){ //Animazione per la bandiera
    if(q1){
       Player = RightFlagAnim1;
       q1=!q1;
    }
    else{
       Player = RightFlagAnim2;
       q1=!q1;
    }
  }
  
  void stillLeftAnimation(){
    if(qL1){
       Player = LeftFlagAnim2;
       qL1=!qL1;
    }
    else{
       Player = LeftFlagAnim1;
       qL1=!qL1;
    }    
  }
  
  void checkJetpack(){ //Controlla se il jetpack ha abbastanza fuel per essere riutilizzato
    if(fuel > 35){
      jetPackCharged = true;
    }
  }
  
  void movingLeftAnimation(){
     if(qL == 0){
      Player = LeftPlayerFrame1;
      qL= 1;
    }
    else if(qL == 1){
      Player = LeftFlagAnim2;
      qL= 2;
    }
    else if(qL == 2){
      Player = LeftPlayerFrame2;
      qL = 3;
    }
    else if(qL == 3){
      Player = LeftFlagAnim2;
      qL = 0;
    }
  }
  
  void movingAnimation(){ //Animazione del movimento
    if(qR == 0){
      Player = RightPlayerFrame1;
      qR= 1;
    }
    else if(qR == 1){
      Player = RightPlayerStill;
      qR= 2;
    }
    else if(qR == 2){
      Player = RightPlayerFrame2;
      qR = 3;
    }
    else if(qR == 3){
      Player = RightPlayerStill;
      qR = 0;
    }
    
    if(jumping){  //Se il player sta saltando, viene utilizzato il frame del salto
      Player = RightPlayerFrame1;
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
    this.RightPlayerStill = loadImage("Resource/Images/frame1.png");
    this.RightPlayerFrame1 = loadImage("Resource/Images/frame2.png");
    this.RightPlayerFrame2 = loadImage("Resource/Images/frame3.png");
    this.RightFlagAnim1 = loadImage("Resource/Images/frame_flag_pos1.png");
    this.RightFlagAnim2 = loadImage("Resource/Images/frame_flag_pos2.png");
    this.LeftPlayerStill = loadImage("Resource/Images/left_frame_flag_pos1.png");
    this.LeftPlayerFrame1 = loadImage("Resource/Images/leftframe1.png");
    this.LeftPlayerFrame2 = loadImage("Resource/Images/leftframe2.png");
    this.LeftFlagAnim1 = loadImage("Resource/Images/left_frame_flag_pos1.png");
    this.LeftFlagAnim2 = loadImage("Resource/Images/left_frame_flag_pos2.png");
    this.Player = this.RightPlayerFrame1;
  }
  
  void fuelRegen(){  //Se il fuel non ha raggiunto il pieno, viene ricaricato gradualmente
    if(fuel < 100.0){
        fuel+= 0.4;
}
  }
  
  void checkDownBarrier(){  //Se il giocatore prova a superare la barriera del terreno, viene riassegnato al limite del terreno
  if(y > 638){
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
  
      for(bullet b:bsR){  //Questo ciclo viene ripetuto finchè il bullet esiste
        b.display();
      }
      for(bullet b:bsL){
        b.displayLeft();
      }
    
    if(dPressed && !aPressed){
      turnedRight = true;
      turnedLeft = false;
      moving = true; //Se un tasto viene premuto ed il tasto premuto corrisponde a D, il giocatore si muoverà verso destra
      x+=3; //Incremento della coordinata x per permettere lo spostamento del giocatore verso destra
      }
    else if(aPressed && !dPressed){
      turnedLeft = true;
      turnedRight = false;
      moving = true;
      x-=3; //Decremento della coordinata x per permettere lo spostamento del giocatore verso sinistra
      }
    else
       moving = false;
 
    if(moving && !jumping){ //Se il giocatore si sta muovendo, allora viene eseguita l'animazione del movimento ogni 10 frame
      if(turnedRight){
        if(frameCount % 10 == 0){
          movingAnimation();
        }
      }
      else{
        if(frameCount % 10 == 0){
          movingLeftAnimation();
        }
      }
        
    }
  

      if(spacePressed){ //Se viene premuto il tasto SPACEBAR, viene sparato un proiettile
        {
          if(keyIsReleased){
             if(turnedRight){
              thread("shootRight"); //Esegue la funzione shootRight in un altro thread per ottimizzare il gameplay e permettere di eseguire più azioni contemporaneamente
              keyIsReleased = false;
             }
             else if(turnedLeft){
               thread("shootLeft");
               keyIsReleased = false;
             }
          }
        }
      }

  }
};
